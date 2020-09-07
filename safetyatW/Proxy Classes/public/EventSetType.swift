// # Proxy Compiler 20.3.2-74d649-20200526

import Foundation
import SAPOData

open class EventSetType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var sourceEID_: Property = V2Metadata.EntityTypes.eventSetType.property(withName: "SourceEID")

    private static var targetIED_: Property = V2Metadata.EntityTypes.eventSetType.property(withName: "TargetIED")

    private static var distance_: Property = V2Metadata.EntityTypes.eventSetType.property(withName: "Distance")

    private static var createdAt_: Property = V2Metadata.EntityTypes.eventSetType.property(withName: "CreatedAt")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: V2Metadata.EntityTypes.eventSetType)
    }

    open class func array(from: EntityValueList) -> [EventSetType] {
        return ArrayConverter.convert(from.toArray(), [EventSetType]())
    }

    open func copy() -> EventSetType {
        return CastRequired<EventSetType>.from(self.copyEntity())
    }

    open class var createdAt: Property {
        get {
            objc_sync_enter(EventSetType.self)
            defer { objc_sync_exit(EventSetType.self) }
            do {
                return EventSetType.createdAt_
            }
        }
        set(value) {
            objc_sync_enter(EventSetType.self)
            defer { objc_sync_exit(EventSetType.self) }
            do {
                EventSetType.createdAt_ = value
            }
        }
    }

    open var createdAt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: EventSetType.createdAt))
        }
        set(value) {
            self.setOptionalValue(for: EventSetType.createdAt, to: value)
        }
    }

    open class var distance: Property {
        get {
            objc_sync_enter(EventSetType.self)
            defer { objc_sync_exit(EventSetType.self) }
            do {
                return EventSetType.distance_
            }
        }
        set(value) {
            objc_sync_enter(EventSetType.self)
            defer { objc_sync_exit(EventSetType.self) }
            do {
                EventSetType.distance_ = value
            }
        }
    }

    open var distance: BigInteger? {
        get {
            return IntegerValue.optional(self.optionalValue(for: EventSetType.distance))
        }
        set(value) {
            self.setOptionalValue(for: EventSetType.distance, to: IntegerValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(sourceEID: String?, targetIED: String?, createdAt: LocalDateTime?) -> EntityKey {
        return EntityKey().with(name: "SourceEID", value: StringValue.of(optional: sourceEID)).with(name: "TargetIED", value: StringValue.of(optional: targetIED)).with(name: "CreatedAt", value: createdAt)
    }

    open var old: EventSetType {
        return CastRequired<EventSetType>.from(self.oldEntity)
    }

    open class var sourceEID: Property {
        get {
            objc_sync_enter(EventSetType.self)
            defer { objc_sync_exit(EventSetType.self) }
            do {
                return EventSetType.sourceEID_
            }
        }
        set(value) {
            objc_sync_enter(EventSetType.self)
            defer { objc_sync_exit(EventSetType.self) }
            do {
                EventSetType.sourceEID_ = value
            }
        }
    }

    open var sourceEID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: EventSetType.sourceEID))
        }
        set(value) {
            self.setOptionalValue(for: EventSetType.sourceEID, to: StringValue.of(optional: value))
        }
    }

    open class var targetIED: Property {
        get {
            objc_sync_enter(EventSetType.self)
            defer { objc_sync_exit(EventSetType.self) }
            do {
                return EventSetType.targetIED_
            }
        }
        set(value) {
            objc_sync_enter(EventSetType.self)
            defer { objc_sync_exit(EventSetType.self) }
            do {
                EventSetType.targetIED_ = value
            }
        }
    }

    open var targetIED: String? {
        get {
            return StringValue.optional(self.optionalValue(for: EventSetType.targetIED))
        }
        set(value) {
            self.setOptionalValue(for: EventSetType.targetIED, to: StringValue.of(optional: value))
        }
    }
}
