// # Proxy Compiler 20.3.2-74d649-20200526

import Foundation
import SAPOData

open class HistoryDevicesStatusType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var genID_: Property = V2Metadata.EntityTypes.historyDevicesStatusType.property(withName: "GenID")

    private static var deviceID_: Property = V2Metadata.EntityTypes.historyDevicesStatusType.property(withName: "DeviceID")

    private static var description_: Property = V2Metadata.EntityTypes.historyDevicesStatusType.property(withName: "Description")

    private static var capacity_: Property = V2Metadata.EntityTypes.historyDevicesStatusType.property(withName: "Capacity")

    private static var timeFrame_: Property = V2Metadata.EntityTypes.historyDevicesStatusType.property(withName: "TimeFrame")

    private static var tagsString_: Property = V2Metadata.EntityTypes.historyDevicesStatusType.property(withName: "TagsString")

    private static var avg_: Property = V2Metadata.EntityTypes.historyDevicesStatusType.property(withName: "Avg")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: V2Metadata.EntityTypes.historyDevicesStatusType)
    }

    open class func array(from: EntityValueList) -> [HistoryDevicesStatusType] {
        return ArrayConverter.convert(from.toArray(), [HistoryDevicesStatusType]())
    }

    open class var avg: Property {
        get {
            objc_sync_enter(HistoryDevicesStatusType.self)
            defer { objc_sync_exit(HistoryDevicesStatusType.self) }
            do {
                return HistoryDevicesStatusType.avg_
            }
        }
        set(value) {
            objc_sync_enter(HistoryDevicesStatusType.self)
            defer { objc_sync_exit(HistoryDevicesStatusType.self) }
            do {
                HistoryDevicesStatusType.avg_ = value
            }
        }
    }

    open var avg: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: HistoryDevicesStatusType.avg))
        }
        set(value) {
            self.setOptionalValue(for: HistoryDevicesStatusType.avg, to: DecimalValue.of(optional: value))
        }
    }

    open class var capacity: Property {
        get {
            objc_sync_enter(HistoryDevicesStatusType.self)
            defer { objc_sync_exit(HistoryDevicesStatusType.self) }
            do {
                return HistoryDevicesStatusType.capacity_
            }
        }
        set(value) {
            objc_sync_enter(HistoryDevicesStatusType.self)
            defer { objc_sync_exit(HistoryDevicesStatusType.self) }
            do {
                HistoryDevicesStatusType.capacity_ = value
            }
        }
    }

    open var capacity: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: HistoryDevicesStatusType.capacity))
        }
        set(value) {
            self.setOptionalValue(for: HistoryDevicesStatusType.capacity, to: IntValue.of(optional: value))
        }
    }

    open func copy() -> HistoryDevicesStatusType {
        return CastRequired<HistoryDevicesStatusType>.from(self.copyEntity())
    }

    open class var description: Property {
        get {
            objc_sync_enter(HistoryDevicesStatusType.self)
            defer { objc_sync_exit(HistoryDevicesStatusType.self) }
            do {
                return HistoryDevicesStatusType.description_
            }
        }
        set(value) {
            objc_sync_enter(HistoryDevicesStatusType.self)
            defer { objc_sync_exit(HistoryDevicesStatusType.self) }
            do {
                HistoryDevicesStatusType.description_ = value
            }
        }
    }

    open var description: String? {
        get {
            return StringValue.optional(self.optionalValue(for: HistoryDevicesStatusType.description))
        }
        set(value) {
            self.setOptionalValue(for: HistoryDevicesStatusType.description, to: StringValue.of(optional: value))
        }
    }

    open class var deviceID: Property {
        get {
            objc_sync_enter(HistoryDevicesStatusType.self)
            defer { objc_sync_exit(HistoryDevicesStatusType.self) }
            do {
                return HistoryDevicesStatusType.deviceID_
            }
        }
        set(value) {
            objc_sync_enter(HistoryDevicesStatusType.self)
            defer { objc_sync_exit(HistoryDevicesStatusType.self) }
            do {
                HistoryDevicesStatusType.deviceID_ = value
            }
        }
    }

    open var deviceID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: HistoryDevicesStatusType.deviceID))
        }
        set(value) {
            self.setOptionalValue(for: HistoryDevicesStatusType.deviceID, to: StringValue.of(optional: value))
        }
    }

    open class var genID: Property {
        get {
            objc_sync_enter(HistoryDevicesStatusType.self)
            defer { objc_sync_exit(HistoryDevicesStatusType.self) }
            do {
                return HistoryDevicesStatusType.genID_
            }
        }
        set(value) {
            objc_sync_enter(HistoryDevicesStatusType.self)
            defer { objc_sync_exit(HistoryDevicesStatusType.self) }
            do {
                HistoryDevicesStatusType.genID_ = value
            }
        }
    }

    open var genID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: HistoryDevicesStatusType.genID))
        }
        set(value) {
            self.setOptionalValue(for: HistoryDevicesStatusType.genID, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(genID: String?) -> EntityKey {
        return EntityKey().with(name: "GenID", value: StringValue.of(optional: genID))
    }

    open var old: HistoryDevicesStatusType {
        return CastRequired<HistoryDevicesStatusType>.from(self.oldEntity)
    }

    open class var tagsString: Property {
        get {
            objc_sync_enter(HistoryDevicesStatusType.self)
            defer { objc_sync_exit(HistoryDevicesStatusType.self) }
            do {
                return HistoryDevicesStatusType.tagsString_
            }
        }
        set(value) {
            objc_sync_enter(HistoryDevicesStatusType.self)
            defer { objc_sync_exit(HistoryDevicesStatusType.self) }
            do {
                HistoryDevicesStatusType.tagsString_ = value
            }
        }
    }

    open var tagsString: String? {
        get {
            return StringValue.optional(self.optionalValue(for: HistoryDevicesStatusType.tagsString))
        }
        set(value) {
            self.setOptionalValue(for: HistoryDevicesStatusType.tagsString, to: StringValue.of(optional: value))
        }
    }

    open class var timeFrame: Property {
        get {
            objc_sync_enter(HistoryDevicesStatusType.self)
            defer { objc_sync_exit(HistoryDevicesStatusType.self) }
            do {
                return HistoryDevicesStatusType.timeFrame_
            }
        }
        set(value) {
            objc_sync_enter(HistoryDevicesStatusType.self)
            defer { objc_sync_exit(HistoryDevicesStatusType.self) }
            do {
                HistoryDevicesStatusType.timeFrame_ = value
            }
        }
    }

    open var timeFrame: String? {
        get {
            return StringValue.optional(self.optionalValue(for: HistoryDevicesStatusType.timeFrame))
        }
        set(value) {
            self.setOptionalValue(for: HistoryDevicesStatusType.timeFrame, to: StringValue.of(optional: value))
        }
    }
}
