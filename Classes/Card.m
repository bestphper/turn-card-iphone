//
//  Card.m
//  MyCard
//
//  Created by rzd rzd on 11-11-9.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize imgBack,imgFront,isFront;


-(void)animationFinished: (id) sender{
    NSLog(@"animation finished");
}


-(void)turnBack{
        
    CGContextRef context = UIGraphicsGetCurrentContext();
	[UIView beginAnimations:nil context:context];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:CARD_TURN_SPEED];
    
	NSInteger img1 = [[self subviews] indexOfObject:imgBack];
	NSInteger img2 = [[self subviews] indexOfObject:imgFront];
    
	// Choose left or right flip
	[UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft forView:self cache:YES];
    
    //正面朝上则更新isfront状态
    if(img2 > img1)
        isFront = YES;
    else
        isFront = NO;
    
    isFront?NSLog(@"正面"):NSLog(@"反面");
    
    [self exchangeSubviewAtIndex:img1 withSubviewAtIndex:img2];
    
	[UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationFinished:)];
    
	[UIView commitAnimations];
}


/**
 *卡片构造函数
 **/
-(id)initWithFrame:(CGRect)frame{

    self = [ super initWithFrame: frame ]; 
    
    self.isFront = false;//反面朝上
    self.imgBack = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    self.imgFront = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2.jpg"]];
    
    [self.imgBack setFrame:CGRectMake(0.0, 0.0, 100.0, 100.0)];
    [self.imgFront setFrame:CGRectMake(0.0, 0.0, 100.0, 100.0)];
    
	self.contentMode = UIViewContentModeScaleAspectFit;
	[self setBackgroundColor:[UIColor redColor]];
    
    [self addSubview:self.imgBack];
    [self addSubview:self.imgFront];
    
    
    return self;
}




-(void)dealloc{
    [self.imgBack release];
    [self.imgFront release];
    
    [super dealloc];
}

@end
