//
//  Zombie.m
//  ImageViewLearn
//
//  Created by Ron on 13-9-2.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "NormalZombie.h"

@implementation NormalZombie



-(id)initWithZombieVC:(ViewController*)vc{
   
    if(self=[super initWithZombieVC:vc]){
       
        self.liftCount=5;
        self.zombieImages= [[ImageManager defaultManager]getZombieImagesByType:0];
        self.image = self.zombieImages[0];
        
        
    }
    return self;
}


@end
