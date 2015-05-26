/*
 The MIT License (MIT)
 
 Copyright (c) 2015 Vijay Subramaniyam
 
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

#import "Cardview.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define baseColor UIColorFromRGB(0xf79421)

//ANIMATION MACROS

const CGFloat kDefaultAnimateDuration = 0.95f;
const CGFloat kDefaultAnimateDelay = 0.2f;
const CGFloat kDefaultSpringDamping = 0.65f;
const CGFloat kDefaultSpringVelocity = 0.12f;

const CGFloat kSendBackViewAnimateDuration = 0.5f;
const CGFloat kSendBackViewAnimateDelay = 0.15f;
const CGFloat kSendBackViewSpringDamping = 0.48f;

const CGFloat kDefaultInitialSubViewXaxis = 22.0f;
const CGFloat kDefaultInitialSubViewYaxis = -500.0f;



//CARD 1 VALUES

const CGFloat kDefaultInitialCard1Width = 278.0f;
const CGFloat kDefaultInitialCard1Height = 320.0f;


const NSInteger kDefaultRecongnizerValue = 310;



 NSString *kDefaultFont =@"HelveticaNeue-Light";




@interface Cardview ()

@property(strong,nonatomic) UIView *subview,*cardView;
@property(strong,nonatomic) UILabel *title,*contentLabel;
@property(strong,nonatomic) UIButton *actionButton;
@property(strong,nonatomic) UIImageView *cardImage;



@end


@implementation Cardview
@synthesize delegate,subview,cardView,title,contentLabel,actionButton,cardImage;

-(void)showPopupImage:(UIImage*)titleImage title:(NSString*)TitleText Content:(NSString*)DetailText ButtonDesc:(NSString*)ButtonName type:(int)CardType
{
    cardView = [[UIView alloc]init];
    cardView.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.7f];
    cardView.userInteractionEnabled = YES;
    cardView .frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);

    
    subview = [[UIView alloc]init];
    subview.layer.cornerRadius = 2.0f;
    subview.layer.masksToBounds = YES;
    subview.userInteractionEnabled = YES;
    subview.backgroundColor = [UIColor whiteColor];
    
    cardImage = [[UIImageView alloc]init];
    [cardImage setImage:titleImage];
    
    UIPanGestureRecognizer *moveView = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    [subview addGestureRecognizer:moveView];
    
    title = [[UILabel alloc]init];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = TitleText;
    title.font = [UIFont fontWithName:kDefaultFont size:22.0f];
    title.textColor = [UIColor darkGrayColor];
    
    contentLabel = [[UILabel alloc]init];
    contentLabel.frame = CGRectMake(0, 0, 200, 40);
    contentLabel.text = DetailText;
    contentLabel.font = [UIFont fontWithName:kDefaultFont size:16.0f];
    contentLabel.textColor = [UIColor darkGrayColor];
    contentLabel.textAlignment = NSTextAlignmentCenter;
    [contentLabel setNumberOfLines:0];
    [contentLabel sizeToFit];
    
    actionButton = [[UIButton alloc]initWithFrame:CGRectMake(15, subview.frame.size.height-53, subview.frame.size.width-30, 40)];
    [actionButton setTitle:ButtonName forState:UIControlStateNormal];
    actionButton.titleLabel.font = [UIFont fontWithName:kDefaultFont size:18.0f];
    [actionButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    actionButton.userInteractionEnabled = YES;
    [actionButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
  
    
    if(CardType==0)
    {
        [self mediumSizeCard];
    }
    else if (CardType==1)
    {
        [self longSizeCard];
        
    }
    else if (CardType==2)
    {
        [self shortSizeCard];
    }
    
}


-(void)mediumSizeCard{
    
    subview.frame = CGRectMake(CGRectGetMidX(cardView.bounds)-140, kDefaultInitialSubViewYaxis, kDefaultInitialCard1Width, kDefaultInitialCard1Height);

    
    
    [UIView animateWithDuration:kDefaultAnimateDuration
                          delay:kDefaultAnimateDelay
         usingSpringWithDamping:kDefaultSpringDamping
          initialSpringVelocity:kDefaultSpringVelocity
                        options:UIViewAnimationOptionCurveEaseOut animations:^{
                            subview.center = CGPointMake( CGRectGetMidX(cardView.bounds), CGRectGetMidY( cardView.bounds));



                        }
     
                     completion:^(BOOL finished) {
                         //Completion Block
                     }];

    cardImage.frame= CGRectMake((kDefaultInitialCard1Height/2)-42, 30, 40, 40);
    title.frame = CGRectMake(0, cardImage.frame.origin.y+cardImage.frame.size.height+20, subview.frame.size.width, 30);
    contentLabel.frame = CGRectMake(15, title.frame.origin.y+title.frame.size.height+20, subview.frame.size.width-30, 40);
    [contentLabel sizeToFit];
    actionButton.frame = CGRectMake(15, subview.frame.size.height-53, subview.frame.size.width-30, 40);
    
    [self addSubview:cardView];
    [cardView addSubview:subview];
    [subview addSubview:cardImage];
    [subview addSubview:title];
    [subview addSubview:contentLabel];
    [subview addSubview:actionButton];
    

   
}



-(void)longSizeCard
{
    subview.frame = CGRectMake(CGRectGetMidX(cardView.bounds)-160, kDefaultInitialSubViewYaxis-100, SCREEN_WIDTH-40, SCREEN_HEIGHT-140);
    
    
    
    [UIView animateWithDuration:kDefaultAnimateDuration
                          delay:kDefaultAnimateDelay
         usingSpringWithDamping:kDefaultSpringDamping
          initialSpringVelocity:kDefaultSpringVelocity
                        options:UIViewAnimationOptionCurveEaseOut animations:^{
                            
                            subview.center = CGPointMake( CGRectGetMidX(cardView.bounds ), CGRectGetMidY( cardView.bounds));
                           
                            
                            
                        }
     
                     completion:^(BOOL finished) {
                     }];
    
    cardImage.frame = CGRectMake(10, 10, subview.frame.size.width-20, 220);
    contentLabel.frame =  CGRectMake(15, cardImage.frame.origin.y+cardImage.frame.size.height+30, subview.frame.size.width-30, 40);
    [contentLabel sizeToFit];
    actionButton.frame =CGRectMake(15, subview.frame.size.height-53, subview.frame.size.width-30, 40);
    
    
    
    
    [self addSubview:cardView];
    [cardView addSubview:subview];
    [subview addSubview:cardImage];
    [subview addSubview:contentLabel];
    [subview addSubview:actionButton];

}

-(void)shortSizeCard
{
    subview.frame = CGRectMake(kDefaultInitialSubViewXaxis, kDefaultInitialSubViewYaxis, SCREEN_WIDTH-44, 120);
    
    
    
    [UIView animateWithDuration:kDefaultAnimateDuration
                          delay:kDefaultAnimateDelay
         usingSpringWithDamping:kDefaultSpringDamping
          initialSpringVelocity:kDefaultSpringVelocity
                        options:UIViewAnimationOptionCurveEaseOut animations:^{
                        
                        subview.center = CGPointMake( CGRectGetMidX(cardView.bounds ), CGRectGetMidY( cardView.bounds));

                            
                            
                        }
     
                     completion:^(BOOL finished) {
                         //Completion Block
                     }];
    
    cardImage.frame = CGRectMake(subview.frame.size.width - 50, 22, 40, 40);
    contentLabel.frame = CGRectMake(15, 18, subview.frame.size.width-(cardImage.frame.size.width+30), 40);
    [contentLabel sizeToFit];
    actionButton.frame = CGRectMake(5, subview.frame.size.height-36, subview.frame.size.width-10, 30);
    [actionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    actionButton.backgroundColor = [UIColor colorWithRed:135.0f/255.0f green:206.0f/255.0f blue:250.0f/255.0f alpha:1.0f];
    
    
    
    [self addSubview:cardView];
    [cardView addSubview:subview];
    [subview addSubview:cardImage];
    [subview addSubview:contentLabel];
    [subview addSubview:actionButton];
}

-(void)buttonAction
{
    [delegate cradViewButtonAction];
    [self removePopup];
}

-(void)removePopup
{
            [UIView animateWithDuration:0.5
                                    delay:0.1
                                options: UIViewAnimationOptionCurveEaseInOut
                             animations:^{
    
                                 subview.center = CGPointMake( CGRectGetMidX( cardView.bounds ), CGRectGetMidY( cardView.bounds)+600);
    
    
                             }
                             completion:^(BOOL finished){
    
                                 [cardView removeFromSuperview];
                                 [self removeFromSuperview];
                                 cardView = nil;
                                 subview = nil;
                                 title = nil;
                                 cardImage = nil;
                                 contentLabel = nil;
                                 actionButton = nil;
    
    
    
    
                             }];
}

-(void)handlePan:(UIPanGestureRecognizer*)recognizer
{
    
    CGPoint translation = [recognizer translationInView:recognizer.view];
    
    recognizer.view.center=CGPointMake(CGRectGetMidX( self.bounds ), recognizer.view.center.y+ translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:recognizer.view];
    
    if(recognizer.state==UIGestureRecognizerStateEnded)
    {
        if(recognizer.view.frame.origin.y > kDefaultRecongnizerValue)
        {
            
            [UIView animateWithDuration:kDefaultAnimateDuration
                                  delay:kDefaultAnimateDelay
                 usingSpringWithDamping:kDefaultSpringDamping
                  initialSpringVelocity:kDefaultSpringVelocity
                                options:UIViewAnimationOptionCurveEaseOut animations:^{
                                    recognizer.view.frame= CGRectMake(kDefaultInitialSubViewXaxis, SCREEN_HEIGHT+20, SCREEN_WIDTH-44, SCREEN_HEIGHT-210);
                                  
                                    [recognizer.view removeFromSuperview];
                                    [cardView removeFromSuperview];
                                    [self removeFromSuperview];
                                    cardView = nil;
                                    subview = nil;
                                    title = nil;
                                    cardImage = nil;
                                    contentLabel = nil;
                                    actionButton = nil;
                                }
             
                             completion:^(BOOL finished) {
                                 
                             }];
        }
        else
        {
            
            [UIView animateWithDuration:kSendBackViewAnimateDuration
                                  delay:kSendBackViewAnimateDelay
                 usingSpringWithDamping:kSendBackViewSpringDamping
                  initialSpringVelocity:kDefaultSpringVelocity
                                options:UIViewAnimationOptionCurveEaseOut animations:^{
                                    recognizer.view.center = CGPointMake( CGRectGetMidX(cardView.bounds ), CGRectGetMidY( cardView.bounds));
                                    
                                }
             
                             completion:^(BOOL finished) {
                                 //Completion Block
                             }];
        }
    }
}

@end
