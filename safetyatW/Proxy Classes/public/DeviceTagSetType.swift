// # Proxy Compiler 20.3.2-74d649-20200526

import Foundation
import SAPOData

open class DeviceTagSetType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var deviceID_: Property = V2Metadata.EntityTypes.deviceTagSetType.property(withName: "DeviceID")

    private static var tagKey_: Property = V2Metadata.EntityTypes.deviceTagSetType.property(withName: "TagKey")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: V2Metadata.EntityTypes.deviceTagSetType)
    }

    open class func array(from: EntityValueList) -> [DeviceTagSetType] {
        return ArrayConverter.convert(from.toArray(), [DeviceTagSetType]())
    }

    open func copy() -> DeviceTagSetType {
        return CastRequired<DeviceTagSetType>.from(self.copyEntity())
    }

    open class var deviceID: Property {
        get {
            objc_sync_enter(DeviceTagSetType.self)
            defer { objc_sync_exit(DeviceTagSetType.self) }
            do {
                return DeviceTagSetType.deviceID_
            }
        }
        set(value) {
            objc_sync_enter(DeviceTagSetType.self)
            defer { objc_sync_exit(DeviceTagSetType.self) }
            do {
                DeviceTagSetType.deviceID_ = value
            }
        }
    }

    open var deviceID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: DeviceTagSetType.deviceID))
        }
        set(value) {
            self.setOptionalValue(for: DeviceTagSetType.deviceID, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(deviceID: String?, tagKey: String?) -> EntityKey {
        return EntityKey().with(name: "DeviceID", value: StringValue.of(optional: deviceID)).with(name: "TagKey", value: StringValue.of(optional: tagKey))
    }

    open var old: DeviceTagSetType {
        return CastRequired<DeviceTagSetType>.from(self.oldEntity)
    }

    open class var tagKey: Property {
        get {
            objc_sync_enter(DeviceTagSetType.self)
            defer { objc_sync_exit(DeviceTagSetType.self) }
            do {
                return DeviceTagSetType.tagKey_
            }
        }
        set(value) {
            objc_sync_enter(DeviceTagSetType.self)
            defer { objc_sync_exit(DeviceTagSetType.self) }
            do {
                DeviceTagSetType.tagKey_ = value
            }
        }
    }

    open var tagKey: String? {
        get {
            return StringValue.optional(self.optionalValue(for: DeviceTagSetType.tagKey))
        }
        set(value) {
            self.setOptionalValue(for: DeviceTagSetType.tagKey, to: StringValue.of(optional: value))
        }
    }
}
