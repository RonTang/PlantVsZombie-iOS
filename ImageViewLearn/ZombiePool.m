//
//  ZombiePool.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-16.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "ZombiePool.h"
#import "ZombieSimpleFactory.h"
#import "ViewController.h"
#import "SportZombie.h"
@interface ZombiePool()
@property (nonatomic,retain)NSMutableArray* allZombies;
@property (nonatomic,assign)ZombieSimpleFactory* zombieFactory;
@end
@implementation ZombiePool
-(id)initWithFactory:(ZombieSimpleFactory *)factory{
    if(self=[super init]){
        zombieOffsetY[0]=37;
        zombieOffsetY[1]=42+58-20;
        zombieOffsetY[2]=42+58*2-20;
        zombieOffsetY[3]=42+58*3-20-15;
        zombieOffsetY[4]=42+58*4-20-15;
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
        zombie.canEatPlant=YES;
        zombie.isChange=NO;
       [self.allZombies addObject:zombie];
        
    
    }
}

-(Zombie*)getZombie{
    //NSLog(@"僵尸池中僵尸数量:%i",self.allZombies.count);
    Zombie*  zombie=[self.allZombies lastObject];
    [self.allZombies removeLastObject] ;
    return [self refreshZombie:zombie];
   
   
}
-(Zombie*)refreshZombie:(Zombie*)zombie{

    zombie.animationImages=[[ImageManager defaultManager]getZombieImagesByType:zombie.type];
    zombie.lineNum=arc4random()%5;
    zombie.frame=CGRectMake(480,zombieOffsetY[zombie.lineNum], 45, 78);
    zombie.slowDownCount=0;
    zombie.liftCount=20;
    zombie.offset=3;
    zombie.oldOffset=3;
    if ([zombie isMemberOfClass:[SportZombie class]]) {
        zombie.oldOffset=4;
        zombie.liftCount=25;
    }
    zombie.isDead=NO;
    zombie.alpha=1;
    zombie.myLinePlants=self.zombieFactory.vc.allPlants[zombie.lineNum];
    zombie.myLineZombies=self.zombieFactory.vc.allZombies[zombie.lineNum];
    return zombie;
}
-(void)addZombie:(Zombie*)zombie{
    [self.allZombies addObject:zombie];
}
@end
