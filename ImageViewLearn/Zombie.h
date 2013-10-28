//
//  Zombie.h
//  PlantsVsZombies
//
//  Created by Ron on 13-9-12.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Zombies.h"
@interface Zombie : UIImageView  <Zombies>
@property (nonatomic,assign)BOOL isDead;
@property (nonatomic,assign)BOOL isChange;
@property (nonatomic,assign)int oldOffset;
@property (nonatomic,assign)NSMutableArray* myLinePlants;
@property (nonatomic,assign)NSMutableOrderedSet* myLineZombies;
@property (nonatomic,assign)BOOL canEatPlant;
@end
