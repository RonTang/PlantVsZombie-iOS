//
//  Zombie.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-12.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "Zombie.h"

@implementation Zombie

@synthesize offset=_offset;
@synthesize speed=_speed;
@synthesize vc=_vc;
@synthesize liftCount=_liftCount;
@synthesize count=_count;
@synthesize zombieImages=_zombieImages;
@synthesize deadCount=_deadCount;
//@synthesize moveTimer=_moveTimer;
@synthesize slowDownCount=_slowDownCount;
@synthesize lineNum=_lineNum;
@synthesize type=_type;
-(id)initWithZombieVC:(ViewController*)vc{
    
    if(self=[super init]){
        self.slowDownCount=-1;
        self.offset=3;
        self.vc=vc;
        self.speed=0;
        //self.lineNum=arc4random()%5;
        //self.myLinePlants=self.vc.allPlants[self.lineNum];
        //self.frame=CGRectMake(480,42+58*(self.lineNum)-26, 45, 88);
        [self.vc.allZombies[self.lineNum] addObject:self];
        [self setContentMode:UIViewContentModeScaleAspectFill];
       
        
    }
    return self;
}
-(void)goToHell{
    //NSLog(@"oh,god forgive me");
    //if(self.moveTimer)
    //[self.moveTimer invalidate];
    self.animationImages=[[ImageManager defaultManager]getZombieDeadImagesByType:0];
    self.offset=0;
    self.count=0;
  
    
    

}
//-(void)deadAnimation:(NSTimer*)timer{
//    
//    self.image=self.animationImages[self.deadCount];
//    self.deadCount+=1;
//    NSLog(@"dead Animation");
//    if(self.deadCount==self.animationImages.count){
//        [self removeFromSuperview];
//        [timer invalidate];
//        [self.vc.allZombies[self.lineNum] removeObject:self];
//        [self.vc.zombiePool addZombie:self];
//        
//        
//    }
//}
-(void)move{
    //NSLog(@"move...");
    if(self.count==self.animationImages.count){
        if(self.animationImages.count!=4)
          self.count=0;
        else{
            [self removeFromSuperview];
            [self.vc.allZombies[self.lineNum] removeObject:self];
            [self.vc.zombiePool addZombie:self];
            return;
        }
            
        
    }
    self.image=self.animationImages[self.count];
       self.count+=1;
   //------------------
    for(int i=0;i<_myLinePlants.count;i++){
        Plant* plant=_myLinePlants[i];
       
        if(CGRectContainsPoint(self.frame, plant.viewLocation)){
                plant.lifeCount-=1;
                if(plant.lifeCount==0){
                [plant goToHell];
            
                }
                return;
            
        }
    
    }
    //-------------------
    self.center = CGPointMake(self.center.x-self.offset, self.center.y);
    //-------------------
    if(self.slowDownCount>0)
        self.slowDownCount-=1;
    else if(self.slowDownCount==0){
        self.offset=3;
        self.alpha=1;
    }
    //------------------
    if(self.center.x<=-25){
    
        self.vc.failCount+=1;
        [self removeFromSuperview];
        [self.vc.allZombies[self.lineNum] removeObject:self];
        [self.vc.zombiePool addZombie:self];
        // NSLog(@"go to house...");
         return;
    }
    

    
}
-(void)dealloc{
    NSLog(@"dead Zombie");
    //[_moveTimer release];
    [super dealloc];
}

@end
