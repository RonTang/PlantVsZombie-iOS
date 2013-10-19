//
//  Shovel.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-13.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "Shovel.h"
#import "ViewController.h"
@implementation Shovel
static UIImage* shovelImage=nil;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if(shovelImage==nil)
        shovelImage=[[UIImage imageNamed:@"shovel.png"]retain];
        self.image=shovelImage;
        [self setUserInteractionEnabled:YES];
    }
    return self;
}



@end
