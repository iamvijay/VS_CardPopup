//
//  Cardview.h
//  VSCardView
//
//  Created by Vijay subramaniyam on 12/04/15.
//  Copyright (c) 2015 vijay. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol cradViewDelegate <NSObject>

-(void)cradViewButtonAction;

@end

@interface Cardview : UIView

@property (nonatomic, weak) id<cradViewDelegate> delegate;

-(void)showPopupImage:(UIImage*)titleImage title:(NSString*)TitleText
                                           Content:(NSString*)DetailText
                                           ButtonDesc:(NSString*)ButtonName
                                           type:(int)CardType;

-(void)mediumSizeCard;

-(void)longSizeCard;

-(void)shortSizeCard;


@end
