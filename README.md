# Card Popup Message View
  
  Better and efficient way to show popup to the user. It can be message popup or alertview popup 
 
# Screen shots 

  <img align="left" src="http://i.imgur.com/2CPvKTl.jpeg" alt="SS1" width="200" height="360"/>
  <img align="center" src="http://i.imgur.com/52ZFGfZ.jpeg" alt="SS2" width="200" height="360"/>
  <img align="center" src="http://i.imgur.com/n6fa5Z6.jpeg" alt="SS3" width="200" height="360"/>
  <img align="center" src="http://i.imgur.com/whQp4Dq.jpeg" alt="SS3" width="200" height="360"/>


# Installation

Just drag and drop the "Cardview.h" and "Cardview.m" file from source files into your project, 
and make sure you check the "Copy items into destination group's folder" box

###### - Then import Cardview.h and set the cradViewDelegate wherever you need it.

```objective-c
#import "Cardview.h"

@interface ViewController : UIViewController<cradViewDelegate>
```

# Usage

Creation is very simple just send the message image , message title and button name. And for card type 2 you have send image and body of the messge.

Card type 3 send message, image and button name and don forget to send your card type as int format.

```objective-c

Cardview *card = [[Cardview alloc]init];
card.delegate=self;

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

```

As like above create object and send the image and text to be shown in the popup.

If you want to change animation speed or timing change below values which is available in SubMenuAnimation.h.

```objective-c
const CGFloat kDefaultAnimateDuration = 0.95f;
const CGFloat kDefaultAnimateDelay = 0.2f;
const CGFloat kDefaultSpringDamping = 0.65f;
const CGFloat kDefaultSpringVelocity = 0.12f;

const CGFloat kSendBackViewAnimateDuration = 0.5f;
const CGFloat kSendBackViewAnimateDelay = 0.15f;
const CGFloat kSendBackViewSpringDamping = 0.48f;
```

# Handling Delegate function

So when you press any of those button delegate function will be get triggered in ViewController. So from the delegate you can do your logic.

```objective-c
-(void)cradViewButtonAction
{
    NSLog(@"Do your logic Here");
}
```

Note : This is my first try so please feel free to comment or even you can tell me if i have to improve anything
or even small mistakes in the coding. Thanks

# Get in touch
If you want to contact me mail at vijays1107@gmail.com 
or
Just tweet me : [@iam_vijay7](https://twitter.com/iam_vijay7)

# License

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
