//
//  SunFlower.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-12.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "SunFlower.h"
#import "SunShine.h"
#import "ViewController.h"
@implementation SunFlower

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.costShine=50;
        [self setUserInteractionEnabled:YES];
         self.animationImages= [[ImageManager defaultManager]getPlantImagesByType:0];
        self.image = self.animationImages[0];
        self.lifeCount=5;
        
    }
    return self;
}

-(void)comingSunshine{
   CGPoint p= [self convertPoint:self.center toView:self.vc.view];
   SunShine* current=[[SunShine alloc]initWithVC:self.vc x:p.x y:p.y];
   [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(cleanSunshine:) userInfo:current repeats:NO];
}

-(void)cleanSunshine:(NSTimer*)timer{
    SunShine* sun=timer.userInfo;
    if(sun.superview!=nil){
        [sun removeFromSuperview];
      
        [sun removeGestureRecognizer:[[sun gestureRecognizers]lastObject]];
        [sun release];
     
        
    }
}
-(void)dealloc{
  
    [super dealloc];
}
@end
