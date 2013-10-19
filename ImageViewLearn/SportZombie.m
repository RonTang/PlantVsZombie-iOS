//
//  SportZombie.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-3.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "SportZombie.h"

@implementation SportZombie


-(id)initWithZombieVC:(ViewController*)vc{
    
    if(self=[super initWithZombieVC:vc]){
       
        self.speed=1;
        self.liftCount=3;
        self.zombieImages= [[ImageManager defaultManager]getZombieImagesByType:3];
        self.image = self.zombieImages[0];
        
        
    }
    return self;
}


@end
