// # Proxy Compiler 20.3.2-74d649-20200526

import Foundation
import SAPOData

open class HistoryDevicesStatusParametersType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var startDate_: Property = V2Metadata.EntityTypes.historyDevicesStatusParametersType.property(withName: "StartDate")

    private static var endDate_: Property = V2Metadata.EntityTypes.historyDevicesStatusParametersType.property(withName: "EndDate")

    private static var results_: Property = V2Metadata.EntityTypes.historyDevicesStatusParametersType.property(withName: "Results")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: V2Metadata.EntityTypes.historyDevicesStatusParametersType)
    }

    open class func array(from: EntityValueList) -> [HistoryDevicesStatusParametersType] {
        return ArrayConverter.convert(from.toArray(), [HistoryDevicesStatusParametersType]())
    }

    open func copy() -> HistoryDevicesStatusParametersType {
        return CastRequired<HistoryDevicesStatusParametersType>.from(self.copyEntity())
    }

    open class var endDate: Property {
        get {
            objc_sync_enter(HistoryDevicesStatusParametersType.self)
            defer { objc_sync_exit(HistoryDevicesStatusParametersType.self) }
            do {
                return HistoryDevicesStatusParametersType.endDate_
            }
        }
        set(value) {
            objc_sync_enter(HistoryDevicesStatusParametersType.self)
            defer { objc_sync_exit(HistoryDevicesStatusParametersType.self) }
            do {
                HistoryDevicesStatusParametersType.endDate_ = value
            }
        }
    }

    open var endDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: HistoryDevicesStatusParametersType.endDate))
        }
        set(value) {
            self.setOptionalValue(for: HistoryDevicesStatusParametersType.endDate, to: value)
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(startDate: LocalDateTime?, endDate: LocalDateTime?) -> EntityKey {
        return EntityKey().with(name: "StartDate", value: startDate).with(name: "EndDate", value: endDate)
    }

    open var old: HistoryDevicesStatusParametersType {
        return CastRequired<HistoryDevicesStatusParametersType>.from(self.oldEntity)
    }

    open class var results: Property {
        get {
            objc_sync_enter(HistoryDevicesStatusParametersType.self)
            defer { objc_sync_exit(HistoryDevicesStatusParametersType.self) }
            do {
                return HistoryDevicesStatusParametersType.results_
            }
        }
        set(value) {
            objc_sync_enter(HistoryDevicesStatusParametersType.self)
            defer { objc_sync_exit(HistoryDevicesStatusParametersType.self) }
            do {
                HistoryDevicesStatusParametersType.results_ = value
            }
        }
    }

    open var results: [HistoryDevicesStatusType] {
        get {
            return ArrayConverter.convert(HistoryDevicesStatusParametersType.results.entityList(from: self).toArray(), [HistoryDevicesStatusType]())
        }
        set(value) {
            HistoryDevicesStatusParametersType.results.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }

    open class var startDate: Property {
        get {
            objc_sync_enter(HistoryDevicesStatusParametersType.self)
            defer { objc_sync_exit(HistoryDevicesStatusParametersType.self) }
            do {
                return HistoryDevicesStatusParametersType.startDate_
            }
        }
        set(value) {
            objc_sync_enter(HistoryDevicesStatusParametersType.self)
            defer { objc_sync_exit(HistoryDevicesStatusParametersType.self) }
            do {
                HistoryDevicesStatusParametersType.startDate_ = value
            }
        }
    }

    open var startDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: HistoryDevicesStatusParametersType.startDate))
        }
        set(value) {
            self.setOptionalValue(for: HistoryDevicesStatusParametersType.startDate, to: value)
        }
    }
}
