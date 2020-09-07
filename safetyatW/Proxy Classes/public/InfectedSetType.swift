// # Proxy Compiler 20.3.2-74d649-20200526

import Foundation
import SAPOData

open class InfectedSetType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var id_: Property = V2Metadata.EntityTypes.infectedSetType.property(withName: "ID")

    private static var deviceID_: Property = V2Metadata.EntityTypes.infectedSetType.property(withName: "DeviceID")

    private static var createdAt_: Property = V2Metadata.EntityTypes.infectedSetType.property(withName: "CreatedAt")

    private static var attrib1_: Property = V2Metadata.EntityTypes.infectedSetType.property(withName: "Attrib1")

    private static var attrib2_: Property = V2Metadata.EntityTypes.infectedSetType.property(withName: "Attrib2")

    private static var notes_: Property = V2Metadata.EntityTypes.infectedSetType.property(withName: "Notes")

    private static var attrib3_: Property = V2Metadata.EntityTypes.infectedSetType.property(withName: "Attrib3")

    private static var toDevice_: Property = V2Metadata.EntityTypes.infectedSetType.property(withName: "toDevice")

    private static var toInfectedEIDs_: Property = V2Metadata.EntityTypes.infectedSetType.property(withName: "toInfectedEIDs")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: V2Metadata.EntityTypes.infectedSetType)
    }

    open class func array(from: EntityValueList) -> [InfectedSetType] {
        return ArrayConverter.convert(from.toArray(), [InfectedSetType]())
    }

    open class var attrib1: Property {
        get {
            objc_sync_enter(InfectedSetType.self)
            defer { objc_sync_exit(InfectedSetType.self) }
            do {
                return InfectedSetType.attrib1_
            }
        }
        set(value) {
            objc_sync_enter(InfectedSetType.self)
            defer { objc_sync_exit(InfectedSetType.self) }
            do {
                InfectedSetType.attrib1_ = value
            }
        }
    }

    open var attrib1: String? {
        get {
            return StringValue.optional(self.optionalValue(for: InfectedSetType.attrib1))
        }
        set(value) {
            self.setOptionalValue(for: InfectedSetType.attrib1, to: StringValue.of(optional: value))
        }
    }

    open class var attrib2: Property {
        get {
            objc_sync_enter(InfectedSetType.self)
            defer { objc_sync_exit(InfectedSetType.self) }
            do {
                return InfectedSetType.attrib2_
            }
        }
        set(value) {
            objc_sync_enter(InfectedSetType.self)
            defer { objc_sync_exit(InfectedSetType.self) }
            do {
                InfectedSetType.attrib2_ = value
            }
        }
    }

    open var attrib2: String? {
        get {
            return StringValue.optional(self.optionalValue(for: InfectedSetType.attrib2))
        }
        set(value) {
            self.setOptionalValue(for: InfectedSetType.attrib2, to: StringValue.of(optional: value))
        }
    }

    open class var attrib3: Property {
        get {
            objc_sync_enter(InfectedSetType.self)
            defer { objc_sync_exit(InfectedSetType.self) }
            do {
                return InfectedSetType.attrib3_
            }
        }
        set(value) {
            objc_sync_enter(InfectedSetType.self)
            defer { objc_sync_exit(InfectedSetType.self) }
            do {
                InfectedSetType.attrib3_ = value
            }
        }
    }

    open var attrib3: String? {
        get {
            return StringValue.optional(self.optionalValue(for: InfectedSetType.attrib3))
        }
        set(value) {
            self.setOptionalValue(for: InfectedSetType.attrib3, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> InfectedSetType {
        return CastRequired<InfectedSetType>.from(self.copyEntity())
    }

    open class var createdAt: Property {
        get {
            objc_sync_enter(InfectedSetType.self)
            defer { objc_sync_exit(InfectedSetType.self) }
            do {
                return InfectedSetType.createdAt_
            }
        }
        set(value) {
            objc_sync_enter(InfectedSetType.self)
            defer { objc_sync_exit(InfectedSetType.self) }
            do {
                InfectedSetType.createdAt_ = value
            }
        }
    }

    open var createdAt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: InfectedSetType.createdAt))
        }
        set(value) {
            self.setOptionalValue(for: InfectedSetType.createdAt, to: value)
        }
    }

    open class var deviceID: Property {
        get {
            objc_sync_enter(InfectedSetType.self)
            defer { objc_sync_exit(InfectedSetType.self) }
            do {
                return InfectedSetType.deviceID_
            }
        }
        set(value) {
            objc_sync_enter(InfectedSetType.self)
            defer { objc_sync_exit(InfectedSetType.self) }
            do {
                InfectedSetType.deviceID_ = value
            }
        }
    }

    open var deviceID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: InfectedSetType.deviceID))
        }
        set(value) {
            self.setOptionalValue(for: InfectedSetType.deviceID, to: StringValue.of(optional: value))
        }
    }

    open class var id: Property {
        get {
            objc_sync_enter(InfectedSetType.self)
            defer { objc_sync_exit(InfectedSetType.self) }
            do {
                return InfectedSetType.id_
            }
        }
        set(value) {
            objc_sync_enter(InfectedSetType.self)
            defer { objc_sync_exit(InfectedSetType.self) }
            do {
                InfectedSetType.id_ = value
            }
        }
    }

    open var id: String? {
        get {
            return StringValue.optional(self.optionalValue(for: InfectedSetType.id))
        }
        set(value) {
            self.setOptionalValue(for: InfectedSetType.id, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(id: String?) -> EntityKey {
        return EntityKey().with(name: "ID", value: StringValue.of(optional: id))
    }

    open class var notes: Property {
        get {
            objc_sync_enter(InfectedSetType.self)
            defer { objc_sync_exit(InfectedSetType.self) }
            do {
                return InfectedSetType.notes_
            }
        }
        set(value) {
            objc_sync_enter(InfectedSetType.self)
            defer { objc_sync_exit(InfectedSetType.self) }
            do {
                InfectedSetType.notes_ = value
            }
        }
    }

    open var notes: String? {
        get {
            return StringValue.optional(self.optionalValue(for: InfectedSetType.notes))
        }
        set(value) {
            self.setOptionalValue(for: InfectedSetType.notes, to: StringValue.of(optional: value))
        }
    }

    open var old: InfectedSetType {
        return CastRequired<InfectedSetType>.from(self.oldEntity)
    }

    open class var toDevice: Property {
        get {
            objc_sync_enter(InfectedSetType.self)
            defer { objc_sync_exit(InfectedSetType.self) }
            do {
                return InfectedSetType.toDevice_
            }
        }
        set(value) {
            objc_sync_enter(InfectedSetType.self)
            defer { objc_sync_exit(InfectedSetType.self) }
            do {
                InfectedSetType.toDevice_ = value
            }
        }
    }

    open var toDevice: DeviceSetType? {
        get {
            return CastOptional<DeviceSetType>.from(self.optionalValue(for: InfectedSetType.toDevice))
        }
        set(value) {
            self.setOptionalValue(for: InfectedSetType.toDevice, to: value)
        }
    }

    open class var toInfectedEIDs: Property {
        get {
            objc_sync_enter(InfectedSetType.self)
            defer { objc_sync_exit(InfectedSetType.self) }
            do {
                return InfectedSetType.toInfectedEIDs_
            }
        }
        set(value) {
            objc_sync_enter(InfectedSetType.self)
            defer { objc_sync_exit(InfectedSetType.self) }
            do {
                InfectedSetType.toInfectedEIDs_ = value
            }
        }
    }

    open var toInfectedEIDs: [EphemeralIDInfectedSetType] {
        get {
            return ArrayConverter.convert(InfectedSetType.toInfectedEIDs.entityList(from: self).toArray(), [EphemeralIDInfectedSetType]())
        }
        set(value) {
            InfectedSetType.toInfectedEIDs.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }
}
