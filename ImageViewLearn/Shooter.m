//
//  Shooter.m
//  ImageViewLearn
//
//  Created by Ron on 13-9-2.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "Shooter.h"
#import "Bullet.h"

@implementation Shooter

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.costShine=100;
        [self setUserInteractionEnabled:YES];
        self.animationImages= [[ImageManager defaultManager]getPlantImagesByType:1];
        self.image = self.animationImages[0];
        self.lifeCount=30;
    }
    return self;
}

-(void)shoot:(NSTimer*)timer{
   
    [self makeBullet];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:0.2];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self makeBullet];
       });
    });
   
}
-(void)makeBullet{
    Bullet* bullet= [self.vc.bulletPool getBullet];
    bullet.frame=CGRectMake(self.viewLocation.x+10, self.viewLocation.y-16, 15, 15);
    bullet.lineNum=self.lineNum;
    bullet.bulletState=0;
    bullet.fireIndex=-1;
    [bullet changePicture];
    bullet.myLineZombies=self.vc.allZombies[self.lineNum];
    bullet.myLinePlants=self.vc.allPlants[self.lineNum];
    [self.vc.allBullets addObject:bullet];
    [self.vc.view addSubview:bullet];

}
@end
