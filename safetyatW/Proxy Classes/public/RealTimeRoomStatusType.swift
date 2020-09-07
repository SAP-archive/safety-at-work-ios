// # Proxy Compiler 20.3.2-74d649-20200526

import Foundation
import SAPOData

open class RealTimeRoomStatusType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var timeFrameInMinutes_: Property = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "TimeFrameInMinutes")

    private static var deviceID_: Property = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "DeviceID")

    private static var type__: Property = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "Type")

    private static var description_: Property = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "Description")

    private static var ownedBy_: Property = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "OwnedBy")

    private static var capacity_: Property = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "Capacity")

    private static var distance_: Property = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "Distance")

    private static var createdAt_: Property = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "CreatedAt")

    private static var tagsString_: Property = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "TagsString")

    private static var measuredPercentage_: Property = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "MeasuredPercentage")

    private static var measured_: Property = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "Measured")

    private static var toTags_: Property = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "toTags")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: V2Metadata.EntityTypes.realTimeRoomStatusType)
    }

    open class func array(from: EntityValueList) -> [RealTimeRoomStatusType] {
        return ArrayConverter.convert(from.toArray(), [RealTimeRoomStatusType]())
    }

    open class var capacity: Property {
        get {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                return RealTimeRoomStatusType.capacity_
            }
        }
        set(value) {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                RealTimeRoomStatusType.capacity_ = value
            }
        }
    }

    open var capacity: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: RealTimeRoomStatusType.capacity))
        }
        set(value) {
            self.setOptionalValue(for: RealTimeRoomStatusType.capacity, to: IntValue.of(optional: value))
        }
    }

    open func copy() -> RealTimeRoomStatusType {
        return CastRequired<RealTimeRoomStatusType>.from(self.copyEntity())
    }

    open class var createdAt: Property {
        get {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                return RealTimeRoomStatusType.createdAt_
            }
        }
        set(value) {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                RealTimeRoomStatusType.createdAt_ = value
            }
        }
    }

    open var createdAt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: RealTimeRoomStatusType.createdAt))
        }
        set(value) {
            self.setOptionalValue(for: RealTimeRoomStatusType.createdAt, to: value)
        }
    }

    open class var description: Property {
        get {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                return RealTimeRoomStatusType.description_
            }
        }
        set(value) {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                RealTimeRoomStatusType.description_ = value
            }
        }
    }

    open var description: String? {
        get {
            return StringValue.optional(self.optionalValue(for: RealTimeRoomStatusType.description))
        }
        set(value) {
            self.setOptionalValue(for: RealTimeRoomStatusType.description, to: StringValue.of(optional: value))
        }
    }

    open class var deviceID: Property {
        get {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                return RealTimeRoomStatusType.deviceID_
            }
        }
        set(value) {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                RealTimeRoomStatusType.deviceID_ = value
            }
        }
    }

    open var deviceID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: RealTimeRoomStatusType.deviceID))
        }
        set(value) {
            self.setOptionalValue(for: RealTimeRoomStatusType.deviceID, to: StringValue.of(optional: value))
        }
    }

    open class var distance: Property {
        get {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                return RealTimeRoomStatusType.distance_
            }
        }
        set(value) {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                RealTimeRoomStatusType.distance_ = value
            }
        }
    }

    open var distance: BigInteger? {
        get {
            return IntegerValue.optional(self.optionalValue(for: RealTimeRoomStatusType.distance))
        }
        set(value) {
            self.setOptionalValue(for: RealTimeRoomStatusType.distance, to: IntegerValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(timeFrameInMinutes: Int?, deviceID: String?) -> EntityKey {
        return EntityKey().with(name: "TimeFrameInMinutes", value: IntValue.of(optional: timeFrameInMinutes)).with(name: "DeviceID", value: StringValue.of(optional: deviceID))
    }

    open class var measured: Property {
        get {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                return RealTimeRoomStatusType.measured_
            }
        }
        set(value) {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                RealTimeRoomStatusType.measured_ = value
            }
        }
    }

    open var measured: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: RealTimeRoomStatusType.measured))
        }
        set(value) {
            self.setOptionalValue(for: RealTimeRoomStatusType.measured, to: IntValue.of(optional: value))
        }
    }

    open class var measuredPercentage: Property {
        get {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                return RealTimeRoomStatusType.measuredPercentage_
            }
        }
        set(value) {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                RealTimeRoomStatusType.measuredPercentage_ = value
            }
        }
    }

    open var measuredPercentage: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: RealTimeRoomStatusType.measuredPercentage))
        }
        set(value) {
            self.setOptionalValue(for: RealTimeRoomStatusType.measuredPercentage, to: IntValue.of(optional: value))
        }
    }

    open var old: RealTimeRoomStatusType {
        return CastRequired<RealTimeRoomStatusType>.from(self.oldEntity)
    }

    open class var ownedBy: Property {
        get {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                return RealTimeRoomStatusType.ownedBy_
            }
        }
        set(value) {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                RealTimeRoomStatusType.ownedBy_ = value
            }
        }
    }

    open var ownedBy: String? {
        get {
            return StringValue.optional(self.optionalValue(for: RealTimeRoomStatusType.ownedBy))
        }
        set(value) {
            self.setOptionalValue(for: RealTimeRoomStatusType.ownedBy, to: StringValue.of(optional: value))
        }
    }

    open class var tagsString: Property {
        get {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                return RealTimeRoomStatusType.tagsString_
            }
        }
        set(value) {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                RealTimeRoomStatusType.tagsString_ = value
            }
        }
    }

    open var tagsString: String? {
        get {
            return StringValue.optional(self.optionalValue(for: RealTimeRoomStatusType.tagsString))
        }
        set(value) {
            self.setOptionalValue(for: RealTimeRoomStatusType.tagsString, to: StringValue.of(optional: value))
        }
    }

    open class var timeFrameInMinutes: Property {
        get {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                return RealTimeRoomStatusType.timeFrameInMinutes_
            }
        }
        set(value) {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                RealTimeRoomStatusType.timeFrameInMinutes_ = value
            }
        }
    }

    open var timeFrameInMinutes: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: RealTimeRoomStatusType.timeFrameInMinutes))
        }
        set(value) {
            self.setOptionalValue(for: RealTimeRoomStatusType.timeFrameInMinutes, to: IntValue.of(optional: value))
        }
    }

    open class var toTags: Property {
        get {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                return RealTimeRoomStatusType.toTags_
            }
        }
        set(value) {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                RealTimeRoomStatusType.toTags_ = value
            }
        }
    }

    open var toTags: [TagSetType] {
        get {
            return ArrayConverter.convert(RealTimeRoomStatusType.toTags.entityList(from: self).toArray(), [TagSetType]())
        }
        set(value) {
            RealTimeRoomStatusType.toTags.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }

    open class var type_: Property {
        get {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                return RealTimeRoomStatusType.type__
            }
        }
        set(value) {
            objc_sync_enter(RealTimeRoomStatusType.self)
            defer { objc_sync_exit(RealTimeRoomStatusType.self) }
            do {
                RealTimeRoomStatusType.type__ = value
            }
        }
    }

    open var type_: String? {
        get {
            return StringValue.optional(self.optionalValue(for: RealTimeRoomStatusType.type_))
        }
        set(value) {
            self.setOptionalValue(for: RealTimeRoomStatusType.type_, to: StringValue.of(optional: value))
        }
    }
}
