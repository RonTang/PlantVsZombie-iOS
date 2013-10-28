//
//  ZombiePool.h
//  PlantsVsZombies
//
//  Created by Ron on 13-9-16.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import <Foundation/Foundation.h>


@class Zombie;
@class ZombieSimpleFactory;
float zombieOffsetY[5];
@interface ZombiePool : NSObject



-(id)initWithFactory:(ZombieSimpleFactory*)factory;
-(Zombie*)getZombie;
-(void)addZombie:(Zombie*)zombie;

@end
