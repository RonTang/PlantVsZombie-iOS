//
//  Torch.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-16.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "Torch.h"
#import "ViewController.h"
@implementation Torch

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.costShine=175;
        [self setUserInteractionEnabled:YES];
        self.animationImages= [[ImageManager defaultManager]getPlantImagesByType:4];
        self.image = self.animationImages[0];
        self.lifeCount=200;
    }
    return self;
}

-(void)goToHell{
    [super goToHell];
    [self.vc.allTorchs[self.lineNum] removeObject:self];
}

@end
