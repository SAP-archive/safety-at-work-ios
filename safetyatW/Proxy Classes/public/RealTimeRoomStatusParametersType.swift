// # Proxy Compiler 20.3.2-74d649-20200526

import Foundation
import SAPOData

open class RealTimeRoomStatusParametersType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var timeFrameInMinutes_: Property = V2Metadata.EntityTypes.realTimeRoomStatusParametersType.property(withName: "TimeFrameInMinutes")

    private static var results_: Property = V2Metadata.EntityTypes.realTimeRoomStatusParametersType.property(withName: "Results")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: V2Metadata.EntityTypes.realTimeRoomStatusParametersType)
    }

    open class func array(from: EntityValueList) -> [RealTimeRoomStatusParametersType] {
        return ArrayConverter.convert(from.toArray(), [RealTimeRoomStatusParametersType]())
    }

    open func copy() -> RealTimeRoomStatusParametersType {
        return CastRequired<RealTimeRoomStatusParametersType>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(timeFrameInMinutes: Int?) -> EntityKey {
        return EntityKey().with(name: "TimeFrameInMinutes", value: IntValue.of(optional: timeFrameInMinutes))
    }

    open var old: RealTimeRoomStatusParametersType {
        return CastRequired<RealTimeRoomStatusParametersType>.from(self.oldEntity)
    }

    open class var results: Property {
        get {
            objc_sync_enter(RealTimeRoomStatusParametersType.self)
            defer { objc_sync_exit(RealTimeRoomStatusParametersType.self) }
            do {
                return RealTimeRoomStatusParametersType.results_
            }
        }
        set(value) {
            objc_sync_enter(RealTimeRoomStatusParametersType.self)
            defer { objc_sync_exit(RealTimeRoomStatusParametersType.self) }
            do {
                RealTimeRoomStatusParametersType.results_ = value
            }
        }
    }

    open var results: [RealTimeRoomStatusType] {
        get {
            return ArrayConverter.convert(RealTimeRoomStatusParametersType.results.entityList(from: self).toArray(), [RealTimeRoomStatusType]())
        }
        set(value) {
            RealTimeRoomStatusParametersType.results.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }

    open class var timeFrameInMinutes: Property {
        get {
            objc_sync_enter(RealTimeRoomStatusParametersType.self)
            defer { objc_sync_exit(RealTimeRoomStatusParametersType.self) }
            do {
                return RealTimeRoomStatusParametersType.timeFrameInMinutes_
            }
        }
        set(value) {
            objc_sync_enter(RealTimeRoomStatusParametersType.self)
            defer { objc_sync_exit(RealTimeRoomStatusParametersType.self) }
            do {
                RealTimeRoomStatusParametersType.timeFrameInMinutes_ = value
            }
        }
    }

    open var timeFrameInMinutes: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: RealTimeRoomStatusParametersType.timeFrameInMinutes))
        }
        set(value) {
            self.setOptionalValue(for: RealTimeRoomStatusParametersType.timeFrameInMinutes, to: IntValue.of(optional: value))
        }
    }
}
