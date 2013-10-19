//
//  IceBullet.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-13.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "IceBullet.h"

@implementation IceBullet
static UIImage* iceBulletImage=nil;
-(id)initWithVC:(ViewController *)vc x:(int)x y:(int)y LineNum:(unsigned int)lineNum{
    if(self=[super init]){
        self.vc=vc;
        if(iceBulletImage==nil){
            iceBulletImage=[UIImage imageNamed:@"bullet_1.png"];
        }
        self.frame=CGRectMake(x+10, y-5, 15, 15);
        self.tag=100;
        self.image =iceBulletImage;
        self.lineNum=lineNum;
        self.myLineZombies=self.vc.allZombies[self.lineNum];
        [self.vc.view addSubview:self];
        [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(move:) userInfo:nil repeats:YES];
    }
    return self;
}



    
    



@end
