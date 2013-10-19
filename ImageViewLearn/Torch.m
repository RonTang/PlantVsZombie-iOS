//
//  Torch.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-16.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "Torch.h"

@implementation Torch

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.costShine=175;
        [self setUserInteractionEnabled:YES];
        self.animationImages= [[ImageManager defaultManager]getPlantImagesByType:4];
        self.image = self.animationImages[0];
        self.lifeCount=100;
        self.tag=123;
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
