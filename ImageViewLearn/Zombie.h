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
@property (nonatomic,retain)NSMutableArray* myLinePlants;
@end
