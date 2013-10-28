//
//  Zombie.h
//  PlantsVsZombies
//
//  Created by Ron on 13-9-3.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "ImageManager.h"
@protocol Zombies <NSObject>
@property (nonatomic,assign)int type;
@property (nonatomic,assign)int slowDownCount;//slowDownCount 
@property (nonatomic,assign)double offset;//step
@property (nonatomic ,assign)double speed;//timer
@property(nonatomic,assign)unsigned int count;//animation
@property(nonatomic,assign)unsigned int deadCount;//dead animation
@property (nonatomic,assign)ViewController* vc;//delegate
@property (nonatomic,assign)NSMutableArray* zombieImages;//animation images

@property (nonatomic,assign)unsigned int lineNum;
-(void)move;// move
-(void)goToHell;// death
@property (nonatomic,assign)int liftCount;// hp


@optional
-(id)initWithZombieVC:(ViewController*)vc;

@end
