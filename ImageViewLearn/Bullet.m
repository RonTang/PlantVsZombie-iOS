//
//  Bullet.m
//  ImageViewLearn
//
//  Created by Ron on 13-9-2.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "Bullet.h"

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
    if([self moveToZombieHome])
        return;
    [self fireMe];
   
}
-(BOOL)moveToZombieHome{
    if(self.center.x>480){
        self.currentFireView=nil;
        [self removeFromSuperview];
        [self.vc.allBullets[self.lineNum] removeObject:self];
        [self.vc.bulletPool addBullet:self];
        return YES;
        
    }
    return NO;
}
-(void)fireMe{

    for(int i=0;i<_myLineTorchs.count;i++){
        Plant* viewPlant=_myLineTorchs[i];
        if(CGRectContainsRect(viewPlant.viewRect, self.frame)){
            
            if(![viewPlant isEqual:self.currentFireView])
                [self changeState];
            self.currentFireView=viewPlant;
            break;
            
        }
        
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


-(BOOL)hitAllZombie{

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
            
            if(viewZom.liftCount<=0&&!viewZom.isDead){
                viewZom.isDead=YES;
                [viewZom goToHell];
                
            }
            [self removeFromSuperview];
            [self.vc.allBullets[self.lineNum] removeObject:self];
            [self.vc.bulletPool addBullet:self];
            return YES;
        }
        
    }
    return NO;
}
-(BOOL)hitHeadZombie{
    if (self.myLineZombies.count>0) {
        Zombie* viewZom=_myLineZombies[0];
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
            
            if(viewZom.liftCount<=0&&!viewZom.isDead){
                viewZom.isDead=YES;
                [viewZom goToHell];
                
            }
            [self removeFromSuperview];
            [self.vc.allBullets[self.lineNum] removeObject:self];
            [self.vc.bulletPool addBullet:self];
            return YES;
        }
    }
   
    return NO;

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
