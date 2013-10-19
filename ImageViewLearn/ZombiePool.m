//
//  ZombiePool.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-16.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "ZombiePool.h"
#import "ZombieSimpleFactory.h"
@interface ZombiePool()
@property (nonatomic,retain)NSMutableArray* allZombies;
@property (nonatomic,assign)ZombieSimpleFactory* zombieFactory;
@end
@implementation ZombiePool
-(id)initWithFactory:(ZombieSimpleFactory *)factory{
    if(self=[super init]){
        self.zombieFactory=factory;
        self.allZombies=[NSMutableArray array];
        [self createAllZombies];
        
    }
    return self;
}
-(void)createAllZombies{

    for(int i=0;i<250;i++){
        int type=arc4random()%4;
        Zombie* zombie=[self.zombieFactory createZombieWithType:type];
        zombie.type=type;
       [self.allZombies addObject:zombie];
        
    //最后一个创建的僵尸有问题
    }
}

-(Zombie*)getZombie{
    Zombie* zombie=[self.allZombies lastObject];
    [self.allZombies removeLastObject] ;
    zombie.animationImages=[[ImageManager defaultManager]getZombieImagesByType:zombie.type];
    zombie.count=0;
    zombie.lineNum=arc4random()%5;
    zombie.frame=CGRectMake(480,42+58*(zombie.lineNum), 45, 78);
    if (zombie.lineNum==0) {
        zombie.center=CGPointMake(480, zombie.center.y-5);
    }
    if(zombie.lineNum!=0){
    
        zombie.center=CGPointMake(480, zombie.center.y-20);
    }
    if(zombie.lineNum==3||zombie.lineNum==4){
        zombie.center=CGPointMake(480, zombie.center.y-15);

    
    }
    zombie.slowDownCount=0;
    zombie.liftCount=2;
    zombie.offset=3;
    zombie.alpha=1;
    
    return  zombie;
}

-(void)addZombie:(Zombie*)zombie{
    [self.allZombies addObject:zombie];
}
@end
