//
//  ValueWrapper.h
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
    class Value;
}

#endif

@class ArenaAllocatorWrapper;

@interface ValueWrapper : OBJ_WRAPPER_BASE

#if __cplusplus
- (instancetype) initWithCppInstance: (const lodata::Value *) value;

-(const lodata::Value *) getCppInstance;
#endif

- (instancetype) initWithAllocator: (ArenaAllocatorWrapper *) allocator;

- (instancetype) init: (ArenaAllocatorWrapper *) allocator
			stringValue: (NSString *) value;

- (instancetype) init: (ArenaAllocatorWrapper *) allocator
			boolValue: (bool) value;

- (instancetype) init: (ArenaAllocatorWrapper *) allocator
			byteValue: (uint8_t) value;

- (instancetype) init: (ArenaAllocatorWrapper *) allocator
			doubleValue: (double) value;

- (instancetype) init: (ArenaAllocatorWrapper *) allocator
			floatValue: (float) value;

- (instancetype) init: (ArenaAllocatorWrapper *) allocator
			dataValue: (NSData *) value;

- (instancetype) init: (ArenaAllocatorWrapper *) allocator
			int8Value: (int8_t) value;

- (instancetype) init: (ArenaAllocatorWrapper *) allocator
		   int16Value: (int16_t) value;

- (instancetype) init: (ArenaAllocatorWrapper *) allocator
		   int32Value: (int32_t) value;

- (instancetype) init: (ArenaAllocatorWrapper *) allocator
		   int64Value: (int64_t) value;

-(bool) getBoolean;
-(uint8_t) getByte;
-(double) getDouble;
-(float) getFloat;
-(NSData *) getGUID;
-(int8_t) getInt8;
-(int16_t) getInt16;
-(int32_t) getInt32;
-(int64_t) getInt64;
-(NSString *) getDecimal;
-(NSString *) getString;
-(bool) getIsNull;
-(NSData *) getBinary;
-(NSString *) getTime;
-(NSString *) getDatetime;
-(NSString *) getDatetimeOffset;

@end
