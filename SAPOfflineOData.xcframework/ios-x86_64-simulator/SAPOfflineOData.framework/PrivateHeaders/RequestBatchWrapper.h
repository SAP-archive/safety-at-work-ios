//
//  RequestBatchWrapper.h
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
    class RequestBatch;
}

#endif

@class RequestSingleWrapper;
@class ChangeSetWrapper;

@interface RequestBatchWrapper : OBJ_WRAPPER_BASE

- (instancetype) init;

#if __cplusplus
- (lodata::RequestBatch *) getCppInstance;
#endif

- (void) setHeader: (NSString * ) key header: (NSString * ) header;
- (RequestSingleWrapper *) createQueryOperation;
- (ChangeSetWrapper *) createChangeSet;

@end
