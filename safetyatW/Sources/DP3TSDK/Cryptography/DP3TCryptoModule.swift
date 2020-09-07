/*
 * Created by Ubique Innovation AG
 * https://www.ubique.ch
 * Copyright (c) 2020. All rights reserved.
 */

import CommonCrypto
import Foundation

/// Implements the ephID and secretkey handling
/// as specified in https://github.com/DP-3T/documents
class DP3TCryptoModule {
    private let store: SecureStorageProtocol

    #if CALIBRATION
        weak var debugSecretKeysStorageDelegate: SecretKeysStorageDelegate? {
            didSet {
                if let storage = store as? SecureStorage {
                    storage.debugSecretKeysStorageDelegate = debugSecretKeysStorageDelegate
                }
            }
        }
    #endif

    /// Initilized the module
    /// - Parameter store: storage to use to persist secretkeys and ephIDs
    init(store: SecureStorageProtocol = SecureStorage()) throws {
        self.store = store
        do {
            let keys = try store.getSecretKeys()
            if keys.isEmpty {
                try generateInitialSecretKey()
            }
        } catch KeychainError.notFound {
            try generateInitialSecretKey()
        }
    }

    /// method to generate a secret key based on its predecessor
    /// - Parameter SKt0: secret key predecessor
    /// - Returns: next secret key
    private func getSKt1(SKt0: Data) -> Data {
        return Crypto.sha256(SKt0)
    }

    /// Generates new secret key and discards oldest ones if we have more than CryptoConstants.numberOfDaysToKeepData stored
    /// - Throws: throws is a error happens
    private func rotateSK() throws {
        var keys = try store.getSecretKeys()
        guard let firstKey = keys.first else {
            throw CryptoError.dataIntegrity
        }
        let nextDay = firstKey.day.getNext()
        let sKt1 = getSKt1(SKt0: firstKey.keyData)
        keys.insert(SecretKey(day: nextDay, keyData: sKt1), at: 0)
        let keysToStore = Array(keys.prefix(Default.shared.parameters.crypto.numberOfDaysToKeepData))
        try store.setSecretKeys(keysToStore)
    }

    /// get secret day of given day
    /// - Parameter day: optional day for secret key, defaults to today
    /// - Throws: throws if a error occurs
    /// - Returns: the secret key
    internal func getCurrentSK(day: DayDate = DayDate()) throws -> Data {
        var keys = try store.getSecretKeys()
        if let key = keys.first(where: { $0.day == day }) {
            return key.keyData
        }
        while keys.first!.day < day {
            try rotateSK()
            keys = try store.getSecretKeys()
        }
        guard let firstKey = keys.first,
            firstKey.day.timestamp == day.timestamp else {
            throw CryptoError.dataIntegrity
        }
        return firstKey.keyData
    }

    /// generates ephIDs based on secret key
    /// - Parameter secretKey: secret key to base ephIDs on
    /// - Throws: throws if a error happens
    /// - Returns: the ephIDs
    internal static func createEphIDs(secretKey: Data) throws -> [EphID] {
        let hmac = Crypto.hmac(msg: Default.shared.parameters.crypto.broadcastKey, key: secretKey)

        let zeroData = Data(count: Default.shared.parameters.crypto.keyLength * Default.shared.parameters.crypto.numberOfEpochsPerDay)

        let aes = try Crypto.AESCTREncrypt(keyData: hmac)

        var ephIDs = [Data]()
        let prgData = try aes.encrypt(data: zeroData)
        for i in 0 ..< Default.shared.parameters.crypto.numberOfEpochsPerDay {
            let pos = i * Default.shared.parameters.crypto.keyLength
            ephIDs.append(prgData[pos ..< pos + Default.shared.parameters.crypto.keyLength])
        }

        ephIDs.shuffle()

        return ephIDs
    }

    /// retrieves the ephIDs for a given day
    ///  either from storage or they get generate on demand
    /// - Parameter day: optional day for ephIDs, defaults to today
    /// - Throws: throws if a error happens
    /// - Returns: the ephIDs
    public func getEphIDsForToday(day: DayDate = DayDate()) throws -> [EphID] {
        var stored = try? store.getEphIDs()
        if stored == nil || stored?.day != day {
            let currentSk = try getCurrentSK(day: day)
            let ephIDs = try DP3TCryptoModule.createEphIDs(secretKey: currentSk)
            stored = EphIDsForDay(day: day, ephIDs: ephIDs)
            try store.setEphIDs(stored!)
        }
        return stored!.ephIDs
    }

