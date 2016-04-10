//
//  ViewController.h
//  faces
//
//  Created by Duy Quang on 4/6/16.
//  Copyright © 2016 duyquang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceKey.h"
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface ViewController : UIViewController<GADInterstitialDelegate>

@property (weak, nonatomic) IBOutlet FaceKey *btn1;
@property (weak, nonatomic) IBOutlet FaceKey *btn2;
@property (weak, nonatomic) IBOutlet FaceKey *btn3;
@property (weak, nonatomic) IBOutlet FaceKey *btn4;
@property (weak, nonatomic) IBOutlet FaceKey *btn5;
@property (weak, nonatomic) IBOutlet FaceKey *btn7;
@property (weak, nonatomic) IBOutlet FaceKey *btn8;
@property (weak, nonatomic) IBOutlet FaceKey *btn9;
@property (weak, nonatomic) IBOutlet FaceKey *btn0;

@property (weak, nonatomic) IBOutlet FaceKey *btn6;
@property (weak, nonatomic) IBOutlet UIButton *btnLeft;
@property (weak, nonatomic) IBOutlet UIButton *btnRight;
- (IBAction)btnRightAction:(id)sender;
- (IBAction)btnLeftAction:(id)sender;
- (IBAction)btnTitleAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *faceView;
@property (weak, nonatomic) IBOutlet GADBannerView *banner;

@property (strong, nonatomic) GADInterstitial *full;

@property (weak, nonatomic) IBOutlet UIButton *btnTitle;
@end

