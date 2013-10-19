//
//  Plant.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-12.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "Plant.h"
#import "ViewController.h"
@implementation Plant
@synthesize costShine=_costShine;
@synthesize vc=_vc;
@synthesize plantImages=_plantImages;
@synthesize count=_count;
@synthesize lifeCount=_lifeCount;
@synthesize lineNum=_lineNum;
@synthesize shakeTimer=_shakeTimer;
@synthesize shootTimer=_shootTimer;
@synthesize shineTimer=_shineTimer;

-(void)beginAnimation{

   //************//
    NSLog(@"flower life:%i",[self retainCount]);
    self.viewRect=[self convertRect:self.frame toView:self.vc.view];
    self.viewLocation=[self convertPoint:self.center toView:self.vc.view];
    if([self respondsToSelector:@selector(shake:)])
    self.shakeTimer  =[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(shake:) userInfo:nil repeats:YES];
    if([self respondsToSelector:@selector(shoot:)])
    self.shootTimer  =[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(shoot:) userInfo:nil repeats:YES];
    if([self respondsToSelector:@selector(comingSunshine)])
    self.shineTimer=[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(comingSunshine) userInfo:nil repeats:YES];
    NSLog(@"flower life:%i",[self retainCount]);
  
}

-(void)shake:(NSTimer*)timer{
    if(self.count==8)
        self.count=0;
    
    self.image = self.animationImages[self.count];
    self.count+=1;
    

}
-(void)goToHell{
    NSLog(@"----plant go to hell---");
    NSLog(@"init %i",[self retainCount]);
    if(self.shakeTimer!=nil){
        [self.shakeTimer invalidate];
        NSLog(@"shake: %i",[self retainCount]);
    }
    if(self.shootTimer!=nil){
      [self.shootTimer invalidate];
        NSLog(@"shoot: %i",[self retainCount]);
    }
    if(self.shineTimer!=nil){
    [self.shineTimer invalidate];
        NSLog(@"shine: %i",[self retainCount]);
      
    }
    
    //[self release];
     NSLog(@"dead Plant:retainCount:%i",[self retainCount]);
    [self.vc.allPlants[self.lineNum] removeObject:self];
    NSLog(@"dead Plant:retainCount:%i",[self retainCount]);
    [self removeFromSuperview];
   
   

}

@end
