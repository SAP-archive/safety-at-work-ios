// # Proxy Compiler 20.3.2-74d649-20200526

import Foundation
import SAPOData

public class V2Metadata {
    private static var document_: CSDLDocument = V2Metadata.resolve()

    public static let lock: MetadataLock = MetadataLock()

    public static var document: CSDLDocument {
        get {
            objc_sync_enter(V2Metadata.self)
            defer { objc_sync_exit(V2Metadata.self) }
            do {
                return V2Metadata.document_
            }
        }
        set(value) {
            objc_sync_enter(V2Metadata.self)
            defer { objc_sync_exit(V2Metadata.self) }
            do {
                V2Metadata.document_ = value
            }
        }
    }

    private static func resolve() -> CSDLDocument {
        try! V2Factory.registerAll()
        V2MetadataParser.parsed.hasGeneratedProxies = true
        return V2MetadataParser.parsed
    }

    public class EntityTypes {
        private static var deviceSetType_: EntityType = V2MetadataParser.parsed.entityType(withName: "default.DeviceSetType")

        private static var deviceTagSetType_: EntityType = V2MetadataParser.parsed.entityType(withName: "default.DeviceTagSetType")

        private static var deviceUserViewSetType_: EntityType = V2MetadataParser.parsed.entityType(withName: "default.DeviceUserViewSetType")

        private static var ephemeralIDInfectedSetType_: EntityType = V2MetadataParser.parsed.entityType(withName: "default.EphemeralIDInfectedSetType")

        private static var ephemeralIDSetType_: EntityType = V2MetadataParser.parsed.entityType(withName: "default.EphemeralIDSetType")

        private static var eventSetType_: EntityType = V2MetadataParser.parsed.entityType(withName: "default.EventSetType")

        private static var historyDevicesStatusParametersType_: EntityType = V2MetadataParser.parsed.entityType(withName: "default.HistoryDevicesStatusParametersType")

        private static var historyDevicesStatusType_: EntityType = V2MetadataParser.parsed.entityType(withName: "default.HistoryDevicesStatusType")

        private static var infectedSetType_: EntityType = V2MetadataParser.parsed.entityType(withName: "default.InfectedSetType")

        private static var proximityDetectedSetType_: EntityType = V2MetadataParser.parsed.entityType(withName: "default.ProximityDetectedSetType")

        private static var realTimeRoomStatusParametersType_: EntityType = V2MetadataParser.parsed.entityType(withName: "default.RealTimeRoomStatusParametersType")

        private static var realTimeRoomStatusType_: EntityType = V2MetadataParser.parsed.entityType(withName: "default.RealTimeRoomStatusType")

        private static var tagSetType_: EntityType = V2MetadataParser.parsed.entityType(withName: "default.TagSetType")

        public static var deviceSetType: EntityType {
            get {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    return V2Metadata.EntityTypes.deviceSetType_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    V2Metadata.EntityTypes.deviceSetType_ = value
                }
            }
        }

