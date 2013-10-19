//
//  ViewController.m
//  ImageViewLearn
//
//  Created by Ron on 13-9-2.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//
//就差个对象池
#import "ViewController.h"
#import "ZombieSimpleFactory.h"
#import "PlantSimpleFactory.h"
#import "Zombie.h"
@interface ViewController ()
@property (nonatomic,retain)ZombieSimpleFactory* zombieFactory;
@property (nonatomic,retain)PlantSimpleFactory* plantFactory;
//@property (nonatomic,retain)NSMutableArray* shooters;
@property (nonatomic,retain)NSTimer* allZombiesMoveTimer;
@property (nonatomic,retain)NSTimer* allBulletMoveTimer;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [self initUI];
    self.shineCount=100;
    self.killCount=0;
    self.failCount=0;
    self.shadeViews=[[NSMutableArray array]retain];
    NSMutableArray* line1Plants=[NSMutableArray array];
    NSMutableArray* line2Plants=[NSMutableArray array];
    NSMutableArray* line3Plants=[NSMutableArray array];
    NSMutableArray* line4Plants=[NSMutableArray array];
    NSMutableArray* line5Plants=[NSMutableArray array];
    self.allBullets=[NSMutableArray array];
    
    self.allPlants=[NSMutableArray arrayWithObjects:line1Plants,line2Plants,line3Plants,line4Plants,line5Plants, nil];
    self.playTimer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(playZombie:) userInfo:nil repeats:YES];
    self.zombieFactory=[[[ZombieSimpleFactory alloc]initWithVC:self]autorelease];
    
    self.plantFactory=[[[PlantSimpleFactory alloc]init]autorelease];
    
    self.zombiePool=[[ZombiePool alloc]initWithFactory:self.zombieFactory];
    
    self.bulletPool=[[BulletPool alloc]initWithVC:self];
    NSMutableOrderedSet* line1Zombies=[NSMutableOrderedSet orderedSet];
    NSMutableOrderedSet* line2Zombies=[NSMutableOrderedSet orderedSet];
    NSMutableOrderedSet* line3Zombies=[NSMutableOrderedSet orderedSet];
    NSMutableOrderedSet* line4Zombies=[NSMutableOrderedSet orderedSet];
    NSMutableOrderedSet* line5Zombies=[NSMutableOrderedSet orderedSet];
    self.allZombies=[NSMutableArray arrayWithObjects:line1Zombies,line2Zombies,line3Zombies,line4Zombies,line5Zombies, nil];
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    
    
    self.allBulletMoveTimer=[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveAllBullets) userInfo:nil repeats:YES];
    self.allZombiesMoveTimer=[NSTimer scheduledTimerWithTimeInterval:0.08 target:self selector:@selector(moveAllZombies) userInfo:nil repeats:YES];
    
}
-(void)moveAllZombies{
    for (NSMutableArray* zombs in self.allZombies) {
        
        for (int i=0;i<zombs.count;i++) {
            Zombie* zomb=(Zombie*)zombs[i];
            [zomb move];
            
        }
    }
    
}
-(void)moveAllBullets{
    for (int i=0;i<self.allBullets.count;i++) {
        Bullet* bullet=(Bullet*)self.allBullets[i];
        [bullet move];
        
    }
    
}
- (IBAction)planting:(UIPanGestureRecognizer *)sender {
    CGPoint p = [sender locationInView:self.view];
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:

            if([sender.view isEqual:self.shovelBK ]){
                [self createShovel];
                return;
            }
            if([self checkShadeView:sender])
                return;
            [self disableAllGestureExceptMe:sender];
            _dragPlant=[self.plantFactory createPlantWithType:sender.view.tag Frame:sender.view.frame];
            self.currentShadeView=[[ShadeView alloc]initWithFrame:sender.view.frame];
            _dragPlant.vc = self;
            //当屏幕出现新的事件时，view会被retain一次,事件消失是release
            [self.view addSubview:_dragPlant];
            break;
        case UIGestureRecognizerStateChanged:
            
            if (_dragPlant) {
                _dragPlant.center = p;
            }
            else if(_dragShovel){
                
                _dragShovel.center = p;
            }
            break;
        case UIGestureRecognizerStateEnded:
          
            if (_dragPlant) {
                for (UIView *item in self.plantBlocks) {
                    if (CGRectContainsPoint(item.frame, p)) {
                        if (item.subviews.count==0) {
                            
                            _dragPlant.lineNum=item.tag;
                            [self.allPlants[_dragPlant.lineNum] addObject:_dragPlant];
                            
                            {
                                [_dragPlant removeFromSuperview];
                                [item addSubview:_dragPlant];
                            }
                            self.currentShadeView.shadeViews=self.shadeViews;
                            [self.shadeViews addObject:self.currentShadeView];
                            
                            [self.view addSubview:self.currentShadeView];
                            
                          
                            [self beginShadeAnimation];
                           
                            
                            _dragPlant.center = CGPointMake(item.frame.size.width/2, item.frame.size.height/2);
                            [_dragPlant beginAnimation];
                            
                            
                            
                            self.shineCount-=_dragPlant.costShine;
                            self.shineLabel.text=[NSString stringWithFormat:@"%i",self.shineCount];
                        }
                        break;
                    }
                }
                
                if ([_dragPlant.superview isEqual:self.view]) {
                    
                    [_dragPlant removeFromSuperview];
                }
                
                [_dragPlant release];
                self.dragPlant = nil;
                
            }else if(_dragShovel){
                for (UIView *item in self.plantBlocks){
                    if (CGRectContainsPoint(item.frame, p)){
                        for (UIImageView* view in item.subviews) {
                            if([view isKindOfClass:[Plant class]]){
                                [(Plant*)view goToHell];
                                break;
                            }
                        }
                    }
                    
                }
                [_dragShovel removeFromSuperview];
                self.dragShovel=nil;
            }
            [self enableAllGesture];
            break;
        case UIGestureRecognizerStateCancelled:
           
            if (_dragPlant) {
                [_dragPlant removeFromSuperview];
                self.dragPlant = nil;
            }
            if(_dragShovel){
                [_dragShovel removeFromSuperview];
                self.dragShovel=nil;
            }
            [self enableAllGesture];
            break;
        default:
            break;
    }
    
    
    
}
-(void)beginShadeAnimation{
    [UIView beginAnimations:@"shade" context:nil];
    [UIView setAnimationDelegate:self.currentShadeView];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDidStopSelector:@selector(canGetPlantSeed)];
    [UIView setAnimationDuration:4];
    self.currentShadeView.frame=CGRectMake(self.currentShadeView.frame.origin.x, self.currentShadeView.frame.origin.y, self.currentShadeView.frame.size.width, 1);
    [UIView commitAnimations];
}
-(BOOL)checkShadeView:(UIGestureRecognizer*)sender{
    
    for (UIView* shadeView in self.shadeViews) {
        if(CGRectIntersectsRect(shadeView.frame, sender.view.frame)){
            
            return YES;
        }
    }
    return NO;
}
-(void)disableAllPlantSeedGesture{
    for (UIView* plantSeed in self.plantSeeds) {
        [[plantSeed.gestureRecognizers lastObject]setEnabled:NO];
    }
}

