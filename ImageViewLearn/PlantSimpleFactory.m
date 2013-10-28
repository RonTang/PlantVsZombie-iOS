//
//  PlantSimpleFactory.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-12.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "PlantSimpleFactory.h"
#import "Shooter.h"
#import "SunFlower.h"
#import "IceShooter.h"
#import "BigNut.h"
#import "Torch.h"
#import "Garlic.h"
@interface PlantSimpleFactory()

@property (nonatomic,retain)NSMutableArray* plantClasses;

@end
@implementation PlantSimpleFactory
-(id)init{
    if(self=[super init]){
        self.plantClasses=[NSMutableArray arrayWithObjects:[SunFlower class],[Shooter class],[IceShooter class],[BigNut class],[Torch class],[Garlic class], nil];
    
        
    }
    return  self;
}

-(id<Plants>)createPlantWithType:(int)type Frame:(CGRect)frame{
   
    return [[self.plantClasses[type] alloc]initWithFrame:frame];

}

-(void)dealloc{
    self.plantClasses=nil;
    [super dealloc];
}
@end
