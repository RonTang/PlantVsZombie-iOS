//
//  ImageManager.m
//  PlantsVsZombies
//
//  Created by Ron on 13-9-12.
//  Copyright (c) 2013年 Apple.org. All rights reserved.
//

#import "ImageManager.h"

@implementation ImageManager
static NSMutableArray* zombie0Images=nil;
static NSMutableArray* zombie1Images=nil;
static NSMutableArray* zombie2Images=nil;
static NSMutableArray* zombie3Images=nil;
static NSMutableArray* zombie0DeadImages=nil;
static UIImage* zombie0DeadImage=nil;
static ImageManager* im=nil;
static UIImage* plant0Image=nil;
static UIImage* plant1Image=nil;
static UIImage* plant2Image=nil;
static UIImage* plant3Image=nil;
static UIImage* plant4Image=nil;
static UIImage* plant5Image=nil;
static NSMutableArray* plant0Images=nil;
static NSMutableArray* plant1Images=nil;
static NSMutableArray* plant2Images=nil;
static NSMutableArray* plant3Images=nil;
static NSMutableArray* plant4Images=nil;
static NSMutableArray* plant5Images=nil;
static UIImage* zombie0Image=nil;
static UIImage* zombie1Image=nil;
static UIImage* zombie2Image=nil;
static UIImage* zombie3Image=nil;
static UIImage* plantSeedImage=nil;
static NSMutableArray* plantSeedImages=nil;
+(id)defaultManager{
    if(im==nil){
        im =[[ImageManager alloc]init];
        plantSeedImage=[[UIImage imageNamed:@"seedpackets.png"]retain];
        zombie0Image=[[UIImage imageNamed:@"zomb_0.png"]retain];
        zombie1Image=[[UIImage imageNamed:@"zomb_1.png"]retain];
        zombie2Image=[[UIImage imageNamed:@"zomb_2.png"]retain];
        zombie3Image=[[UIImage imageNamed:@"zomb_3.png"]retain];
        plant0Image=[[UIImage imageNamed:@"plant_0.png"]retain];
        plant1Image=[[UIImage imageNamed:@"plant_1.png"]retain];
        plant2Image=[[UIImage imageNamed:@"plant_2.png"]retain];
        plant3Image=[[UIImage imageNamed:@"plant_3.png"]retain];
        plant4Image=[[UIImage imageNamed:@"plant_4.png"]retain];
        plant5Image=[[UIImage imageNamed:@"plant_5.png"]retain];
        zombie0DeadImage=[[UIImage imageNamed:@"zomb_d_0.png"]retain];
        
        zombie0DeadImages=[[NSMutableArray array]retain];
        zombie0Images=[[NSMutableArray array]retain];
        zombie1Images=[[NSMutableArray array]retain];
        zombie2Images=[[NSMutableArray array]retain];
        zombie3Images=[[NSMutableArray array]retain];
        plant0Images=[[NSMutableArray array]retain];
        plant1Images=[[NSMutableArray array]retain];
        plant2Images=[[NSMutableArray array]retain];
        plant3Images=[[NSMutableArray array]retain];
        plant4Images=[[NSMutableArray array]retain];
        plant5Images=[[NSMutableArray array]retain];
        plantSeedImages=[[NSMutableArray array]retain];
        for(int i=0;i<4;i++){
          [im initZombieImagesByImage:[im getZombieImageByType:i] Type:i];
         
                   }
        for(int i=0;i<6;i++){
         [im initPlantImagesByImage:[im getPlantImageByType:i] Type:i];
        }
        
        [im initZombieDeadImagesByImage:[im getZombieDeadImageByType:0] Type:0];
       
        [im initPlantSeedImagesByImage:plantSeedImage];

    
    }
    return im;
}
-(void)initZombieImagesByImage:(UIImage*)zombieImage Type:(int)type{
    for(int i=0;i<8;i++){
        CGImageRef subImage = CGImageCreateWithImageInRect(zombieImage.CGImage, CGRectMake(i*zombieImage.size.width/8, 0, zombieImage.size.width/8, zombieImage.size.height));
        switch (type) {
            case 0:[zombie0Images addObject:[UIImage imageWithCGImage:subImage]];break;
            case 1:[zombie1Images addObject:[UIImage imageWithCGImage:subImage]];break;
            case 2:[zombie2Images addObject:[UIImage imageWithCGImage:subImage]];break;
            case 3:[zombie3Images addObject:[UIImage imageWithCGImage:subImage]];break;
        }
        
        //回收cgimage内存
        CGImageRelease(subImage);
    }
    
}
-(void)initZombieDeadImagesByImage:(UIImage*)zombieImage Type:(int)type{
    for(int i=0;i<4;i++){
        CGImageRef subImage = CGImageCreateWithImageInRect(zombieImage.CGImage, CGRectMake(i*zombieImage.size.width/4, 0, zombieImage.size.width/4, zombieImage.size.height));
        switch (type) {
            case 0:[zombie0DeadImages addObject:[UIImage imageWithCGImage:subImage]];break;
            case 1:break;
            case 2:break;
            case 3:break;
        }
        
        //回收cgimage内存
        CGImageRelease(subImage);
    }
    
}
-(void)initPlantImagesByImage:(UIImage*)plantImage Type:(int)type{
    for(int i=0;i<8;i++){
        CGImageRef subImage = CGImageCreateWithImageInRect(plantImage.CGImage, CGRectMake(i*plantImage.size.width/8, 0, plantImage.size.width/8, plantImage.size.height));
        switch (type) {
            case 0:[plant0Images addObject:[UIImage imageWithCGImage:subImage]];break;
            case 1:[plant1Images addObject:[UIImage imageWithCGImage:subImage]];break;
            case 2:[plant2Images addObject:[UIImage imageWithCGImage:subImage]];break;
            case 3:[plant3Images addObject:[UIImage imageWithCGImage:subImage]];break;
            case 4:[plant4Images addObject:[UIImage imageWithCGImage:subImage]];break;
            case 5:[plant5Images addObject:[UIImage imageWithCGImage:subImage]];break;
        }
        
        //回收cgimage内存
        CGImageRelease(subImage);
    }
    
    
}
-(void)initPlantSeedImagesByImage:(UIImage*)plantSeedImage{
    for(int i=0;i<6;i++){
        int index = 0;
        switch (i) {
            case 0:
                index = 0;
                break;
            case 1:
                index = 2;
                break;
            case 2:
                index = 3;
                break;
            case 3:
                index = 5;
                break;
            case 4:
                index=10;
                break;
            case 5:
                index=9;
                break;
        }
        CGImageRef subImage = CGImageCreateWithImageInRect(plantSeedImage.CGImage, CGRectMake(index*plantSeedImage.size.width/18, 0, plantSeedImage.size.width/18, plantSeedImage.size.height));
             [plantSeedImages addObject:[UIImage imageWithCGImage:subImage]];
        //回收cgimage内存
        CGImageRelease(subImage);
    }
    
}
-(UIImage*)getZombieImageByType:(int)type{
    switch (type) {
        case 0:
            return zombie0Image;
        case 1:
            return zombie1Image;
        case 2:
            return zombie2Image;
        case 3:
            return zombie3Image;
    }
    return nil;
    
}
-(UIImage*)getZombieDeadImageByType:(int)type{
    switch (type) {
        case 0:
            return zombie0DeadImage;
        case 1:
            return zombie0DeadImage;
        case 2:
            return zombie0DeadImage;
        case 3:
            return zombie0DeadImage;
    }
    return nil;

}
-(UIImage*)getPlantImageByType:(int)type{
    switch (type) {
        case 0:
            return plant0Image;
        case 1:
            return plant1Image;
        case 2:
            return plant2Image;
        case 3:
            return plant3Image;
        case 4:
            return plant4Image;
        case 5:
            return plant5Image;
    }
    return nil;
    
}
-(NSMutableArray*)getZombieImagesByType:(int)type{
    
    switch (type) {
        case 0:return zombie0Images;
        case 1:return zombie1Images;
        case 2:return zombie2Images;
        case 3:return zombie3Images;
    }
    return nil;
}
-(NSMutableArray*)getZombieDeadImagesByType:(int)type{

    switch (type) {
        case 0:return zombie0DeadImages;
        case 1:return nil;
        case 2:return nil;
        case 3:return nil;
    }
    return nil;
}
-(NSMutableArray*)getPlantImagesByType:(int)type{
    
    switch (type) {
        case 0:return plant0Images;
        case 1:return plant1Images;
        case 2:return plant2Images;
        case 3:return plant3Images;
        case 4:return plant4Images;
        case 5:return plant5Images;
    }
    return nil;
}
-(NSMutableArray*)getPlantSeedImages{
   
    return plantSeedImages;
}
-(UIImage*)getPlantSeedImageByIndex:(int)index{

    return plantSeedImages[index];
}


@end