        public static var deviceTagSetType: EntityType {
            get {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    return V2Metadata.EntityTypes.deviceTagSetType_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    V2Metadata.EntityTypes.deviceTagSetType_ = value
                }
            }
        }

        public static var deviceUserViewSetType: EntityType {
            get {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    return V2Metadata.EntityTypes.deviceUserViewSetType_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    V2Metadata.EntityTypes.deviceUserViewSetType_ = value
                }
            }
        }

        public static var ephemeralIDInfectedSetType: EntityType {
            get {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    return V2Metadata.EntityTypes.ephemeralIDInfectedSetType_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    V2Metadata.EntityTypes.ephemeralIDInfectedSetType_ = value
                }
            }
        }

        public static var ephemeralIDSetType: EntityType {
            get {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    return V2Metadata.EntityTypes.ephemeralIDSetType_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    V2Metadata.EntityTypes.ephemeralIDSetType_ = value
                }
            }
        }

        public static var eventSetType: EntityType {
            get {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    return V2Metadata.EntityTypes.eventSetType_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    V2Metadata.EntityTypes.eventSetType_ = value
                }
            }
        }

        public static var historyDevicesStatusParametersType: EntityType {
            get {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    return V2Metadata.EntityTypes.historyDevicesStatusParametersType_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    V2Metadata.EntityTypes.historyDevicesStatusParametersType_ = value
                }
            }
        }

        public static var historyDevicesStatusType: EntityType {
            get {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    return V2Metadata.EntityTypes.historyDevicesStatusType_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    V2Metadata.EntityTypes.historyDevicesStatusType_ = value
                }
            }
        }

        public static var infectedSetType: EntityType {
            get {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    return V2Metadata.EntityTypes.infectedSetType_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    V2Metadata.EntityTypes.infectedSetType_ = value
                }
            }
        }

        public static var proximityDetectedSetType: EntityType {
            get {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    return V2Metadata.EntityTypes.proximityDetectedSetType_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    V2Metadata.EntityTypes.proximityDetectedSetType_ = value
                }
            }
        }

        public static var realTimeRoomStatusParametersType: EntityType {
            get {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    return V2Metadata.EntityTypes.realTimeRoomStatusParametersType_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    V2Metadata.EntityTypes.realTimeRoomStatusParametersType_ = value
                }
            }
        }

        public static var realTimeRoomStatusType: EntityType {
            get {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    return V2Metadata.EntityTypes.realTimeRoomStatusType_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    V2Metadata.EntityTypes.realTimeRoomStatusType_ = value
                }
            }
        }

        public static var tagSetType: EntityType {
            get {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    return V2Metadata.EntityTypes.tagSetType_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    V2Metadata.EntityTypes.tagSetType_ = value
                }
            }
        }
    }

    public class EntitySets {
        private static var deviceSet_: EntitySet = V2MetadataParser.parsed.entitySet(withName: "DeviceSet")

        private static var deviceTagSet_: EntitySet = V2MetadataParser.parsed.entitySet(withName: "DeviceTagSet")

        private static var deviceUserViewSet_: EntitySet = V2MetadataParser.parsed.entitySet(withName: "DeviceUserViewSet")

        private static var ephemeralIDInfectedSet_: EntitySet = V2MetadataParser.parsed.entitySet(withName: "EphemeralIDInfectedSet")

        private static var ephemeralIDSet_: EntitySet = V2MetadataParser.parsed.entitySet(withName: "EphemeralIDSet")

        private static var eventSet_: EntitySet = V2MetadataParser.parsed.entitySet(withName: "EventSet")

        private static var historyDevicesStatus_: EntitySet = V2MetadataParser.parsed.entitySet(withName: "HistoryDevicesStatus")

        private static var historyDevicesStatusParameters_: EntitySet = V2MetadataParser.parsed.entitySet(withName: "HistoryDevicesStatusParameters")

        private static var infectedSet_: EntitySet = V2MetadataParser.parsed.entitySet(withName: "InfectedSet")

        private static var proximityDetectedSet_: EntitySet = V2MetadataParser.parsed.entitySet(withName: "ProximityDetectedSet")

        private static var realTimeRoomStatus_: EntitySet = V2MetadataParser.parsed.entitySet(withName: "RealTimeRoomStatus")

        private static var realTimeRoomStatusParameters_: EntitySet = V2MetadataParser.parsed.entitySet(withName: "RealTimeRoomStatusParameters")

        private static var tagSet_: EntitySet = V2MetadataParser.parsed.entitySet(withName: "TagSet")

        public static var deviceSet: EntitySet {
            get {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    return V2Metadata.EntitySets.deviceSet_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    V2Metadata.EntitySets.deviceSet_ = value
                }
            }
        }

        public static var deviceTagSet: EntitySet {
            get {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    return V2Metadata.EntitySets.deviceTagSet_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    V2Metadata.EntitySets.deviceTagSet_ = value
                }
            }
        }

        public static var deviceUserViewSet: EntitySet {
            get {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    return V2Metadata.EntitySets.deviceUserViewSet_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    V2Metadata.EntitySets.deviceUserViewSet_ = value
                }
            }
        }

        public static var ephemeralIDInfectedSet: EntitySet {
            get {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    return V2Metadata.EntitySets.ephemeralIDInfectedSet_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    V2Metadata.EntitySets.ephemeralIDInfectedSet_ = value
                }
            }
        }

        public static var ephemeralIDSet: EntitySet {
            get {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    return V2Metadata.EntitySets.ephemeralIDSet_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    V2Metadata.EntitySets.ephemeralIDSet_ = value
                }
            }
        }

        public static var eventSet: EntitySet {
            get {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    return V2Metadata.EntitySets.eventSet_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    V2Metadata.EntitySets.eventSet_ = value
                }
            }
        }

        public static var historyDevicesStatus: EntitySet {
            get {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    return V2Metadata.EntitySets.historyDevicesStatus_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    V2Metadata.EntitySets.historyDevicesStatus_ = value
                }
            }
        }

        public static var historyDevicesStatusParameters: EntitySet {
            get {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    return V2Metadata.EntitySets.historyDevicesStatusParameters_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    V2Metadata.EntitySets.historyDevicesStatusParameters_ = value
                }
            }
        }

        public static var infectedSet: EntitySet {
            get {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    return V2Metadata.EntitySets.infectedSet_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    V2Metadata.EntitySets.infectedSet_ = value
                }
            }
        }

        public static var proximityDetectedSet: EntitySet {
            get {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    return V2Metadata.EntitySets.proximityDetectedSet_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    V2Metadata.EntitySets.proximityDetectedSet_ = value
                }
            }
        }

        public static var realTimeRoomStatus: EntitySet {
            get {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    return V2Metadata.EntitySets.realTimeRoomStatus_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    V2Metadata.EntitySets.realTimeRoomStatus_ = value
                }
            }
        }

        public static var realTimeRoomStatusParameters: EntitySet {
            get {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    return V2Metadata.EntitySets.realTimeRoomStatusParameters_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    V2Metadata.EntitySets.realTimeRoomStatusParameters_ = value
                }
            }
        }

        public static var tagSet: EntitySet {
            get {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    return V2Metadata.EntitySets.tagSet_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    V2Metadata.EntitySets.tagSet_ = value
                }
            }
        }
    }
}