-(void)disableAllGestureExceptMe:(UIGestureRecognizer*)sender{
    for (UIView* plantSeed in self.plantSeeds) {
        if(![plantSeed isEqual:sender.view])
            [[plantSeed.gestureRecognizers lastObject]setEnabled:NO];
    }
    [self.shovelBK.gestureRecognizers.lastObject setEnabled:NO];
    
}

-(void)enableAllGesture{
    for (UIView* plantSeed in self.plantSeeds) {
        [[plantSeed.gestureRecognizers lastObject]setEnabled:YES];
    }
    [self.shovelBK.gestureRecognizers.lastObject setEnabled:YES];
    
}
-(void)playZombie:(NSTimer*)playTimer{
    
    
    Zombie* zomb= [self.zombiePool getZombie];
    
    zomb.myLinePlants=self.allPlants[zomb.lineNum];
    
    [self.allZombies[zomb.lineNum] addObject:zomb];
    
    [self.view addSubview:zomb];
    
    
    
    
}
-(void)createShovel{
    _dragShovel=[[Shovel alloc]initWithFrame:self.shovelBK.frame];
    _dragShovel.vc=self;
    [self.view addSubview:_dragShovel];
    [self disableAllPlantSeedGesture];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_allPlants release];
    [_shadeViews release];
    [_shakeTimer release];
    [_playTimer release];
    [_zombieFactory release];
    [_plantFactory release];
    [_plantBlocks release];
    [_plantSeeds release];
    [_shovelBK release];
    [_shineLabel release];
    [_allZombies release];
    [super dealloc];
}


-(void)initUI{
    
    for (int i=0; i<self.plantSeeds.count; i++) {
        
        ((UIImageView*)self.plantSeeds[i]).image =[[ImageManager defaultManager]getPlantSeedImageByIndex:i];
        
    }
}



@end
