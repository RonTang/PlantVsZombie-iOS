//
//  ViewController.h
//  ImageViewLearn
//
//  Created by Ron on 13-9-2.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BulletPool.h"
#import "ZombiePool.h"
#import "Plant.h"
#import "Shovel.h"
#import "ShadeView.h"
#import "Shooter.h"
@interface ViewController : UIViewController
@property (nonatomic,assign)ShadeView* currentShadeView;
@property (nonatomic,assign)NSMutableArray* shadeViews;
@property (nonatomic,assign)unsigned int shineCount;
@property (nonatomic,assign)unsigned int failCount;
@property (nonatomic,assign)Plant * dragPlant;
@property (retain, nonatomic) IBOutlet UILabel *shineLabel;
@property (nonatomic,retain)Shovel* dragShovel;
@property (nonatomic,assign)unsigned int killCount;
@property (retain, nonatomic) IBOutlet UIImageView *shovelBK;
@property (nonatomic,retain)NSTimer* playTimer;
@property (nonatomic,retain)NSTimer* shakeTimer;
@property (nonatomic,retain)NSTimer* shootTimer;
@property (retain, nonatomic) IBOutletCollection(UIView) NSArray *plantBlocks;
@property (retain, nonatomic) IBOutletCollection(UIImageView) NSArray *plantSeeds;
@property (retain,nonatomic)BulletPool* bulletPool;
@property (retain,nonatomic)ZombiePool* zombiePool;
@property (retain,nonatomic)NSMutableArray* allTorchs;
@property (retain,nonatomic)NSMutableArray* allZombies;
@property (retain,nonatomic)NSMutableArray* allPlants;
@property (retain,nonatomic)NSMutableArray* allBullets;
- (IBAction)planting:(UIPanGestureRecognizer *)sender;
@end
