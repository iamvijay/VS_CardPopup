//
//  ViewController.m
//  VSCardView
//
//  Created by Vijay subramaniyam on 12/04/15.
//  Copyright (c) 2015 vijay. All rights reserved.
//

#import "ViewController.h"
#import "Cardview.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface ViewController ()
@property(nonatomic,retain)Cardview *card;

@end

@implementation ViewController
@synthesize card;
- (void)viewDidLoad {
    [super viewDidLoad];

    card = [[Cardview alloc]init];
    card.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    card.delegate = self;
}


-(void)cradViewButtonAction
{
    NSLog(@"Do your logic Here");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showCardType1:(id)sender {
    
    NSString *body = @"The service, Google's fourth foray into social networking, experienced strong growth in its initial years, although usage statistics have varied, depending on how the service is defined.";
    
    [card showPopupImage:[UIImage imageNamed:@"googleplus.png"] title:@"Google" Content:body ButtonDesc:@"Go to Next!" type:0];
    [self.view addSubview:card];
}

- (IBAction)showCardType2:(id)sender {
    
     NSString *body = @"Twitter helps you create and share ideas and information instantly, without barriers.Twitter is the best way to connect with people, express yourself and discover what's happening.";
    
    [card showPopupImage:[UIImage imageNamed:@"twitter.jpg"] title:@"" Content:body ButtonDesc:@"Go!" type:1];
    [self.view addSubview:card];

    
}

- (IBAction)showCardType3:(id)sender {
    
     NSString *body = @"Instagram is not connected to the app so check properly before connecting it.";
    
    [card showPopupImage:[UIImage imageNamed:@"Instagram.png"] title:@"" Content:body ButtonDesc:@"Dismiss" type:2];
    [self.view addSubview:card];
}
@end
