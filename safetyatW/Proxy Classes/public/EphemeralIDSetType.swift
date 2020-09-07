// # Proxy Compiler 20.3.2-74d649-20200526

import Foundation
import SAPOData

open class EphemeralIDSetType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var eid_: Property = V2Metadata.EntityTypes.ephemeralIDSetType.property(withName: "EID")

    private static var deviceID_: Property = V2Metadata.EntityTypes.ephemeralIDSetType.property(withName: "DeviceID")

    private static var createdAt_: Property = V2Metadata.EntityTypes.ephemeralIDSetType.property(withName: "CreatedAt")

    private static var toDevice_: Property = V2Metadata.EntityTypes.ephemeralIDSetType.property(withName: "toDevice")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: V2Metadata.EntityTypes.ephemeralIDSetType)
    }

    open class func array(from: EntityValueList) -> [EphemeralIDSetType] {
        return ArrayConverter.convert(from.toArray(), [EphemeralIDSetType]())
    }

    open func copy() -> EphemeralIDSetType {
        return CastRequired<EphemeralIDSetType>.from(self.copyEntity())
    }

    open class var createdAt: Property {
        get {
            objc_sync_enter(EphemeralIDSetType.self)
            defer { objc_sync_exit(EphemeralIDSetType.self) }
            do {
                return EphemeralIDSetType.createdAt_
            }
        }
        set(value) {
            objc_sync_enter(EphemeralIDSetType.self)
            defer { objc_sync_exit(EphemeralIDSetType.self) }
            do {
                EphemeralIDSetType.createdAt_ = value
            }
        }
    }

    open var createdAt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: EphemeralIDSetType.createdAt))
        }
        set(value) {
            self.setOptionalValue(for: EphemeralIDSetType.createdAt, to: value)
        }
    }

    open class var deviceID: Property {
        get {
            objc_sync_enter(EphemeralIDSetType.self)
            defer { objc_sync_exit(EphemeralIDSetType.self) }
            do {
                return EphemeralIDSetType.deviceID_
            }
        }
        set(value) {
            objc_sync_enter(EphemeralIDSetType.self)
            defer { objc_sync_exit(EphemeralIDSetType.self) }
            do {
                EphemeralIDSetType.deviceID_ = value
            }
        }
    }

    open var deviceID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: EphemeralIDSetType.deviceID))
        }
        set(value) {
            self.setOptionalValue(for: EphemeralIDSetType.deviceID, to: StringValue.of(optional: value))
        }
    }

    open class var eid: Property {
        get {
            objc_sync_enter(EphemeralIDSetType.self)
            defer { objc_sync_exit(EphemeralIDSetType.self) }
            do {
                return EphemeralIDSetType.eid_
            }
        }
        set(value) {
            objc_sync_enter(EphemeralIDSetType.self)
            defer { objc_sync_exit(EphemeralIDSetType.self) }
            do {
                EphemeralIDSetType.eid_ = value
            }
        }
    }

    open var eid: String? {
        get {
            return StringValue.optional(self.optionalValue(for: EphemeralIDSetType.eid))
        }
        set(value) {
            self.setOptionalValue(for: EphemeralIDSetType.eid, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(eid: String?) -> EntityKey {
        return EntityKey().with(name: "EID", value: StringValue.of(optional: eid))
    }

    open var old: EphemeralIDSetType {
        return CastRequired<EphemeralIDSetType>.from(self.oldEntity)
    }

    open class var toDevice: Property {
        get {
            objc_sync_enter(EphemeralIDSetType.self)
            defer { objc_sync_exit(EphemeralIDSetType.self) }
            do {
                return EphemeralIDSetType.toDevice_
            }
        }
        set(value) {
            objc_sync_enter(EphemeralIDSetType.self)
            defer { objc_sync_exit(EphemeralIDSetType.self) }
            do {
                EphemeralIDSetType.toDevice_ = value
            }
        }
    }

    open var toDevice: DeviceSetType? {
        get {
            return CastOptional<DeviceSetType>.from(self.optionalValue(for: EphemeralIDSetType.toDevice))
        }
        set(value) {
            self.setOptionalValue(for: EphemeralIDSetType.toDevice, to: value)
        }
    }
}
