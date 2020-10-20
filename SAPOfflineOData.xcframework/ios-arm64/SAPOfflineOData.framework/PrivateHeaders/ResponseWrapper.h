//
//  ResponseWrapper.h
//  SAPOfflineOData
//
//  Copyright © 2017 SAP SE or an SAP affiliate company. All rights reserved.
//
//  No part of this publication may be reproduced or transmitted in any form or for any purpose
//  without the express permission of SAP SE.  The information contained herein may be changed
//  without prior notice.
//

#import "EnumerationDef.h"
#import "MemoryTrackerBase.h"

#if __cplusplus

namespace lodata
{
    class Response;
}

#endif

@class ComplexTypeResultWrapper;
@class EntitySetResultWrapper;
@class EntityTypeResultWrapper;
@class PropertyResultWrapper;
@class StreamInstanceWrapper;

@interface ResponseWrapper : OBJ_WRAPPER_BASE

#if __cplusplus

- (instancetype) initWithCppInstance:(lodata::Response *) cppResponse;

- (instancetype) initWithCppInstance:(lodata::Response *) cppResponse
							 isBatch:(bool) isBatch;

#endif

- (NSString *) getMetadataDocument;

- (ResponseTypeObjC) getResponseType;

- (NSString *) getHeader:(NSString * ) name;

- (EntitySetResultWrapper *) getEntitySetResultWrapper;

- (EntityTypeResultWrapper *) getEntityTypeResultWrapper;

- (StreamInstanceWrapper *) getStreamInstanceWrapper ;

- (PropertyResultWrapper *) getPropertyResultWrapper ;

- (ComplexTypeResultWrapper *) getComplexTypeResultWrapper ;

// Return the count in the result of a request with $count option.
// This method is currently not used since HCPOData DataQuery does not support $count yet.
// Just leave it here for future development.
- (UInt64) getCount;

- (int) getStatusCode;

- (bool) hasError;

- (bool) getStoredModification;

- (int) getErrorCode;

- (NSString *) getErrorMessage;

@end
