// # Proxy Compiler 20.3.2-74d649-20200526

import Foundation
import SAPOData

open class ProximityDetectedSetType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var createdAt_: Property = V2Metadata.EntityTypes.proximityDetectedSetType.property(withName: "CreatedAt")

    private static var eidInfected_: Property = V2Metadata.EntityTypes.proximityDetectedSetType.property(withName: "EIDInfected")

    private static var eidMatched_: Property = V2Metadata.EntityTypes.proximityDetectedSetType.property(withName: "EIDMatched")

    private static var eventTS_: Property = V2Metadata.EntityTypes.proximityDetectedSetType.property(withName: "EventTS")

    private static var toPotentialInfectedEID_: Property = V2Metadata.EntityTypes.proximityDetectedSetType.property(withName: "toPotentialInfectedEID")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: V2Metadata.EntityTypes.proximityDetectedSetType)
    }

    open class func array(from: EntityValueList) -> [ProximityDetectedSetType] {
        return ArrayConverter.convert(from.toArray(), [ProximityDetectedSetType]())
    }

    open func copy() -> ProximityDetectedSetType {
        return CastRequired<ProximityDetectedSetType>.from(self.copyEntity())
    }

    open class var createdAt: Property {
        get {
            objc_sync_enter(ProximityDetectedSetType.self)
            defer { objc_sync_exit(ProximityDetectedSetType.self) }
            do {
                return ProximityDetectedSetType.createdAt_
            }
        }
        set(value) {
            objc_sync_enter(ProximityDetectedSetType.self)
            defer { objc_sync_exit(ProximityDetectedSetType.self) }
            do {
                ProximityDetectedSetType.createdAt_ = value
            }
        }
    }

    open var createdAt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: ProximityDetectedSetType.createdAt))
        }
        set(value) {
            self.setOptionalValue(for: ProximityDetectedSetType.createdAt, to: value)
        }
    }

    open class var eidInfected: Property {
        get {
            objc_sync_enter(ProximityDetectedSetType.self)
            defer { objc_sync_exit(ProximityDetectedSetType.self) }
            do {
                return ProximityDetectedSetType.eidInfected_
            }
        }
        set(value) {
            objc_sync_enter(ProximityDetectedSetType.self)
            defer { objc_sync_exit(ProximityDetectedSetType.self) }
            do {
                ProximityDetectedSetType.eidInfected_ = value
            }
        }
    }

    open var eidInfected: String? {
        get {
            return StringValue.optional(self.optionalValue(for: ProximityDetectedSetType.eidInfected))
        }
        set(value) {
            self.setOptionalValue(for: ProximityDetectedSetType.eidInfected, to: StringValue.of(optional: value))
        }
    }

    open class var eidMatched: Property {
        get {
            objc_sync_enter(ProximityDetectedSetType.self)
            defer { objc_sync_exit(ProximityDetectedSetType.self) }
            do {
                return ProximityDetectedSetType.eidMatched_
            }
        }
        set(value) {
            objc_sync_enter(ProximityDetectedSetType.self)
            defer { objc_sync_exit(ProximityDetectedSetType.self) }
            do {
                ProximityDetectedSetType.eidMatched_ = value
            }
        }
    }

    open var eidMatched: String? {
        get {
            return StringValue.optional(self.optionalValue(for: ProximityDetectedSetType.eidMatched))
        }
        set(value) {
            self.setOptionalValue(for: ProximityDetectedSetType.eidMatched, to: StringValue.of(optional: value))
        }
    }

    open class var eventTS: Property {
        get {
            objc_sync_enter(ProximityDetectedSetType.self)
            defer { objc_sync_exit(ProximityDetectedSetType.self) }
            do {
                return ProximityDetectedSetType.eventTS_
            }
        }
        set(value) {
            objc_sync_enter(ProximityDetectedSetType.self)
            defer { objc_sync_exit(ProximityDetectedSetType.self) }
            do {
                ProximityDetectedSetType.eventTS_ = value
            }
        }
    }

    open var eventTS: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: ProximityDetectedSetType.eventTS))
        }
        set(value) {
            self.setOptionalValue(for: ProximityDetectedSetType.eventTS, to: value)
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(createdAt: LocalDateTime?, eidInfected: String?, eidMatched: String?, eventTS: LocalDateTime?) -> EntityKey {
        return EntityKey().with(name: "CreatedAt", value: createdAt).with(name: "EIDInfected", value: StringValue.of(optional: eidInfected)).with(name: "EIDMatched", value: StringValue.of(optional: eidMatched)).with(name: "EventTS", value: eventTS)
    }

    open var old: ProximityDetectedSetType {
        return CastRequired<ProximityDetectedSetType>.from(self.oldEntity)
    }

    open class var toPotentialInfectedEID: Property {
        get {
            objc_sync_enter(ProximityDetectedSetType.self)
            defer { objc_sync_exit(ProximityDetectedSetType.self) }
            do {
                return ProximityDetectedSetType.toPotentialInfectedEID_
            }
        }
        set(value) {
            objc_sync_enter(ProximityDetectedSetType.self)
            defer { objc_sync_exit(ProximityDetectedSetType.self) }
            do {
                ProximityDetectedSetType.toPotentialInfectedEID_ = value
            }
        }
    }

    open var toPotentialInfectedEID: EphemeralIDSetType? {
        get {
            return CastOptional<EphemeralIDSetType>.from(self.optionalValue(for: ProximityDetectedSetType.toPotentialInfectedEID))
        }
        set(value) {
            self.setOptionalValue(for: ProximityDetectedSetType.toPotentialInfectedEID, to: value)
        }
    }
}
