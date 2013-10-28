//
//  Garlic.m
//  PlantsVsZombies
//
//  Created by Ron on 13-10-26.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "Garlic.h"

@implementation Garlic

- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.costShine=0;
        [self setUserInteractionEnabled:YES];
        self.animationImages= [[ImageManager defaultManager]getPlantImagesByType:5];
        self.image = self.animationImages[0];
        self.lifeCount=30;
        self.tag=321;
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
