/*
 * Created by Ubique Innovation AG
 * https://www.ubique.ch
 * Copyright (c) 2020. All rights reserved.
 */

import Foundation
import SQLite

/// Wrapper class for all Databases
class DP3TDatabase {
    /// Database connection
    private let connection: Connection

    /// flag used to set Database as destroyed
    private(set) var isDestroyed = false

    #if CALIBRATION
        public weak var logger: LoggingDelegate?
    #endif

    /// application Storage
    private let _applicationStorage: ApplicationStorage
    var applicationStorage: ApplicationStorage {
        guard !isDestroyed else { fatalError("Database is destroyed") }
        return _applicationStorage
    }

    /// handshaked Storage
    private let _handshakesStorage: HandshakesStorage
    var handshakesStorage: HandshakesStorage {
        guard !isDestroyed else { fatalError("Database is destroyed") }
        return _handshakesStorage
    }

    /// contacts Storage
    private let _contactsStorage: ContactsStorage
    var contactsStorage: ContactsStorage {
        guard !isDestroyed else { fatalError("Database is destroyed") }
        return _contactsStorage
    }

    /// exposure days Storage
    private let _exposureDaysStorage: ExposureDaysStorage
    var exposureDaysStorage: ExposureDaysStorage {
        guard !isDestroyed else { fatalError("Database is destroyed") }
        return _exposureDaysStorage
    }

    /// knowncase Storage
    private let _knownCasesStorage: KnownCasesStorage
    var knownCasesStorage: KnownCasesStorage {
        guard !isDestroyed else { fatalError("Database is destroyed") }
        return _knownCasesStorage
    }

   
        /// logging Storage
        private let _logggingStorage: LoggingStorage
        var loggingStorage: LoggingStorage {
            guard !isDestroyed else { fatalError("Database is destroyed") }
            return _logggingStorage
        }

        /// secret keys storage
        private let _secretKeysStorage: SecretKeysStorage
        var secretKeysStorage: SecretKeysStorage {
            guard !isDestroyed else { fatalError("Database is destroyed") }
            return _secretKeysStorage
        }

        /// secret keys storage
        private let _deviceInfo: DeviceInfoStorage
        var deviceInfo: DeviceInfoStorage {
            guard !isDestroyed else { fatalError("Database is destroyed") }
            return _deviceInfo
        }
  

    /// Initializer
    init(connection_: Connection? = nil) throws {
        if let connection = connection_ {
            self.connection = connection
        } else {
            var filePath = DP3TDatabase.getDatabasePath()
            connection = try Connection(filePath.absoluteString, readonly: false)
            try? filePath.addExcludedFromBackupAttribute()
        }
        _knownCasesStorage = try KnownCasesStorage(database: connection)
        _handshakesStorage = try HandshakesStorage(database: connection)
        _contactsStorage = try ContactsStorage(database: connection, knownCasesStorage: _knownCasesStorage)
        _exposureDaysStorage = try ExposureDaysStorage(database: connection)
        _applicationStorage = try ApplicationStorage(database: connection)
      
            _logggingStorage = try LoggingStorage(database: connection)
            _secretKeysStorage = try SecretKeysStorage(database: connection)
            _deviceInfo = try DeviceInfoStorage(database: connection)
            try _deviceInfo.set()
        

        DispatchQueue.global(qos: .background).async {
            try? self.deleteOldDate()
        }
    }

    // deletes data older than CryptoConstants.numberOfDaysToKeepData
    func deleteOldDate() throws {
        try contactsStorage.deleteOldContacts()
        try handshakesStorage.deleteOldHandshakes()
        try knownCasesStorage.deleteOldKnownCases()
        try exposureDaysStorage.deleteExpiredExpsureDays()
    }

    /// Generates contacts from handshakes and deletes handshakes
    /// Should be called ragulary to ensure completenes of contacts
    /// - Throws: if error happens
    func generateContactsFromHandshakes() throws {
        try deleteOldDate()
        let epochStart = DP3TCryptoModule.getEpochStart()
        let handshakes = try handshakesStorage.getAll(olderThan: epochStart)
        let contacts = ContactFactory.contacts(from: handshakes)
        contacts.forEach(contactsStorage.add(contact:))
        #if !CALIBRATION
            try handshakesStorage.delete(handshakes)
        #endif
        try contactsStorage.deleteOldContacts()
    }

    /// Discard all data
    func emptyStorage() throws {
        guard !isDestroyed else { fatalError("Database is destroyed") }
        try connection.transaction {
            try handshakesStorage.emptyStorage()
            try knownCasesStorage.emptyStorage()
            #if CALIBRATION
                try loggingStorage.emptyStorage()
                try secretKeysStorage.emptyStorage()
            #endif
            try contactsStorage.emptyStorage()
            try exposureDaysStorage.emptyStorage()
        }
    }

    /// delete Database
    func destroyDatabase() throws {
        let path = DP3TDatabase.getDatabasePath().absoluteString
        if FileManager.default.fileExists(atPath: path) {
            try FileManager.default.removeItem(atPath: path)
        }
        isDestroyed = true
    }

    /// get database path
    private static func getDatabasePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory.appendingPathComponent("DP3T_tracing_db").appendingPathExtension("sqlite")
    }
}

extension DP3TDatabase: CustomDebugStringConvertible {
    var debugDescription: String {
        return "DB at path <\(DP3TDatabase.getDatabasePath().absoluteString)>"
    }
}
