//
//  Bullet.h
//  ImageViewLearn
//
//  Created by Ron on 13-9-2.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "Zombie.h"
@interface Bullet : UIImageView
@property (nonatomic,assign)int fireIndex;
@property (nonatomic,assign)int bulletState;
@property (nonatomic,assign)ViewController* vc;
@property (nonatomic,assign)unsigned int lineNum;
@property (nonatomic,assign)NSMutableOrderedSet* myLineBullets;
@property (nonatomic,assign)NSMutableOrderedSet* myLineZombies;
@property (nonatomic,assign)NSMutableOrderedSet* myLinePlants;
@property (nonatomic,assign)NSMutableArray* myLineTorchs;
@property (nonatomic,assign)UIView* currentFireView;
-(id)initWithVC:(ViewController*)vc x:(int)x y:(int)y LineNum:(unsigned int)lineNum State:(int)state;
-(void)move;
-(BOOL)hitAllZombie;
-(BOOL)hitHeadZombie;
-(void)changePicture;
@end
