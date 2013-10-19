//
//  BigNut.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-12.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "BigNut.h"

@implementation BigNut

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.costShine=150;
        [self setUserInteractionEnabled:YES];
        self.animationImages= [[ImageManager defaultManager]getPlantImagesByType:3];
        self.image = self.animationImages[0];
        self.lifeCount=500;
    }
    return self;
}


-(void)dealloc{
    //NSLog(@"nut dead");
    [super dealloc];
}

@end
