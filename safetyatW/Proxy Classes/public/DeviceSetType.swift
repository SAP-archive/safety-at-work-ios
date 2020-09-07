// # Proxy Compiler 20.3.2-74d649-20200526

import Foundation
import SAPOData

open class DeviceSetType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var deviceID_: Property = V2Metadata.EntityTypes.deviceSetType.property(withName: "DeviceID")

    private static var type__: Property = V2Metadata.EntityTypes.deviceSetType.property(withName: "Type")

    private static var description_: Property = V2Metadata.EntityTypes.deviceSetType.property(withName: "Description")

    private static var ownedByID_: Property = V2Metadata.EntityTypes.deviceSetType.property(withName: "OwnedBy")

    private static var createdAt_: Property = V2Metadata.EntityTypes.deviceSetType.property(withName: "CreatedAt")

    private static var createdBy_: Property = V2Metadata.EntityTypes.deviceSetType.property(withName: "CreatedBy")

    private static var updatedAt_: Property = V2Metadata.EntityTypes.deviceSetType.property(withName: "UpdatedAt")

    private static var updatedBy_: Property = V2Metadata.EntityTypes.deviceSetType.property(withName: "UpdatedBy")

    private static var capacity_: Property = V2Metadata.EntityTypes.deviceSetType.property(withName: "Capacity")

    private static var major_: Property = V2Metadata.EntityTypes.deviceSetType.property(withName: "Major")

    private static var minor_: Property = V2Metadata.EntityTypes.deviceSetType.property(withName: "Minor")

    private static var ownedBy_: Property = V2Metadata.EntityTypes.deviceSetType.property(withName: "ownedBy")

    private static var toEIDs_: Property = V2Metadata.EntityTypes.deviceSetType.property(withName: "toEIDs")

    private static var toInfections_: Property = V2Metadata.EntityTypes.deviceSetType.property(withName: "toInfections")

    private static var toTags_: Property = V2Metadata.EntityTypes.deviceSetType.property(withName: "toTags")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: V2Metadata.EntityTypes.deviceSetType)
    }

    open class func array(from: EntityValueList) -> [DeviceSetType] {
        return ArrayConverter.convert(from.toArray(), [DeviceSetType]())
    }

    open class var capacity: Property {
        get {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                return DeviceSetType.capacity_
            }
        }
        set(value) {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                DeviceSetType.capacity_ = value
            }
        }
    }

    open var capacity: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: DeviceSetType.capacity))
        }
        set(value) {
            self.setOptionalValue(for: DeviceSetType.capacity, to: IntValue.of(optional: value))
        }
    }

    open func copy() -> DeviceSetType {
        return CastRequired<DeviceSetType>.from(self.copyEntity())
    }

    open class var createdAt: Property {
        get {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                return DeviceSetType.createdAt_
            }
        }
        set(value) {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                DeviceSetType.createdAt_ = value
            }
        }
    }

    open var createdAt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: DeviceSetType.createdAt))
        }
        set(value) {
            self.setOptionalValue(for: DeviceSetType.createdAt, to: value)
        }
    }

    open class var createdBy: Property {
        get {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                return DeviceSetType.createdBy_
            }
        }
        set(value) {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                DeviceSetType.createdBy_ = value
            }
        }
    }

    open var createdBy: String? {
        get {
            return StringValue.optional(self.optionalValue(for: DeviceSetType.createdBy))
        }
        set(value) {
            self.setOptionalValue(for: DeviceSetType.createdBy, to: StringValue.of(optional: value))
        }
    }

    open class var description: Property {
        get {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                return DeviceSetType.description_
            }
        }
        set(value) {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                DeviceSetType.description_ = value
            }
        }
    }

    open var description: String? {
        get {
            return StringValue.optional(self.optionalValue(for: DeviceSetType.description))
        }
        set(value) {
            self.setOptionalValue(for: DeviceSetType.description, to: StringValue.of(optional: value))
        }
    }

    open class var deviceID: Property {
        get {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                return DeviceSetType.deviceID_
            }
        }
        set(value) {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                DeviceSetType.deviceID_ = value
            }
        }
    }

    open var deviceID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: DeviceSetType.deviceID))
        }
        set(value) {
            self.setOptionalValue(for: DeviceSetType.deviceID, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(deviceID: String?) -> EntityKey {
        return EntityKey().with(name: "DeviceID", value: StringValue.of(optional: deviceID))
    }

    open class var major: Property {
        get {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                return DeviceSetType.major_
            }
        }
        set(value) {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                DeviceSetType.major_ = value
            }
        }
    }

    open var major: String? {
        get {
            return StringValue.optional(self.optionalValue(for: DeviceSetType.major))
        }
        set(value) {
            self.setOptionalValue(for: DeviceSetType.major, to: StringValue.of(optional: value))
        }
    }

    open class var minor: Property {
        get {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                return DeviceSetType.minor_
            }
        }
        set(value) {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                DeviceSetType.minor_ = value
            }
        }
    }

    open var minor: String? {
        get {
            return StringValue.optional(self.optionalValue(for: DeviceSetType.minor))
        }
        set(value) {
            self.setOptionalValue(for: DeviceSetType.minor, to: StringValue.of(optional: value))
        }
    }

    open var old: DeviceSetType {
        return CastRequired<DeviceSetType>.from(self.oldEntity)
    }

    open class var ownedBy: Property {
        get {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                return DeviceSetType.ownedBy_
            }
        }
        set(value) {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                DeviceSetType.ownedBy_ = value
            }
        }
    }

    open var ownedBy: DeviceSetType? {
        get {
            return CastOptional<DeviceSetType>.from(self.optionalValue(for: DeviceSetType.ownedBy))
        }
        set(value) {
            self.setOptionalValue(for: DeviceSetType.ownedBy, to: value)
        }
    }

    open class var ownedByID: Property {
        get {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                return DeviceSetType.ownedByID_
            }
        }
        set(value) {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                DeviceSetType.ownedByID_ = value
            }
        }
    }

    open var ownedByID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: DeviceSetType.ownedByID))
        }
        set(value) {
            self.setOptionalValue(for: DeviceSetType.ownedByID, to: StringValue.of(optional: value))
        }
    }

    open class var toEIDs: Property {
        get {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                return DeviceSetType.toEIDs_
            }
        }
        set(value) {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                DeviceSetType.toEIDs_ = value
            }
        }
    }

    open var toEIDs: [EphemeralIDSetType] {
        get {
            return ArrayConverter.convert(DeviceSetType.toEIDs.entityList(from: self).toArray(), [EphemeralIDSetType]())
        }
        set(value) {
            DeviceSetType.toEIDs.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }

    open class var toInfections: Property {
        get {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                return DeviceSetType.toInfections_
            }
        }
        set(value) {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                DeviceSetType.toInfections_ = value
            }
        }
    }

    open var toInfections: [InfectedSetType] {
        get {
            return ArrayConverter.convert(DeviceSetType.toInfections.entityList(from: self).toArray(), [InfectedSetType]())
        }
        set(value) {
            DeviceSetType.toInfections.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }

    open class var toTags: Property {
        get {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                return DeviceSetType.toTags_
            }
        }
        set(value) {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                DeviceSetType.toTags_ = value
            }
        }
    }

    open var toTags: [DeviceTagSetType] {
        get {
            return ArrayConverter.convert(DeviceSetType.toTags.entityList(from: self).toArray(), [DeviceTagSetType]())
        }
        set(value) {
            DeviceSetType.toTags.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }

    open class var type_: Property {
        get {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                return DeviceSetType.type__
            }
        }
        set(value) {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                DeviceSetType.type__ = value
            }
        }
    }

    open var type_: String? {
        get {
            return StringValue.optional(self.optionalValue(for: DeviceSetType.type_))
        }
        set(value) {
            self.setOptionalValue(for: DeviceSetType.type_, to: StringValue.of(optional: value))
        }
    }

    open class var updatedAt: Property {
        get {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                return DeviceSetType.updatedAt_
            }
        }
        set(value) {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                DeviceSetType.updatedAt_ = value
            }
        }
    }

    open var updatedAt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: DeviceSetType.updatedAt))
        }
        set(value) {
            self.setOptionalValue(for: DeviceSetType.updatedAt, to: value)
        }
    }

    open class var updatedBy: Property {
        get {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                return DeviceSetType.updatedBy_
            }
        }
        set(value) {
            objc_sync_enter(DeviceSetType.self)
            defer { objc_sync_exit(DeviceSetType.self) }
            do {
                DeviceSetType.updatedBy_ = value
            }
        }
    }

    open var updatedBy: String? {
        get {
            return StringValue.optional(self.optionalValue(for: DeviceSetType.updatedBy))
        }
        set(value) {
            self.setOptionalValue(for: DeviceSetType.updatedBy, to: StringValue.of(optional: value))
        }
    }
}
