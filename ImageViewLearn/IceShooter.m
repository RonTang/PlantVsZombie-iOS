//
//  IceShooter.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-12.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "IceShooter.h"
#import "Bullet.h"
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
    bullet.myLineTorchs=self.vc.allTorchs[self.lineNum];
    bullet.myLineZombies=self.vc.allZombies[self.lineNum];
    bullet.myLinePlants=self.vc.allPlants[self.lineNum];
    bullet.myLineBullets=self.vc.allBullets[self.lineNum];
    [self.vc.allBullets[self.lineNum] addObject:bullet];
    [self.vc.view addSubview:bullet];
   

}
-(void)dealloc{
   
    [super dealloc];
}
@end
