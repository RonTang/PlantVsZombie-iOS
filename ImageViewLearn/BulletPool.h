//
//  BulletPool.h
//  PlantsVsZombies
//
//  Created by Ron on 13-9-18.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Bullet;
@class ViewController;
@interface BulletPool : NSObject
@property (nonatomic,assign)ViewController* vc;
@property (nonatomic,retain)NSMutableArray* allBullets;
-(Bullet*)getBullet;
-(void)addBullet:(Bullet*)bullet;
-(id)initWithVC:(ViewController*)vc;
@end
