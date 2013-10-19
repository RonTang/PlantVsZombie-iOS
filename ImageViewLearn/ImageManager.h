//
//  ImageManager.h
//  PlantsVsZombies
//
//  Created by Ron on 13-9-12.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageManager : NSObject

+(id)defaultManager;
-(NSMutableArray*)getZombieImagesByType:(int)type;
-(NSMutableArray*)getZombieDeadImagesByType:(int)type;
-(NSMutableArray*)getPlantImagesByType:(int)type;
-(NSMutableArray*)getPlantSeedImages;
-(UIImage*)getPlantSeedImageByIndex:(int)index;
@end
