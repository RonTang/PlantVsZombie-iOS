//
//  PlantSimpleFactory.h
//  PlantsVsZombies
//
//  Created by Ron on 13-9-12.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Plant.h"
@interface PlantSimpleFactory : NSObject
-(Plant*)createPlantWithType:(int)type Frame:(CGRect)frame;
@end
