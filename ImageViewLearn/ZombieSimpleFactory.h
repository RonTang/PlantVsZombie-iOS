//
//  ZombieFactory.h
//  PlantsVsZombies
//
//  Created by Ron on 13-9-3.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "Zombie.h"
@interface ZombieSimpleFactory : NSObject
@property (nonatomic,assign)ViewController* vc;
-(id)initWithVC:(ViewController*)vc;
-(Zombie*)createZombieWithType:(int)type;
@end
