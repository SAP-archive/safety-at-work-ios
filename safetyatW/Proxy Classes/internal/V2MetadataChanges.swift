// # Proxy Compiler 20.3.2-74d649-20200526

import Foundation
import SAPOData

internal class V2MetadataChanges {
    static func merge(metadata: CSDLDocument) {
        metadata.hasGeneratedProxies = true
        V2Metadata.document = metadata
        V2MetadataChanges.merge1(metadata: metadata)
        try! V2Factory.registerAll()
    }

    private static func merge1(metadata: CSDLDocument) {
        Ignore.valueOf_any(metadata)
        if !V2Metadata.EntityTypes.deviceSetType.isRemoved {
            V2Metadata.EntityTypes.deviceSetType = metadata.entityType(withName: "default.DeviceSetType")
        }
        if !V2Metadata.EntityTypes.deviceTagSetType.isRemoved {
            V2Metadata.EntityTypes.deviceTagSetType = metadata.entityType(withName: "default.DeviceTagSetType")
        }
        if !V2Metadata.EntityTypes.deviceUserViewSetType.isRemoved {
            V2Metadata.EntityTypes.deviceUserViewSetType = metadata.entityType(withName: "default.DeviceUserViewSetType")
        }
        if !V2Metadata.EntityTypes.ephemeralIDInfectedSetType.isRemoved {
            V2Metadata.EntityTypes.ephemeralIDInfectedSetType = metadata.entityType(withName: "default.EphemeralIDInfectedSetType")
        }
        if !V2Metadata.EntityTypes.ephemeralIDSetType.isRemoved {
            V2Metadata.EntityTypes.ephemeralIDSetType = metadata.entityType(withName: "default.EphemeralIDSetType")
        }
        if !V2Metadata.EntityTypes.eventSetType.isRemoved {
            V2Metadata.EntityTypes.eventSetType = metadata.entityType(withName: "default.EventSetType")
        }
        if !V2Metadata.EntityTypes.historyDevicesStatusParametersType.isRemoved {
            V2Metadata.EntityTypes.historyDevicesStatusParametersType = metadata.entityType(withName: "default.HistoryDevicesStatusParametersType")
        }
        if !V2Metadata.EntityTypes.historyDevicesStatusType.isRemoved {
            V2Metadata.EntityTypes.historyDevicesStatusType = metadata.entityType(withName: "default.HistoryDevicesStatusType")
        }
        if !V2Metadata.EntityTypes.infectedSetType.isRemoved {
            V2Metadata.EntityTypes.infectedSetType = metadata.entityType(withName: "default.InfectedSetType")
        }
        if !V2Metadata.EntityTypes.proximityDetectedSetType.isRemoved {
            V2Metadata.EntityTypes.proximityDetectedSetType = metadata.entityType(withName: "default.ProximityDetectedSetType")
        }
        if !V2Metadata.EntityTypes.realTimeRoomStatusParametersType.isRemoved {
            V2Metadata.EntityTypes.realTimeRoomStatusParametersType = metadata.entityType(withName: "default.RealTimeRoomStatusParametersType")
        }
        if !V2Metadata.EntityTypes.realTimeRoomStatusType.isRemoved {
            V2Metadata.EntityTypes.realTimeRoomStatusType = metadata.entityType(withName: "default.RealTimeRoomStatusType")
        }
        if !V2Metadata.EntityTypes.tagSetType.isRemoved {
            V2Metadata.EntityTypes.tagSetType = metadata.entityType(withName: "default.TagSetType")
        }
        if !V2Metadata.EntitySets.deviceSet.isRemoved {
            V2Metadata.EntitySets.deviceSet = metadata.entitySet(withName: "DeviceSet")
        }
        if !V2Metadata.EntitySets.deviceTagSet.isRemoved {
            V2Metadata.EntitySets.deviceTagSet = metadata.entitySet(withName: "DeviceTagSet")
        }
        if !V2Metadata.EntitySets.deviceUserViewSet.isRemoved {
            V2Metadata.EntitySets.deviceUserViewSet = metadata.entitySet(withName: "DeviceUserViewSet")
        }
        if !V2Metadata.EntitySets.ephemeralIDInfectedSet.isRemoved {
            V2Metadata.EntitySets.ephemeralIDInfectedSet = metadata.entitySet(withName: "EphemeralIDInfectedSet")
        }
        if !V2Metadata.EntitySets.ephemeralIDSet.isRemoved {
            V2Metadata.EntitySets.ephemeralIDSet = metadata.entitySet(withName: "EphemeralIDSet")
        }
        if !V2Metadata.EntitySets.eventSet.isRemoved {
            V2Metadata.EntitySets.eventSet = metadata.entitySet(withName: "EventSet")
        }
        if !V2Metadata.EntitySets.historyDevicesStatus.isRemoved {
            V2Metadata.EntitySets.historyDevicesStatus = metadata.entitySet(withName: "HistoryDevicesStatus")
        }
        if !V2Metadata.EntitySets.historyDevicesStatusParameters.isRemoved {
            V2Metadata.EntitySets.historyDevicesStatusParameters = metadata.entitySet(withName: "HistoryDevicesStatusParameters")
        }
        if !V2Metadata.EntitySets.infectedSet.isRemoved {
            V2Metadata.EntitySets.infectedSet = metadata.entitySet(withName: "InfectedSet")
        }
        if !V2Metadata.EntitySets.proximityDetectedSet.isRemoved {
            V2Metadata.EntitySets.proximityDetectedSet = metadata.entitySet(withName: "ProximityDetectedSet")
        }
        if !V2Metadata.EntitySets.realTimeRoomStatus.isRemoved {
            V2Metadata.EntitySets.realTimeRoomStatus = metadata.entitySet(withName: "RealTimeRoomStatus")
        }
        if !V2Metadata.EntitySets.realTimeRoomStatusParameters.isRemoved {
            V2Metadata.EntitySets.realTimeRoomStatusParameters = metadata.entitySet(withName: "RealTimeRoomStatusParameters")
        }
        if !V2Metadata.EntitySets.tagSet.isRemoved {
            V2Metadata.EntitySets.tagSet = metadata.entitySet(withName: "TagSet")
        }
        if !DeviceSetType.deviceID.isRemoved {
            DeviceSetType.deviceID = V2Metadata.EntityTypes.deviceSetType.property(withName: "DeviceID")
        }
        if !DeviceSetType.type_.isRemoved {
            DeviceSetType.type_ = V2Metadata.EntityTypes.deviceSetType.property(withName: "Type")
        }
        if !DeviceSetType.description.isRemoved {
            DeviceSetType.description = V2Metadata.EntityTypes.deviceSetType.property(withName: "Description")
        }
        if !DeviceSetType.ownedByID.isRemoved {
            DeviceSetType.ownedByID = V2Metadata.EntityTypes.deviceSetType.property(withName: "OwnedBy")
        }
        if !DeviceSetType.createdAt.isRemoved {
            DeviceSetType.createdAt = V2Metadata.EntityTypes.deviceSetType.property(withName: "CreatedAt")
        }
        if !DeviceSetType.createdBy.isRemoved {
            DeviceSetType.createdBy = V2Metadata.EntityTypes.deviceSetType.property(withName: "CreatedBy")
        }
        if !DeviceSetType.updatedAt.isRemoved {
            DeviceSetType.updatedAt = V2Metadata.EntityTypes.deviceSetType.property(withName: "UpdatedAt")
        }
        if !DeviceSetType.updatedBy.isRemoved {
            DeviceSetType.updatedBy = V2Metadata.EntityTypes.deviceSetType.property(withName: "UpdatedBy")
        }
        if !DeviceSetType.capacity.isRemoved {
            DeviceSetType.capacity = V2Metadata.EntityTypes.deviceSetType.property(withName: "Capacity")
        }
        if !DeviceSetType.major.isRemoved {
            DeviceSetType.major = V2Metadata.EntityTypes.deviceSetType.property(withName: "Major")
        }
        if !DeviceSetType.minor.isRemoved {
            DeviceSetType.minor = V2Metadata.EntityTypes.deviceSetType.property(withName: "Minor")
        }
        if !DeviceSetType.ownedBy.isRemoved {
            DeviceSetType.ownedBy = V2Metadata.EntityTypes.deviceSetType.property(withName: "ownedBy")
        }
        if !DeviceSetType.toEIDs.isRemoved {
            DeviceSetType.toEIDs = V2Metadata.EntityTypes.deviceSetType.property(withName: "toEIDs")
        }
        if !DeviceSetType.toInfections.isRemoved {
            DeviceSetType.toInfections = V2Metadata.EntityTypes.deviceSetType.property(withName: "toInfections")
        }
        if !DeviceSetType.toTags.isRemoved {
            DeviceSetType.toTags = V2Metadata.EntityTypes.deviceSetType.property(withName: "toTags")
        }
        if !DeviceTagSetType.deviceID.isRemoved {
            DeviceTagSetType.deviceID = V2Metadata.EntityTypes.deviceTagSetType.property(withName: "DeviceID")
        }
        if !DeviceTagSetType.tagKey.isRemoved {
            DeviceTagSetType.tagKey = V2Metadata.EntityTypes.deviceTagSetType.property(withName: "TagKey")
        }
        if !DeviceUserViewSetType.deviceID.isRemoved {
            DeviceUserViewSetType.deviceID = V2Metadata.EntityTypes.deviceUserViewSetType.property(withName: "DeviceID")
        }
        if !DeviceUserViewSetType.description.isRemoved {
            DeviceUserViewSetType.description = V2Metadata.EntityTypes.deviceUserViewSetType.property(withName: "Description")
        }
        if !EphemeralIDInfectedSetType.eid.isRemoved {
            EphemeralIDInfectedSetType.eid = V2Metadata.EntityTypes.ephemeralIDInfectedSetType.property(withName: "EID")
        }
        if !EphemeralIDInfectedSetType.infectedID.isRemoved {
            EphemeralIDInfectedSetType.infectedID = V2Metadata.EntityTypes.ephemeralIDInfectedSetType.property(withName: "InfectedID")
        }
        if !EphemeralIDInfectedSetType.toPotentialInfectedEIDs.isRemoved {
            EphemeralIDInfectedSetType.toPotentialInfectedEIDs = V2Metadata.EntityTypes.ephemeralIDInfectedSetType.property(withName: "toPotentialInfectedEIDs")
        }
        if !EphemeralIDSetType.eid.isRemoved {
            EphemeralIDSetType.eid = V2Metadata.EntityTypes.ephemeralIDSetType.property(withName: "EID")
        }
        if !EphemeralIDSetType.deviceID.isRemoved {
            EphemeralIDSetType.deviceID = V2Metadata.EntityTypes.ephemeralIDSetType.property(withName: "DeviceID")
        }
        if !EphemeralIDSetType.createdAt.isRemoved {
            EphemeralIDSetType.createdAt = V2Metadata.EntityTypes.ephemeralIDSetType.property(withName: "CreatedAt")
        }
        if !EphemeralIDSetType.toDevice.isRemoved {
            EphemeralIDSetType.toDevice = V2Metadata.EntityTypes.ephemeralIDSetType.property(withName: "toDevice")
        }
        if !EventSetType.sourceEID.isRemoved {
            EventSetType.sourceEID = V2Metadata.EntityTypes.eventSetType.property(withName: "SourceEID")
        }
        if !EventSetType.targetIED.isRemoved {
            EventSetType.targetIED = V2Metadata.EntityTypes.eventSetType.property(withName: "TargetIED")
        }
        if !EventSetType.distance.isRemoved {
            EventSetType.distance = V2Metadata.EntityTypes.eventSetType.property(withName: "Distance")
        }
        if !EventSetType.createdAt.isRemoved {
            EventSetType.createdAt = V2Metadata.EntityTypes.eventSetType.property(withName: "CreatedAt")
        }
        if !HistoryDevicesStatusParametersType.startDate.isRemoved {
            HistoryDevicesStatusParametersType.startDate = V2Metadata.EntityTypes.historyDevicesStatusParametersType.property(withName: "StartDate")
        }
        if !HistoryDevicesStatusParametersType.endDate.isRemoved {
            HistoryDevicesStatusParametersType.endDate = V2Metadata.EntityTypes.historyDevicesStatusParametersType.property(withName: "EndDate")
        }
        if !HistoryDevicesStatusParametersType.results.isRemoved {
            HistoryDevicesStatusParametersType.results = V2Metadata.EntityTypes.historyDevicesStatusParametersType.property(withName: "Results")
        }
        if !HistoryDevicesStatusType.genID.isRemoved {
            HistoryDevicesStatusType.genID = V2Metadata.EntityTypes.historyDevicesStatusType.property(withName: "GenID")
        }
        if !HistoryDevicesStatusType.deviceID.isRemoved {
            HistoryDevicesStatusType.deviceID = V2Metadata.EntityTypes.historyDevicesStatusType.property(withName: "DeviceID")
        }
        if !HistoryDevicesStatusType.description.isRemoved {
            HistoryDevicesStatusType.description = V2Metadata.EntityTypes.historyDevicesStatusType.property(withName: "Description")
        }
        if !HistoryDevicesStatusType.capacity.isRemoved {
            HistoryDevicesStatusType.capacity = V2Metadata.EntityTypes.historyDevicesStatusType.property(withName: "Capacity")
        }
        if !HistoryDevicesStatusType.timeFrame.isRemoved {
            HistoryDevicesStatusType.timeFrame = V2Metadata.EntityTypes.historyDevicesStatusType.property(withName: "TimeFrame")
        }
        if !HistoryDevicesStatusType.tagsString.isRemoved {
            HistoryDevicesStatusType.tagsString = V2Metadata.EntityTypes.historyDevicesStatusType.property(withName: "TagsString")
        }
        if !HistoryDevicesStatusType.avg.isRemoved {
            HistoryDevicesStatusType.avg = V2Metadata.EntityTypes.historyDevicesStatusType.property(withName: "Avg")
        }
        if !InfectedSetType.id.isRemoved {
            InfectedSetType.id = V2Metadata.EntityTypes.infectedSetType.property(withName: "ID")
        }
        if !InfectedSetType.deviceID.isRemoved {
            InfectedSetType.deviceID = V2Metadata.EntityTypes.infectedSetType.property(withName: "DeviceID")
        }
        if !InfectedSetType.createdAt.isRemoved {
            InfectedSetType.createdAt = V2Metadata.EntityTypes.infectedSetType.property(withName: "CreatedAt")
        }
        if !InfectedSetType.attrib1.isRemoved {
            InfectedSetType.attrib1 = V2Metadata.EntityTypes.infectedSetType.property(withName: "Attrib1")
        }
        if !InfectedSetType.attrib2.isRemoved {
            InfectedSetType.attrib2 = V2Metadata.EntityTypes.infectedSetType.property(withName: "Attrib2")
        }
        if !InfectedSetType.notes.isRemoved {
            InfectedSetType.notes = V2Metadata.EntityTypes.infectedSetType.property(withName: "Notes")
        }
        if !InfectedSetType.attrib3.isRemoved {
            InfectedSetType.attrib3 = V2Metadata.EntityTypes.infectedSetType.property(withName: "Attrib3")
        }
        if !InfectedSetType.toDevice.isRemoved {
            InfectedSetType.toDevice = V2Metadata.EntityTypes.infectedSetType.property(withName: "toDevice")
        }
        if !InfectedSetType.toInfectedEIDs.isRemoved {
            InfectedSetType.toInfectedEIDs = V2Metadata.EntityTypes.infectedSetType.property(withName: "toInfectedEIDs")
        }
        if !ProximityDetectedSetType.createdAt.isRemoved {
            ProximityDetectedSetType.createdAt = V2Metadata.EntityTypes.proximityDetectedSetType.property(withName: "CreatedAt")
        }
        if !ProximityDetectedSetType.eidInfected.isRemoved {
            ProximityDetectedSetType.eidInfected = V2Metadata.EntityTypes.proximityDetectedSetType.property(withName: "EIDInfected")
        }
        if !ProximityDetectedSetType.eidMatched.isRemoved {
            ProximityDetectedSetType.eidMatched = V2Metadata.EntityTypes.proximityDetectedSetType.property(withName: "EIDMatched")
        }
        if !ProximityDetectedSetType.eventTS.isRemoved {
            ProximityDetectedSetType.eventTS = V2Metadata.EntityTypes.proximityDetectedSetType.property(withName: "EventTS")
        }
        if !ProximityDetectedSetType.toPotentialInfectedEID.isRemoved {
            ProximityDetectedSetType.toPotentialInfectedEID = V2Metadata.EntityTypes.proximityDetectedSetType.property(withName: "toPotentialInfectedEID")
        }
        if !RealTimeRoomStatusParametersType.timeFrameInMinutes.isRemoved {
            RealTimeRoomStatusParametersType.timeFrameInMinutes = V2Metadata.EntityTypes.realTimeRoomStatusParametersType.property(withName: "TimeFrameInMinutes")
        }
        if !RealTimeRoomStatusParametersType.results.isRemoved {
            RealTimeRoomStatusParametersType.results = V2Metadata.EntityTypes.realTimeRoomStatusParametersType.property(withName: "Results")
        }
        if !RealTimeRoomStatusType.timeFrameInMinutes.isRemoved {
            RealTimeRoomStatusType.timeFrameInMinutes = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "TimeFrameInMinutes")
        }
        if !RealTimeRoomStatusType.deviceID.isRemoved {
            RealTimeRoomStatusType.deviceID = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "DeviceID")
        }
        if !RealTimeRoomStatusType.type_.isRemoved {
            RealTimeRoomStatusType.type_ = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "Type")
        }
        if !RealTimeRoomStatusType.description.isRemoved {
            RealTimeRoomStatusType.description = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "Description")
        }
        if !RealTimeRoomStatusType.ownedBy.isRemoved {
            RealTimeRoomStatusType.ownedBy = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "OwnedBy")
        }
        if !RealTimeRoomStatusType.capacity.isRemoved {
            RealTimeRoomStatusType.capacity = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "Capacity")
        }
        if !RealTimeRoomStatusType.distance.isRemoved {
            RealTimeRoomStatusType.distance = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "Distance")
        }
        if !RealTimeRoomStatusType.createdAt.isRemoved {
            RealTimeRoomStatusType.createdAt = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "CreatedAt")
        }
        if !RealTimeRoomStatusType.tagsString.isRemoved {
            RealTimeRoomStatusType.tagsString = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "TagsString")
        }
        if !RealTimeRoomStatusType.measuredPercentage.isRemoved {
            RealTimeRoomStatusType.measuredPercentage = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "MeasuredPercentage")
        }
        if !RealTimeRoomStatusType.measured.isRemoved {
            RealTimeRoomStatusType.measured = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "Measured")
        }
        if !RealTimeRoomStatusType.toTags.isRemoved {
            RealTimeRoomStatusType.toTags = V2Metadata.EntityTypes.realTimeRoomStatusType.property(withName: "toTags")
        }
        if !TagSetType.key_.isRemoved {
            TagSetType.key_ = V2Metadata.EntityTypes.tagSetType.property(withName: "Key")
        }
        if !TagSetType.type_.isRemoved {
            TagSetType.type_ = V2Metadata.EntityTypes.tagSetType.property(withName: "Type")
        }
        if !TagSetType.value.isRemoved {
            TagSetType.value = V2Metadata.EntityTypes.tagSetType.property(withName: "Value")
        }
    }
}
