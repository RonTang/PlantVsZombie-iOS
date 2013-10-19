//
//  ZombieFactory.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-3.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "ZombieSimpleFactory.h"

#import "NormalZombie.h"
#import "DrumZombie.h"
#import "RoadBlockZombie.h"
#import "SportZombie.h"
@interface ZombieSimpleFactory()

@property (nonatomic,retain)NSMutableArray* zombieClasses;
@end

@implementation ZombieSimpleFactory

-(id)initWithVC:(ViewController *)vc{
    if(self=[super init]){
        self.zombieClasses=[[[NSMutableArray alloc]initWithObjects:[NormalZombie class],[DrumZombie class],[RoadBlockZombie class],[SportZombie class], nil]autorelease];
        
     _vc=vc;
    }
    return self;
}
-(id<Zombies>)createZombieWithType:(int)type{
   
    return [[self.zombieClasses[type] alloc]initWithZombieVC:_vc];

}
-(void)dealloc{
    self.zombieClasses=nil;
    [super dealloc];

}
@end
