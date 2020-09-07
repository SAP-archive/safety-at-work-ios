// # Proxy Compiler 20.3.2-74d649-20200526

import Foundation
import SAPOData

open class V2<Provider: DataServiceProvider>: DataService<Provider> {
    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = V2Metadata.document
    }

    open func fetchDeviceSet(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [DeviceSetType] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try DeviceSetType.array(from: self.executeQuery(var_query.fromDefault(V2Metadata.EntitySets.deviceSet), headers: var_headers, options: var_options).entityList())
    }

    open func fetchDeviceSet(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([DeviceSetType]?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchDeviceSet(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchDeviceSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> DeviceSetType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<DeviceSetType>.from(self.executeQuery(query.fromDefault(V2Metadata.EntitySets.deviceSet), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchDeviceSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (DeviceSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchDeviceSetType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchDeviceSetTypeWithKey(deviceID: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> DeviceSetType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchDeviceSetType(matching: var_query.withKey(DeviceSetType.key(deviceID: deviceID)), headers: headers, options: options)
    }

    open func fetchDeviceSetTypeWithKey(deviceID: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (DeviceSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchDeviceSetTypeWithKey(deviceID: deviceID, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchDeviceTagSet(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [DeviceTagSetType] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try DeviceTagSetType.array(from: self.executeQuery(var_query.fromDefault(V2Metadata.EntitySets.deviceTagSet), headers: var_headers, options: var_options).entityList())
    }

    open func fetchDeviceTagSet(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([DeviceTagSetType]?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchDeviceTagSet(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchDeviceTagSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> DeviceTagSetType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<DeviceTagSetType>.from(self.executeQuery(query.fromDefault(V2Metadata.EntitySets.deviceTagSet), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchDeviceTagSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (DeviceTagSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchDeviceTagSetType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchDeviceTagSetTypeWithKey(deviceID: String?, tagKey: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> DeviceTagSetType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchDeviceTagSetType(matching: var_query.withKey(DeviceTagSetType.key(deviceID: deviceID, tagKey: tagKey)), headers: headers, options: options)
    }

    open func fetchDeviceTagSetTypeWithKey(deviceID: String?, tagKey: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (DeviceTagSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchDeviceTagSetTypeWithKey(deviceID: deviceID, tagKey: tagKey, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchDeviceUserViewSet(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [DeviceUserViewSetType] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try DeviceUserViewSetType.array(from: self.executeQuery(var_query.fromDefault(V2Metadata.EntitySets.deviceUserViewSet), headers: var_headers, options: var_options).entityList())
    }

    open func fetchDeviceUserViewSet(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([DeviceUserViewSetType]?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchDeviceUserViewSet(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchDeviceUserViewSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> DeviceUserViewSetType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<DeviceUserViewSetType>.from(self.executeQuery(query.fromDefault(V2Metadata.EntitySets.deviceUserViewSet), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchDeviceUserViewSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (DeviceUserViewSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchDeviceUserViewSetType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchDeviceUserViewSetTypeWithKey(deviceID: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> DeviceUserViewSetType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchDeviceUserViewSetType(matching: var_query.withKey(DeviceUserViewSetType.key(deviceID: deviceID)), headers: headers, options: options)
    }

    open func fetchDeviceUserViewSetTypeWithKey(deviceID: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (DeviceUserViewSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchDeviceUserViewSetTypeWithKey(deviceID: deviceID, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchEphemeralIDInfectedSet(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [EphemeralIDInfectedSetType] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try EphemeralIDInfectedSetType.array(from: self.executeQuery(var_query.fromDefault(V2Metadata.EntitySets.ephemeralIDInfectedSet), headers: var_headers, options: var_options).entityList())
    }

    open func fetchEphemeralIDInfectedSet(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([EphemeralIDInfectedSetType]?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchEphemeralIDInfectedSet(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchEphemeralIDInfectedSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> EphemeralIDInfectedSetType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<EphemeralIDInfectedSetType>.from(self.executeQuery(query.fromDefault(V2Metadata.EntitySets.ephemeralIDInfectedSet), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchEphemeralIDInfectedSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (EphemeralIDInfectedSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchEphemeralIDInfectedSetType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchEphemeralIDInfectedSetTypeWithKey(eid: String?, infectedID: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> EphemeralIDInfectedSetType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchEphemeralIDInfectedSetType(matching: var_query.withKey(EphemeralIDInfectedSetType.key(eid: eid, infectedID: infectedID)), headers: headers, options: options)
    }

    open func fetchEphemeralIDInfectedSetTypeWithKey(eid: String?, infectedID: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (EphemeralIDInfectedSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchEphemeralIDInfectedSetTypeWithKey(eid: eid, infectedID: infectedID, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchEphemeralIDSet(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [EphemeralIDSetType] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try EphemeralIDSetType.array(from: self.executeQuery(var_query.fromDefault(V2Metadata.EntitySets.ephemeralIDSet), headers: var_headers, options: var_options).entityList())
    }

    open func fetchEphemeralIDSet(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([EphemeralIDSetType]?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchEphemeralIDSet(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchEphemeralIDSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> EphemeralIDSetType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<EphemeralIDSetType>.from(self.executeQuery(query.fromDefault(V2Metadata.EntitySets.ephemeralIDSet), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchEphemeralIDSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (EphemeralIDSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchEphemeralIDSetType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchEphemeralIDSetTypeWithKey(eid: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> EphemeralIDSetType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchEphemeralIDSetType(matching: var_query.withKey(EphemeralIDSetType.key(eid: eid)), headers: headers, options: options)
    }

    open func fetchEphemeralIDSetTypeWithKey(eid: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (EphemeralIDSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchEphemeralIDSetTypeWithKey(eid: eid, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchEventSet(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [EventSetType] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try EventSetType.array(from: self.executeQuery(var_query.fromDefault(V2Metadata.EntitySets.eventSet), headers: var_headers, options: var_options).entityList())
    }

    open func fetchEventSet(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([EventSetType]?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchEventSet(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchEventSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> EventSetType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<EventSetType>.from(self.executeQuery(query.fromDefault(V2Metadata.EntitySets.eventSet), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchEventSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (EventSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchEventSetType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchEventSetTypeWithKey(sourceEID: String?, targetIED: String?, createdAt: LocalDateTime?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> EventSetType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchEventSetType(matching: var_query.withKey(EventSetType.key(sourceEID: sourceEID, targetIED: targetIED, createdAt: createdAt)), headers: headers, options: options)
    }

    open func fetchEventSetTypeWithKey(sourceEID: String?, targetIED: String?, createdAt: LocalDateTime?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (EventSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchEventSetTypeWithKey(sourceEID: sourceEID, targetIED: targetIED, createdAt: createdAt, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchHistoryDevicesStatus(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [HistoryDevicesStatusType] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try HistoryDevicesStatusType.array(from: self.executeQuery(var_query.fromDefault(V2Metadata.EntitySets.historyDevicesStatus), headers: var_headers, options: var_options).entityList())
    }

    open func fetchHistoryDevicesStatus(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([HistoryDevicesStatusType]?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchHistoryDevicesStatus(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchHistoryDevicesStatusParameters(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [HistoryDevicesStatusParametersType] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try HistoryDevicesStatusParametersType.array(from: self.executeQuery(var_query.fromDefault(V2Metadata.EntitySets.historyDevicesStatusParameters), headers: var_headers, options: var_options).entityList())
    }

    open func fetchHistoryDevicesStatusParameters(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([HistoryDevicesStatusParametersType]?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchHistoryDevicesStatusParameters(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchHistoryDevicesStatusParametersType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> HistoryDevicesStatusParametersType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<HistoryDevicesStatusParametersType>.from(self.executeQuery(query.fromDefault(V2Metadata.EntitySets.historyDevicesStatusParameters), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchHistoryDevicesStatusParametersType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (HistoryDevicesStatusParametersType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchHistoryDevicesStatusParametersType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchHistoryDevicesStatusParametersTypeWithKey(startDate: LocalDateTime?, endDate: LocalDateTime?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> HistoryDevicesStatusParametersType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchHistoryDevicesStatusParametersType(matching: var_query.withKey(HistoryDevicesStatusParametersType.key(startDate: startDate, endDate: endDate)), headers: headers, options: options)
    }

    open func fetchHistoryDevicesStatusParametersTypeWithKey(startDate: LocalDateTime?, endDate: LocalDateTime?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (HistoryDevicesStatusParametersType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchHistoryDevicesStatusParametersTypeWithKey(startDate: startDate, endDate: endDate, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchHistoryDevicesStatusType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> HistoryDevicesStatusType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<HistoryDevicesStatusType>.from(self.executeQuery(query.fromDefault(V2Metadata.EntitySets.historyDevicesStatus), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchHistoryDevicesStatusType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (HistoryDevicesStatusType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchHistoryDevicesStatusType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchHistoryDevicesStatusTypeWithKey(genID: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> HistoryDevicesStatusType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchHistoryDevicesStatusType(matching: var_query.withKey(HistoryDevicesStatusType.key(genID: genID)), headers: headers, options: options)
    }

    open func fetchHistoryDevicesStatusTypeWithKey(genID: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (HistoryDevicesStatusType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchHistoryDevicesStatusTypeWithKey(genID: genID, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchInfectedSet(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [InfectedSetType] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try InfectedSetType.array(from: self.executeQuery(var_query.fromDefault(V2Metadata.EntitySets.infectedSet), headers: var_headers, options: var_options).entityList())
    }

    open func fetchInfectedSet(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([InfectedSetType]?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchInfectedSet(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchInfectedSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> InfectedSetType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<InfectedSetType>.from(self.executeQuery(query.fromDefault(V2Metadata.EntitySets.infectedSet), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchInfectedSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (InfectedSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchInfectedSetType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchInfectedSetTypeWithKey(id: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> InfectedSetType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchInfectedSetType(matching: var_query.withKey(InfectedSetType.key(id: id)), headers: headers, options: options)
    }

    open func fetchInfectedSetTypeWithKey(id: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (InfectedSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchInfectedSetTypeWithKey(id: id, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProximityDetectedSet(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [ProximityDetectedSetType] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try ProximityDetectedSetType.array(from: self.executeQuery(var_query.fromDefault(V2Metadata.EntitySets.proximityDetectedSet), headers: var_headers, options: var_options).entityList())
    }

    open func fetchProximityDetectedSet(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([ProximityDetectedSetType]?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchProximityDetectedSet(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProximityDetectedSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> ProximityDetectedSetType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<ProximityDetectedSetType>.from(self.executeQuery(query.fromDefault(V2Metadata.EntitySets.proximityDetectedSet), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchProximityDetectedSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (ProximityDetectedSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchProximityDetectedSetType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProximityDetectedSetTypeWithKey(createdAt: LocalDateTime?, eidInfected: String?, eidMatched: String?, eventTS: LocalDateTime?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> ProximityDetectedSetType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchProximityDetectedSetType(matching: var_query.withKey(ProximityDetectedSetType.key(createdAt: createdAt, eidInfected: eidInfected, eidMatched: eidMatched, eventTS: eventTS)), headers: headers, options: options)
    }

    open func fetchProximityDetectedSetTypeWithKey(createdAt: LocalDateTime?, eidInfected: String?, eidMatched: String?, eventTS: LocalDateTime?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (ProximityDetectedSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchProximityDetectedSetTypeWithKey(createdAt: createdAt, eidInfected: eidInfected, eidMatched: eidMatched, eventTS: eventTS, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchRealTimeRoomStatus(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [RealTimeRoomStatusType] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try RealTimeRoomStatusType.array(from: self.executeQuery(var_query.fromDefault(V2Metadata.EntitySets.realTimeRoomStatus), headers: var_headers, options: var_options).entityList())
    }

    open func fetchRealTimeRoomStatus(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([RealTimeRoomStatusType]?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchRealTimeRoomStatus(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchRealTimeRoomStatusParameters(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [RealTimeRoomStatusParametersType] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try RealTimeRoomStatusParametersType.array(from: self.executeQuery(var_query.fromDefault(V2Metadata.EntitySets.realTimeRoomStatusParameters), headers: var_headers, options: var_options).entityList())
    }

    open func fetchRealTimeRoomStatusParameters(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([RealTimeRoomStatusParametersType]?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchRealTimeRoomStatusParameters(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchRealTimeRoomStatusParametersType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> RealTimeRoomStatusParametersType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<RealTimeRoomStatusParametersType>.from(self.executeQuery(query.fromDefault(V2Metadata.EntitySets.realTimeRoomStatusParameters), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchRealTimeRoomStatusParametersType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (RealTimeRoomStatusParametersType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchRealTimeRoomStatusParametersType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchRealTimeRoomStatusParametersTypeWithKey(timeFrameInMinutes: Int?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> RealTimeRoomStatusParametersType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchRealTimeRoomStatusParametersType(matching: var_query.withKey(RealTimeRoomStatusParametersType.key(timeFrameInMinutes: timeFrameInMinutes)), headers: headers, options: options)
    }

    open func fetchRealTimeRoomStatusParametersTypeWithKey(timeFrameInMinutes: Int?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (RealTimeRoomStatusParametersType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchRealTimeRoomStatusParametersTypeWithKey(timeFrameInMinutes: timeFrameInMinutes, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchRealTimeRoomStatusType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> RealTimeRoomStatusType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<RealTimeRoomStatusType>.from(self.executeQuery(query.fromDefault(V2Metadata.EntitySets.realTimeRoomStatus), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchRealTimeRoomStatusType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (RealTimeRoomStatusType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchRealTimeRoomStatusType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchRealTimeRoomStatusTypeWithKey(timeFrameInMinutes: Int?, deviceID: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> RealTimeRoomStatusType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchRealTimeRoomStatusType(matching: var_query.withKey(RealTimeRoomStatusType.key(timeFrameInMinutes: timeFrameInMinutes, deviceID: deviceID)), headers: headers, options: options)
    }

    open func fetchRealTimeRoomStatusTypeWithKey(timeFrameInMinutes: Int?, deviceID: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (RealTimeRoomStatusType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchRealTimeRoomStatusTypeWithKey(timeFrameInMinutes: timeFrameInMinutes, deviceID: deviceID, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchTagSet(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [TagSetType] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try TagSetType.array(from: self.executeQuery(var_query.fromDefault(V2Metadata.EntitySets.tagSet), headers: var_headers, options: var_options).entityList())
    }

    open func fetchTagSet(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([TagSetType]?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchTagSet(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchTagSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> TagSetType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<TagSetType>.from(self.executeQuery(query.fromDefault(V2Metadata.EntitySets.tagSet), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchTagSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (TagSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchTagSetType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchTagSetTypeWithKey(key_: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> TagSetType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchTagSetType(matching: var_query.withKey(TagSetType.key(key_: key_)), headers: headers, options: options)
    }

    open func fetchTagSetTypeWithKey(key_: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (TagSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchTagSetTypeWithKey(key_: key_, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open override var metadataLock: MetadataLock {
        return V2Metadata.lock
    }

    open override func refreshMetadata() throws {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        do {
            try ProxyInternal.refreshMetadataWithLock(service: self, fetcher: nil, options: V2MetadataParser.options, mergeAction: { V2MetadataChanges.merge(metadata: self.metadata) })
        }
    }
}
