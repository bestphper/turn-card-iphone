//
//  Card.h
//  MyCard
//
//  Created by rzd rzd on 11-11-9.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIControl.h>

#define CARD_TURN_SPEED .4

@interface Card :UIControl{
    UIImageView *imgBack;
	UIImageView *imgFront;
    BOOL isFront;
}

@property(nonatomic,retain) UIImageView *imgBack;
@property(nonatomic,retain) UIImageView *imgFront;
@property(nonatomic)BOOL isFront;

//初始化函数
-(void)animationFinished: (id) sender;
-(void) turnBack;//翻转回去
    
@end
