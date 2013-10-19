//
//  BulletPool.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-18.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "BulletPool.h"
#import "Bullet.h"
@implementation BulletPool
-(id)initWithVC:(ViewController *)vc{
    
    if(self=[super init]){
        self.vc=vc;
        self.allBullets=[NSMutableArray array];
        [self createAllBullet];
    
    }
    return  self;
}
-(void)createAllBullet{
    for(int i=0;i<200;i++){
        [self.allBullets addObject:[[Bullet alloc]initWithVC:self.vc x:0 y:0 LineNum:0 State:0]];
        
    }

}
-(void)addBullet:(Bullet*)bullet{
    [self.allBullets addObject:bullet];

}
-(Bullet*)getBullet{
    Bullet* bullet= [self.allBullets lastObject];
    [self.allBullets removeLastObject];
    return bullet;
}
@end
