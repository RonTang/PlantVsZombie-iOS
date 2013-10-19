//
//  RoadBlockZombie.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-3.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "RoadBlockZombie.h"
#import "ViewController.h"
@implementation RoadBlockZombie


-(id)initWithZombieVC:(ViewController*)vc{
    
    if(self=[super initWithZombieVC:vc]){
        self.liftCount=10;
        self.zombieImages= [[ImageManager defaultManager]getZombieImagesByType:1];
        self.image = self.zombieImages[0];
        
        
    }
    return self;
}


@end
