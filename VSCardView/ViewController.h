//
//  ViewController.h
//  VSCardView
//
//  Created by Vijay subramaniyam on 12/04/15.
//  Copyright (c) 2015 vijay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cardview.h"
@interface ViewController : UIViewController<cradViewDelegate>

- (IBAction)showCardType1:(id)sender;
- (IBAction)showCardType2:(id)sender;
- (IBAction)showCardType3:(id)sender;

@end

