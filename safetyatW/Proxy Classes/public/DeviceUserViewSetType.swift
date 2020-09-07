// # Proxy Compiler 20.3.2-74d649-20200526

import Foundation
import SAPOData

open class DeviceUserViewSetType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var deviceID_: Property = V2Metadata.EntityTypes.deviceUserViewSetType.property(withName: "DeviceID")

    private static var description_: Property = V2Metadata.EntityTypes.deviceUserViewSetType.property(withName: "Description")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: V2Metadata.EntityTypes.deviceUserViewSetType)
    }

    open class func array(from: EntityValueList) -> [DeviceUserViewSetType] {
        return ArrayConverter.convert(from.toArray(), [DeviceUserViewSetType]())
    }

    open func copy() -> DeviceUserViewSetType {
        return CastRequired<DeviceUserViewSetType>.from(self.copyEntity())
    }

    open class var description: Property {
        get {
            objc_sync_enter(DeviceUserViewSetType.self)
            defer { objc_sync_exit(DeviceUserViewSetType.self) }
            do {
                return DeviceUserViewSetType.description_
            }
        }
        set(value) {
            objc_sync_enter(DeviceUserViewSetType.self)
            defer { objc_sync_exit(DeviceUserViewSetType.self) }
            do {
                DeviceUserViewSetType.description_ = value
            }
        }
    }

    open var description: String? {
        get {
            return StringValue.optional(self.optionalValue(for: DeviceUserViewSetType.description))
        }
        set(value) {
            self.setOptionalValue(for: DeviceUserViewSetType.description, to: StringValue.of(optional: value))
        }
    }

    open class var deviceID: Property {
        get {
            objc_sync_enter(DeviceUserViewSetType.self)
            defer { objc_sync_exit(DeviceUserViewSetType.self) }
            do {
                return DeviceUserViewSetType.deviceID_
            }
        }
        set(value) {
            objc_sync_enter(DeviceUserViewSetType.self)
            defer { objc_sync_exit(DeviceUserViewSetType.self) }
            do {
                DeviceUserViewSetType.deviceID_ = value
            }
        }
    }

    open var deviceID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: DeviceUserViewSetType.deviceID))
        }
        set(value) {
            self.setOptionalValue(for: DeviceUserViewSetType.deviceID, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(deviceID: String?) -> EntityKey {
        return EntityKey().with(name: "DeviceID", value: StringValue.of(optional: deviceID))
    }

    open var old: DeviceUserViewSetType {
        return CastRequired<DeviceUserViewSetType>.from(self.oldEntity)
    }
}
