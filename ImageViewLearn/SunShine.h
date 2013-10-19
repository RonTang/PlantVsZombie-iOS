//
//  SunShine.h
//  PlantsVsZombies
//
//  Created by Ron on 13-9-13.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;
@interface SunShine : UIImageView
@property (nonatomic,assign)ViewController* vc;
-(id)initWithVC:(ViewController *)vc x:(int)x y:(int)y;
@end
