//
//  MyCardViewController.m
//  MyCard
//
//  Created by yang on 11-11-9.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyCardViewController.h"

@implementation MyCardViewController

@synthesize cur1,cur2,cardArray;



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    self.cur1 = nil;
    self.cur2 = nil;
    
    self.cardArray = [[NSMutableArray alloc] init ];
   
    Card *card1 = [[Card alloc] initWithFrame:CGRectMake(30.0, 30.0, 100, 100)];
    [card1 addTarget:self action:@selector(turnOverCard:) forControlEvents:UIControlEventTouchUpInside ];
    [self.view addSubview:card1];
    [self.cardArray addObject:card1];
    [card1 release];
    
    Card *card2 = [[Card alloc] initWithFrame:CGRectMake(180.0, 30.0, 100, 100)];
    [card2 addTarget:self action:@selector(turnOverCard:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:card2];
    [self.cardArray addObject:card2];
    [card2 release];
    
    Card *card3 = [[Card alloc] initWithFrame:CGRectMake(30.0, 180.0, 100, 100)];
    [card3 addTarget:self action:@selector(turnOverCard:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:card3];
    [self.cardArray addObject:card3];
    [card3 release];
    
    Card *card4 = [[Card alloc] initWithFrame:CGRectMake(180.0, 180.0, 100, 100)];
    [card4 addTarget:self action:@selector(turnOverCard:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:card4];
    [self.cardArray addObject:card4];
    [card4 release];
    
    [super viewDidLoad];
}

-(void)turnOverCard:(id)sender{
    
    if(nil == self.cur1){
        self.cur1 = sender;
        [self.cur1 turnBack];
        //NSLog(@"self.cur1==nil");
    }else if(self.cur1 == sender){//点击的同一个卡片，则不响应
       //NSLog(@"self.cur1==sender");
        
    }else{
        self.cur2 = sender;
        //TO-DO 判断是否相同的牌，如果相同则不翻转，否则翻转回去
        [self.cur2 turnBack];
        [NSTimer scheduledTimerWithTimeInterval:.85 target:self selector:@selector(turnOverCardTimer:) userInfo:nil repeats:NO];
        //NSLog(@"else");
        [self changeCardEvent:@"turnoff"];
    }
    
}

/**
 * 再翻牌期间，禁止响应事件，回调函数，提供Card类回调
 **/
-(void)changeCardEvent:(NSString *)type{
    
    if( [type isEqualToString:@"turnon"]){
        for (Card *tmp in self.cardArray) {
            [tmp addTarget:self action:@selector(turnOverCard:) forControlEvents:UIControlEventTouchUpInside];
        }
    }else if( [type isEqualToString:@"turnoff"] ) {
        for (Card *tmp in self.cardArray) {
            [tmp removeTarget:self action:@selector(turnOverCard:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

-(void)turnOverCardTimer:(NSTimer *)timer{
    
    [self.cur1 turnBack];
    [self.cur2 turnBack];
    self.cur1 = nil;
    self.cur2 = nil;
    
    [self changeCardEvent:@"turnon"];
    [timer invalidate];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    self.cur1 = nil;
    self.cur2 = nil;
}


- (void)dealloc {
    //[self.cur1 release];
    [super dealloc];
}

@end
