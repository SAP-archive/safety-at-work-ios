//
//  TypeInstanceWrapper.h
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
    class ArenaAllocator;
    class TypeInstance;
}

#endif

@class ComplexTypeInstanceWrapper;
@class ComplexTypePropertyWrapper;
@class PropertyWrapper;
@class ValueWrapper;

@interface TypeInstanceWrapper : OBJ_WRAPPER_BASE

#if __cplusplus
- (instancetype ) initWithCppInstance: (const lodata::TypeInstance * ) cppStructureInstance;
#endif

- (ValueWrapper *) getValue: (PropertyWrapper *) property;
- (ComplexTypeInstanceWrapper *) getComplexTypeInstance: (ComplexTypePropertyWrapper *) property;

@end
