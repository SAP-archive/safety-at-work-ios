//
//  StoreOptionsWrapper.h
//  SAPOfflineOData
//
//  Copyright © 2017 SAP SE or an SAP affiliate company. All rights reserved.
//
//  No part of this publication may be reproduced or transmitted in any form or for any purpose
//  without the express permission of SAP SE.  The information contained herein may be changed
//  without prior notice.
//

#import "MemoryTrackerBase.h"

#if __cplusplus
namespace lodata
{
    class StoreInfo;
}
#endif

@interface StoreOptionsWrapper : OBJ_WRAPPER_BASE

- (instancetype) init;

- (void) setStoreName: (NSString *) name;
- (NSString *) getStoreName;
- (void) setStorePath: (NSString *) path;
- (NSString *) getStorePath;
- (void) setEnableHttps: (bool) isHttps;
- (void) setServerSupportsBind: (bool) isSupported;
- (void) setPort: (int32_t) port;
- (int32_t) getPort;
- (void) setTimeout: (int32_t) timeout;
- (void) setHost: (NSString *) host;
- (void) setServiceRoot: (NSString *) serviceRoot;
- (void) setEnableRepeatableRequests: (bool) isEnabled;
- (void) setEnableRequestQueueOptimization: (bool) isEnabled;
- (bool) isTransactionBuilderEnabled;
- (void) setEnableTransactionBuilder: (bool) isEnabled;
- (void) setEnableUndoLocalCreation: (bool) isEnabled;
- (void) setEnableIndividualErrorArchiveDeletion: (bool) isEnabled;
- (void) setEnablePercentEncodeURI: (bool) isEnabled;
- (void) setPageSize: (int32_t) pageSize;
- (void) setUrlSuffix: (NSString *) urlSuffix;
- (void) setExtraStreamParameters: (NSString *) params;
- (void) setStoreEncryptionKey: (NSString *) key;
- (BOOL) addCustomCookie: (NSString *) name
                   value: (NSString *) value
				   error: (NSError *__autoreleasing*) error;
- (BOOL) addCustomHeader: (NSString *) name
                   value: (NSString *) value
				   error: (NSError *__autoreleasing*) error;
- (BOOL) addDefiningRequest: (NSString *) name
                   query: (NSString *) query
                   automaticallyRetrieveStreams: (bool) automaticallyRetrieveStreams
				   error: (NSError *__autoreleasing*) error;
- (void) clearDefiningRequests;

#if __cplusplus
- (lodata::StoreInfo *) getCppInstance;
#endif

@end
