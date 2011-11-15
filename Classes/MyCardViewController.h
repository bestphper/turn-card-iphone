//
//  MyCardViewController.h
//  MyCard
//
//  Created by yang on 11-11-9.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"

@interface MyCardViewController : UIViewController {
    // current 1 and current 2 Card
    Card *cur1;
    Card *cur2;
    
    NSMutableArray *cardArray;
}

@property (nonatomic,retain) Card *cur1;
@property (nonatomic,retain) Card *cur2;
@property (nonatomic,retain)NSMutableArray *cardArray;

-(void)turnOverCard:(id)sender;
-(void)turnOverCardTimer:(NSTimer *)timer;

-(void)changeCardEvent:(NSString *)type;//停掉或者开启所有卡片的响应事件

@end

