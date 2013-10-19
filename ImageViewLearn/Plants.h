//
//  Plants.h
//  PlantsVsZombies
//
//  Created by Ron on 13-9-12.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ViewController;
@protocol Plants <NSObject>
@property(nonatomic,assign)unsigned int count;
@property(nonatomic,assign)unsigned int costShine;
@property (nonatomic,assign)int lifeCount;
@property (nonatomic,assign)ViewController* vc;
@property (nonatomic,assign)NSMutableArray* plantImages;
@property (nonatomic,assign)NSTimer* shakeTimer;
-(void)shake:(NSTimer*)timer;
@property (nonatomic,assign)unsigned int lineNum;

@optional
//@property (nonatomic,assign)NSTimer* fireTimer;
@property (nonatomic,assign)NSTimer* shootTimer;
@property (nonatomic,assign)NSTimer* shineTimer;
-(void)shoot:(NSTimer*)timer;

-(void)comingSunshine;
@end
