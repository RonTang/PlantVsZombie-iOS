//
//  IceShooter.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-12.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "IceShooter.h"
#import "IceBullet.h"
@implementation IceShooter

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.costShine=125;
        [self setUserInteractionEnabled:YES];
        self.animationImages= [[ImageManager defaultManager]getPlantImagesByType:2];
        self.image = self.animationImages[0];
        self.lifeCount=30;
        
    }
    return self;
}

-(void)shoot:(NSTimer*)timer{
    Bullet* bullet= [self.vc.bulletPool getBullet];
    bullet.frame=CGRectMake(self.viewLocation.x+10, self.viewLocation.y-16, 15, 15);
    bullet.lineNum=self.lineNum;
    bullet.bulletState=2;
    bullet.fireIndex=-1;
    [bullet changePicture];
    bullet.myLineZombies=self.vc.allZombies[self.lineNum];
    bullet.myLinePlants=self.vc.allPlants[self.lineNum];
    [self.vc.allBullets addObject:bullet];
    [self.vc.view addSubview:bullet];


}
-(void)dealloc{
   // NSLog(@"ice dead");
    [super dealloc];
}
@end
