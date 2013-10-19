//
//  DrumZombie.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-3.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "DrumZombie.h"

@implementation DrumZombie


-(id)initWithZombieVC:(ViewController*)vc{
    
    if(self=[super initWithZombieVC:vc]){
      
       
        self.liftCount=15;
        self.zombieImages= [[ImageManager defaultManager]getZombieImagesByType:2];
        self.image = self.zombieImages[0];
        
        
    }
    return self;
}


@end