    /// retrieve current ephID
    /// - Parameter timestamp: optional timestamp for ephIDs, defaults to now
    /// - Throws: throws if a error happens
    /// - Returns: the ephID
    internal func getCurrentEphID(timestamp: Date = Date()) throws -> EphID {
        let day = DayDate(date: timestamp)
        let ephIDs = try getEphIDsForToday(day: day)
        let counter = DP3TCryptoModule.getEpochCounter(day: day, timestamp: timestamp)
        return ephIDs[counter]
    }

    /// get the epoch counter by given day and timestamp
    /// - Parameters:
    ///   - day: the day
    ///   - timestamp: the timestamp
    /// - Returns: the count of the current epoch
    public static func getEpochCounter(day: DayDate, timestamp: Date) -> Int {
        return Int((timestamp.timeIntervalSince1970 - day.timestamp) / Double(Default.shared.parameters.crypto.secondsPerEpoch))
    }

    /// get the timestamp when the current epoch started
    public static func getEpochStart(timestamp: Date = Date()) -> Date {
        let currentDay = DayDate(date: timestamp)
        let counter = DP3TCryptoModule.getEpochCounter(day: currentDay, timestamp: timestamp)
        return currentDay.dayMin.addingTimeInterval(Double(counter * Int(Default.shared.parameters.crypto.secondsPerEpoch)))
    }

    /// check if we had handshakes with a contact given its secretkey
    /// - Parameters:
    ///   - secretKey: the secret key of the contact
    ///   - onsetDate: the day on which onwards the contact published its secret key
    ///   - bucketDate: the day on which the contact published its secret key
    ///   - getContacts: a callback to retreive contacts for a given day
    /// - Throws: throws if a error occurs
    /// - Returns: all contacts that match
    internal func checkContacts(secretKey: Data, onsetDate: DayDate, bucketDate: Date, getContacts: (DayDate) -> ([Contact])) throws -> [Contact] {
        var dayToTest: DayDate = onsetDate
        var secretKeyForDay: Data = secretKey
        var matchingContacts: [Contact] = []
        while dayToTest.timestamp <= bucketDate.timeIntervalSince1970 {
            let contactsOnDay = getContacts(dayToTest)
            guard !contactsOnDay.isEmpty else {
                dayToTest = dayToTest.getNext()
                secretKeyForDay = getSKt1(SKt0: secretKeyForDay)
                continue
            }

            // generate all ephIDs for day
            let ephIDs = Set(try DP3TCryptoModule.createEphIDs(secretKey: secretKeyForDay))
            // check all handshakes if they match any of the ephIDs
            // make sure that all contact date is before bucket date
            for contact in contactsOnDay where bucketDate >= contact.date {
                if ephIDs.contains(contact.ephID) {
                    matchingContacts.append(contact)
                }
            }

            // update day to next day and rotate sk accordingly
            dayToTest = dayToTest.getNext()
            secretKeyForDay = getSKt1(SKt0: secretKeyForDay)
        }
        return matchingContacts
    }

    /// retreives the secret key to publish for a given day
    /// - Parameter onsetDate: the day
    /// - Throws: throws if a error happens
    /// - Returns: the secret key and the date
    internal func getSecretKeyForPublishing(onsetDate: Date) throws -> (DayDate, Data) {
        let keys = try store.getSecretKeys()
        guard keys.isEmpty == false else {
            fatalError("No Secret keys were found in storage")
        }
        let day = DayDate(date: onsetDate)
        var lastIndexChecked: Int = 0
        while lastIndexChecked < (keys.count - 1) {
            let key = keys[lastIndexChecked]
            if key.day <= day {
                break
            }
            lastIndexChecked += 1
        }

        let key = keys[lastIndexChecked]
        return (key.day, key.keyData)
    }

    /// reset data
    public func reset() {
        store.removeAllObject()
    }

    /// Reset and generate new key after it was published
    public func reinitialize() throws {
        reset()
        try generateInitialSecretKey()
    }

    /// generate initial secret key
    /// - Throws: throws if a error occurs
    private func generateInitialSecretKey() throws {
        let keyData = try Crypto.generateRandomKey()
        try store.setSecretKeys([SecretKey(day: DayDate(), keyData: keyData)])
    }
}
