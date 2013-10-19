//
//  Bullet.m
//  ImageViewLearn
//
//  Created by Ron on 13-9-2.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "Bullet.h"
#import "IceBullet.h"
@implementation Bullet
static UIImage* bulletImage=nil;
static UIImage* iceBulletImage=nil;
static UIImage* fireBulletImage=nil;
-(id)initWithVC:(ViewController *)vc x:(int)x y:(int)y LineNum:(unsigned int)lineNum State:(int)state{
    if(self=[super init]){
       
        self.fireIndex=-1;
        self.vc=vc;
        self.bulletState=state;
        if(bulletImage==nil){
            bulletImage=[UIImage imageNamed:@"bullet_0.png"];
            iceBulletImage=[UIImage imageNamed:@"bullet_1.png"];
            fireBulletImage=[UIImage imageNamed:@"bullet_2.png"];
        }
        self.frame=CGRectMake(x+10, y-5, 15, 15);
        self.tag=100;
        //[self changePicture];
        //[self.vc.view addSubview:self];
        //self.lineNum=lineNum;
        //self.myLineZombies=self.vc.allZombies[self.lineNum];
        //self.myLinePlants=self.vc.allPlants[self.lineNum];
        //[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(move:) userInfo:nil repeats:YES];
    }
    return self;
}
-(void)changePicture{
    switch (self.bulletState) {
        case 0: self.image =bulletImage;
            break;
        case 1: self.image =fireBulletImage;
            break;
        case 2: self.image=iceBulletImage;
            break;
            
    }

}
-(void)move{
    
    
    self.center = CGPointMake(self.center.x+1, self.center.y);
    [self hitZombie];

    if(self.center.x>480){
        //[timer invalidate];
        self.currentFireView=nil;
        [self removeFromSuperview];
        [self.vc.allBullets removeObject:self];
        [self.vc.bulletPool addBullet:self];
    }
}
-(void)changeState{
    if(self.bulletState==1)
        return;
    if(self.bulletState==0)
        self.bulletState+=1;
    else
        self.bulletState=0;
    
    
    [self changePicture];

}
static int oldCount=0;
-(void)hitZombie{
    //************//
    
    for(int i=0;i<_myLinePlants.count;i++){
        Plant* viewPlant=_myLinePlants[i];
        
            if(CGRectContainsRect(viewPlant.viewRect, self.frame)){
                if(viewPlant.tag==123){
                   
                 if(![viewPlant isEqual:self.currentFireView])
                        [self changeState];
                        
                
                 self.currentFireView=viewPlant;
                 return;
                }
                
               
            }
        
    }
   
    oldCount=_myLinePlants.count;
    for(int i=0;i<_myLineZombies.count;i++){
        Zombie* viewZom=_myLineZombies[i];
       
            if(CGRectIntersectsRect(self.frame, viewZom.frame)){
                self.currentFireView=nil;
                if(self.bulletState==0){
                    [self normalHit:viewZom];
                }else if (self.bulletState==2){
                    [self iceHit:viewZom];
                }
                else if(self.bulletState==1){
                    [self fireHit:viewZom];
                
                }
                
                if(viewZom.liftCount<=0){
                    viewZom.liftCount=99;
                    [viewZom goToHell];
                   
                }
                //[timer invalidate];
                [self removeFromSuperview];
                 // [self release];
                [self.vc.allBullets removeObject:self];
                [self.vc.bulletPool addBullet:self];
                break;
            }
            
        }
    }

-(void)normalHit:(Zombie*)zombie{
      zombie.liftCount-=1;
}
-(void)iceHit:(Zombie*)zombie{
      zombie.liftCount-=1;
      zombie.offset=2;
      zombie.slowDownCount=60;
      zombie.alpha=0.5;
}
-(void)fireHit:(Zombie*)zombie{
      zombie.liftCount-=2;

}
-(void)dealloc{
   
    [super dealloc];
}
@end
