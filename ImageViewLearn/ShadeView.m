//
//  ShadeView.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-14.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "ShadeView.h"

@implementation ShadeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor blackColor];
        self.alpha=0.6;
    }
    return self;
}

-(void)canGetPlantSeed{
    NSLog(@"----shadeViews count:%i",self.shadeViews.count);
    [self removeFromSuperview];
    [self.shadeViews removeObject:self];
    [self release];
    
}

-(void)dealloc{
    NSLog(@"shadeView dead");
    [super dealloc];

}
@end
