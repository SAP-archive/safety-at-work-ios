// # Proxy Compiler 20.3.2-74d649-20200526

import Foundation
import SAPOData

internal class V2Factory {
    static func registerAll() throws {
        V2Metadata.EntityTypes.deviceSetType.registerFactory(ObjectFactory.with(create: { DeviceSetType(withDefaults: false) }, createWithDecoder: { d in try DeviceSetType(from: d) }))
        V2Metadata.EntityTypes.deviceTagSetType.registerFactory(ObjectFactory.with(create: { DeviceTagSetType(withDefaults: false) }, createWithDecoder: { d in try DeviceTagSetType(from: d) }))
        V2Metadata.EntityTypes.deviceUserViewSetType.registerFactory(ObjectFactory.with(create: { DeviceUserViewSetType(withDefaults: false) }, createWithDecoder: { d in try DeviceUserViewSetType(from: d) }))
        V2Metadata.EntityTypes.ephemeralIDInfectedSetType.registerFactory(ObjectFactory.with(create: { EphemeralIDInfectedSetType(withDefaults: false) }, createWithDecoder: { d in try EphemeralIDInfectedSetType(from: d) }))
        V2Metadata.EntityTypes.ephemeralIDSetType.registerFactory(ObjectFactory.with(create: { EphemeralIDSetType(withDefaults: false) }, createWithDecoder: { d in try EphemeralIDSetType(from: d) }))
        V2Metadata.EntityTypes.eventSetType.registerFactory(ObjectFactory.with(create: { EventSetType(withDefaults: false) }, createWithDecoder: { d in try EventSetType(from: d) }))
        V2Metadata.EntityTypes.historyDevicesStatusParametersType.registerFactory(ObjectFactory.with(create: { HistoryDevicesStatusParametersType(withDefaults: false) }, createWithDecoder: { d in try HistoryDevicesStatusParametersType(from: d) }))
        V2Metadata.EntityTypes.historyDevicesStatusType.registerFactory(ObjectFactory.with(create: { HistoryDevicesStatusType(withDefaults: false) }, createWithDecoder: { d in try HistoryDevicesStatusType(from: d) }))
        V2Metadata.EntityTypes.infectedSetType.registerFactory(ObjectFactory.with(create: { InfectedSetType(withDefaults: false) }, createWithDecoder: { d in try InfectedSetType(from: d) }))
        V2Metadata.EntityTypes.proximityDetectedSetType.registerFactory(ObjectFactory.with(create: { ProximityDetectedSetType(withDefaults: false) }, createWithDecoder: { d in try ProximityDetectedSetType(from: d) }))
        V2Metadata.EntityTypes.realTimeRoomStatusParametersType.registerFactory(ObjectFactory.with(create: { RealTimeRoomStatusParametersType(withDefaults: false) }, createWithDecoder: { d in try RealTimeRoomStatusParametersType(from: d) }))
        V2Metadata.EntityTypes.realTimeRoomStatusType.registerFactory(ObjectFactory.with(create: { RealTimeRoomStatusType(withDefaults: false) }, createWithDecoder: { d in try RealTimeRoomStatusType(from: d) }))
        V2Metadata.EntityTypes.tagSetType.registerFactory(ObjectFactory.with(create: { TagSetType(withDefaults: false) }, createWithDecoder: { d in try TagSetType(from: d) }))
        V2StaticResolver.resolve()
    }
}
