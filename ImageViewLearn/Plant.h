//
//  Plant.h
//  PlantsVsZombies
//
//  Created by Ron on 13-9-12.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Plants.h"
#import "ImageManager.h"
@interface Plant : UIImageView <Plants>
@property (nonatomic,assign)CGRect viewRect;
@property (nonatomic,assign)CGPoint viewLocation;
-(void)beginAnimation;
-(void)goToHell;
@end
