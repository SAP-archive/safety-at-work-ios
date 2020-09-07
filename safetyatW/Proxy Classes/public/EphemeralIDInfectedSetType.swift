// # Proxy Compiler 20.3.2-74d649-20200526

import Foundation
import SAPOData

open class EphemeralIDInfectedSetType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var eid_: Property = V2Metadata.EntityTypes.ephemeralIDInfectedSetType.property(withName: "EID")

    private static var infectedID_: Property = V2Metadata.EntityTypes.ephemeralIDInfectedSetType.property(withName: "InfectedID")

    private static var toPotentialInfectedEIDs_: Property = V2Metadata.EntityTypes.ephemeralIDInfectedSetType.property(withName: "toPotentialInfectedEIDs")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: V2Metadata.EntityTypes.ephemeralIDInfectedSetType)
    }

    open class func array(from: EntityValueList) -> [EphemeralIDInfectedSetType] {
        return ArrayConverter.convert(from.toArray(), [EphemeralIDInfectedSetType]())
    }

    open func copy() -> EphemeralIDInfectedSetType {
        return CastRequired<EphemeralIDInfectedSetType>.from(self.copyEntity())
    }

    open class var eid: Property {
        get {
            objc_sync_enter(EphemeralIDInfectedSetType.self)
            defer { objc_sync_exit(EphemeralIDInfectedSetType.self) }
            do {
                return EphemeralIDInfectedSetType.eid_
            }
        }
        set(value) {
            objc_sync_enter(EphemeralIDInfectedSetType.self)
            defer { objc_sync_exit(EphemeralIDInfectedSetType.self) }
            do {
                EphemeralIDInfectedSetType.eid_ = value
            }
        }
    }

    open var eid: String? {
        get {
            return StringValue.optional(self.optionalValue(for: EphemeralIDInfectedSetType.eid))
        }
        set(value) {
            self.setOptionalValue(for: EphemeralIDInfectedSetType.eid, to: StringValue.of(optional: value))
        }
    }

    open class var infectedID: Property {
        get {
            objc_sync_enter(EphemeralIDInfectedSetType.self)
            defer { objc_sync_exit(EphemeralIDInfectedSetType.self) }
            do {
                return EphemeralIDInfectedSetType.infectedID_
            }
        }
        set(value) {
            objc_sync_enter(EphemeralIDInfectedSetType.self)
            defer { objc_sync_exit(EphemeralIDInfectedSetType.self) }
            do {
                EphemeralIDInfectedSetType.infectedID_ = value
            }
        }
    }

    open var infectedID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: EphemeralIDInfectedSetType.infectedID))
        }
        set(value) {
            self.setOptionalValue(for: EphemeralIDInfectedSetType.infectedID, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(eid: String?, infectedID: String?) -> EntityKey {
        return EntityKey().with(name: "EID", value: StringValue.of(optional: eid)).with(name: "InfectedID", value: StringValue.of(optional: infectedID))
    }

    open var old: EphemeralIDInfectedSetType {
        return CastRequired<EphemeralIDInfectedSetType>.from(self.oldEntity)
    }

    open class var toPotentialInfectedEIDs: Property {
        get {
            objc_sync_enter(EphemeralIDInfectedSetType.self)
            defer { objc_sync_exit(EphemeralIDInfectedSetType.self) }
            do {
                return EphemeralIDInfectedSetType.toPotentialInfectedEIDs_
            }
        }
        set(value) {
            objc_sync_enter(EphemeralIDInfectedSetType.self)
            defer { objc_sync_exit(EphemeralIDInfectedSetType.self) }
            do {
                EphemeralIDInfectedSetType.toPotentialInfectedEIDs_ = value
            }
        }
    }

    open var toPotentialInfectedEIDs: [ProximityDetectedSetType] {
        get {
            return ArrayConverter.convert(EphemeralIDInfectedSetType.toPotentialInfectedEIDs.entityList(from: self).toArray(), [ProximityDetectedSetType]())
        }
        set(value) {
            EphemeralIDInfectedSetType.toPotentialInfectedEIDs.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }
}
