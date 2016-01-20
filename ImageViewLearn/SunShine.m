//
//  SunShine.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-13.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "SunShine.h"
#import "ViewController.h"
@implementation SunShine
{
    UITapGestureRecognizer* tap;
    NSTimer* timer;
}
static UIImage* sunShineImage=nil;


-(id)initWithVC:(ViewController *)vc x:(int)x y:(int)y{
    if(self=[super init]){
        self.vc=vc;
        
        if(sunShineImage==nil)
            sunShineImage=[[UIImage imageNamed:@"sun.png"]retain];
        self.image=sunShineImage;
        tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(beginAnimation)];
        [self setUserInteractionEnabled:YES];
        [self addGestureRecognizer:tap];
        [tap release];
        self.frame=CGRectMake(x+10, y-5, 35, 35);
        self.tag=1234;
        self.image =sunShineImage;
        [self.vc.view addSubview:self];
        
    }
    return self;
}
-(void)beginAnimation{

   
    self.vc.shineCount+=25;
    self.vc.shineLabel.text=[NSString stringWithFormat:@"%i",self.vc
                             .shineCount];
    [UIView beginAnimations:@"getSunShine" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(disappear)];
    self.center=CGPointMake(35, 15);
    [UIView commitAnimations];
    
    
}
-(void)disappear{
   
    if(self.superview!=nil){
    [self removeFromSuperview];
    [self removeGestureRecognizer:tap];
    [self release];
    }
    

}
-(void)dealloc{
   
    [super dealloc];
}

@end
