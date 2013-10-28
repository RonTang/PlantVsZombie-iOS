//
//  Zombie.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-12.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "Zombie.h"
#import "ZombiePool.h"
@implementation Zombie

@synthesize offset=_offset;
@synthesize speed=_speed;
@synthesize vc=_vc;
@synthesize liftCount=_liftCount;
@synthesize count=_count;
@synthesize zombieImages=_zombieImages;
@synthesize deadCount=_deadCount;
@synthesize slowDownCount=_slowDownCount;
@synthesize lineNum=_lineNum;
@synthesize type=_type;
-(id)initWithZombieVC:(ViewController*)vc{
    
    if(self=[super init]){
        self.slowDownCount=-1;
        self.vc=vc;
        [self setContentMode:UIViewContentModeScaleAspectFill];
       
        
    }
    return self;
}
-(void)goToHell{
    //NSLog(@"oh,god forgive me");
   
    self.animationImages=[[ImageManager defaultManager]getZombieDeadImagesByType:0];
    self.count=0;
   
    
    

}

-(void)move{
    
    [self showAnimation];
    [self moveState];
    if(!self.isDead&&self.canEatPlant){
    for(int i=0;i<_myLinePlants.count;i++){
        Plant* plant=_myLinePlants[i];
        if(CGRectContainsPoint(self.frame, plant.viewLocation)){
            
            plant.lifeCount-=1;
            if(plant.tag==321){
                [self changeLine];
                
            }
            if(plant.lifeCount==0){
                
                [plant goToHell];
                
            }
            return;
            
        }
        
    }
    
    self.center = CGPointMake(self.center.x-self.offset, self.center.y);
   
    [self moveToHome];
    
    }

    
}
-(void)changeLine{
    self.isChange=YES;
    self.canEatPlant=NO;
    if(self.lineNum==0){
        [self toDownLine];
    }else if(self.lineNum==4){
        [self toUpLine];
        
    }
    else{
        
        if(arc4random()%2==0){
            [self toUpLine];
            
        }else{
            [self toDownLine];
        }
    }
    
    
}
-(void)toUpLine{
   
   
    
    [UIView beginAnimations:@"upLine" context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationBeginsFromCurrentState:NO];
    [UIView setAnimationDuration:0.8];
    self.center=CGPointMake(self.center.x, zombieOffsetY[self.lineNum-1]+39);
    //动画开始之前,坐标转换转换完成。
    [UIView commitAnimations];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //无论sleep多长时间打不到就无法改变isdead状态
        [NSThread sleepForTimeInterval:0.4];
       
        //In this time this zombie can relive?
        dispatch_sync(dispatch_get_main_queue(), ^{
            [UIView beginAnimations:@"finish_up_line" context:nil];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDidStopSelector:@selector(finishChangeLine)];
            [UIView setAnimationBeginsFromCurrentState:YES];
            [UIView setAnimationDuration:0.4];
            self.center=CGPointMake(self.center.x, zombieOffsetY[self.lineNum-1]+39);
            [UIView commitAnimations];
            if(!self.isDead){
            [self.vc.allZombies[self.lineNum] removeObject:self];
            self.lineNum-=1;
            self.myLinePlants=self.vc.allPlants[self.lineNum];
            [self.vc.allZombies[self.lineNum] addObject:self];
            [self.vc.allZombies[self.lineNum] sortUsingComparator:^NSComparisonResult(Zombie* zombie1, Zombie* zombie2) {
                return zombie1.center.x>zombie2.center.x;
                
            }];
            }
            
        });
     
    });
    
}

-(void)toDownLine{
    
    [UIView beginAnimations:@"downLine" context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationBeginsFromCurrentState:NO];
    [UIView setAnimationDuration:0.8];
    self.center=CGPointMake(self.center.x, zombieOffsetY[self.lineNum+1]+39);
    [UIView commitAnimations];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:0.4];
    dispatch_sync(dispatch_get_main_queue(), ^{
        
        [UIView beginAnimations:@"finish_down_Line" context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:0.4];
        [UIView setAnimationDidStopSelector:@selector(finishChangeLine)];
        self.center=CGPointMake(self.center.x, zombieOffsetY[self.lineNum+1]+39);
        [UIView commitAnimations];
        if(!self.isDead){
       
        [self.vc.allZombies[self.lineNum] removeObject:self];
        self.lineNum+=1;
        self.myLinePlants=self.vc.allPlants[self.lineNum];
        [self.vc.allZombies[self.lineNum] addObject:self];
        }
     
       });
    
        
        
    });

    
   

}

-(void)finishChangeLine{
   
    self.isChange=NO;
    self.canEatPlant=YES;
}
-(void)showAnimation{
    if(self.count==self.animationImages.count){
        self.count=0;
        if(self.isDead){
            [self removeFromSuperview];
            [self.vc.allZombies[self.lineNum] removeObject:self];
            [self.vc.zombiePool addZombie:self];
            return;
            
        }
    }
    self.image=self.animationImages[self.count];
    self.count+=1;
        
}

-(void)moveState{
    if(self.slowDownCount>0)
        self.slowDownCount-=1;
    else if(self.slowDownCount==0){
        self.offset=self.oldOffset;
        self.alpha=1;
        self.slowDownCount=-1;
    }

}
-(void)moveToHome{
    if(self.center.x<=-5){
        
        self.vc.failCount+=1;
        [self removeFromSuperview];
        [self.vc.allZombies[self.lineNum] removeObject:self];
        [self.vc.zombiePool addZombie:self];
       
        
    }

}
-(void)dealloc{
    NSLog(@"dead Zombie");
    [super dealloc];
}

@end
