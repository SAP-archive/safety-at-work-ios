// # Proxy Compiler 20.3.2-74d649-20200526

import Foundation
import SAPOData

open class TagSetType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var key__: Property = V2Metadata.EntityTypes.tagSetType.property(withName: "Key")

    private static var type__: Property = V2Metadata.EntityTypes.tagSetType.property(withName: "Type")

    private static var value_: Property = V2Metadata.EntityTypes.tagSetType.property(withName: "Value")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: V2Metadata.EntityTypes.tagSetType)
    }

    open class func array(from: EntityValueList) -> [TagSetType] {
        return ArrayConverter.convert(from.toArray(), [TagSetType]())
    }

    open func copy() -> TagSetType {
        return CastRequired<TagSetType>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(key_: String?) -> EntityKey {
        return EntityKey().with(name: "Key", value: StringValue.of(optional: key_))
    }

    open class var key_: Property {
        get {
            objc_sync_enter(TagSetType.self)
            defer { objc_sync_exit(TagSetType.self) }
            do {
                return TagSetType.key__
            }
        }
        set(value) {
            objc_sync_enter(TagSetType.self)
            defer { objc_sync_exit(TagSetType.self) }
            do {
                TagSetType.key__ = value
            }
        }
    }

    open var key_: String? {
        get {
            return StringValue.optional(self.optionalValue(for: TagSetType.key_))
        }
        set(value) {
            self.setOptionalValue(for: TagSetType.key_, to: StringValue.of(optional: value))
        }
    }

    open var old: TagSetType {
        return CastRequired<TagSetType>.from(self.oldEntity)
    }

    open class var type_: Property {
        get {
            objc_sync_enter(TagSetType.self)
            defer { objc_sync_exit(TagSetType.self) }
            do {
                return TagSetType.type__
            }
        }
        set(value) {
            objc_sync_enter(TagSetType.self)
            defer { objc_sync_exit(TagSetType.self) }
            do {
                TagSetType.type__ = value
            }
        }
    }

    open var type_: String? {
        get {
            return StringValue.optional(self.optionalValue(for: TagSetType.type_))
        }
        set(value) {
            self.setOptionalValue(for: TagSetType.type_, to: StringValue.of(optional: value))
        }
    }

    open class var value: Property {
        get {
            objc_sync_enter(TagSetType.self)
            defer { objc_sync_exit(TagSetType.self) }
            do {
                return TagSetType.value_
            }
        }
        set(value) {
            objc_sync_enter(TagSetType.self)
            defer { objc_sync_exit(TagSetType.self) }
            do {
                TagSetType.value_ = value
            }
        }
    }

    open var value: String? {
        get {
            return StringValue.optional(self.optionalValue(for: TagSetType.value))
        }
        set(value) {
            self.setOptionalValue(for: TagSetType.value, to: StringValue.of(optional: value))
        }
    }
}
