//
//  ViewController.m
//  faces
//
//  Created by Duy Quang on 4/6/16.
//  Copyright © 2016 duyquang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _banner.adUnitID = @"ca-app-pub-9719677587937425/6244306598";
    _banner.rootViewController = self;
    [_banner loadRequest:[GADRequest request]];
    
    _full = [[GADInterstitial alloc]initWithAdUnitID:@"ca-app-pub-9719677587937425/7162636596"];
    [_full loadRequest:[GADRequest request]];
    _full.delegate = self;
    
    [_btn2 setNumTitle:@"2" SubTitle:@"ABC"];
    [_btn3 setNumTitle:@"3" SubTitle:@"DEF"];
    [_btn4 setNumTitle:@"4" SubTitle:@"GHI"];
    [_btn5 setNumTitle:@"5" SubTitle:@"JKL"];
    [_btn6 setNumTitle:@"6" SubTitle:@"MNO"];
    [_btn7 setNumTitle:@"7" SubTitle:@"PQRS"];
    [_btn8 setNumTitle:@"8" SubTitle:@"TVU"];
    [_btn9 setNumTitle:@"9" SubTitle:@"WXYZ"];
    [_btn1 setNumTitle:@"1" SubTitle:@""];
    [_btn0 setNumTitle:@"0" SubTitle:@""];
    
    UIBarButtonItem *share = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(saveFaceImage)];
    self.navigationItem.rightBarButtonItem = share;
    
    UIBarButtonItem *img = [[UIBarButtonItem alloc]initWithTitle:@"About" style:UIBarButtonItemStylePlain target:self action:@selector(aboutFace)];
    self.navigationItem.leftBarButtonItem = img;
    
    [self aboutFace];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saveFaceImage {
    
    UIActivityViewController *alert = [[UIActivityViewController alloc]initWithActivityItems:@[[NSString stringWithFormat:@"%@\n\n",_btnTitle.titleLabel.text],[self takeSnapshotOfView:self.faceView],[NSURL URLWithString:@"https://itunes.apple.com/us/app/faces-amazing-passcode-photo/id1100739725?ls=1&mt=8"]] applicationActivities:nil];
    alert.excludedActivityTypes = @[UIActivityTypePrint,UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact];
    
    UIPopoverPresentationController *popPresenter = [alert popoverPresentationController];
    popPresenter.sourceView = self.view;
    popPresenter.sourceRect = _faceView.frame;
    
    if(_full.isReady) [_full presentFromRootViewController:self];
    else [self presentViewController:alert animated:YES completion:nil];
    
}

-(void)aboutFace {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Faces" message:@"Press buttons to add image or text\nJust save & share when finished\nEnjoy!" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *rate = [UIAlertAction actionWithTitle:@"Rate & Review" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1100739725&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software"]];
    }];
    
    UIAlertAction *share = [UIAlertAction actionWithTitle:@"Share this App" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIActivityViewController *activity = [[UIActivityViewController alloc]initWithActivityItems:@[@"Creat amazing image with Faces App\n",[NSURL URLWithString:@"https://itunes.apple.com/us/app/faces-amazing-passcode-photo/id1100739725?ls=1&mt=8"]] applicationActivities:nil];
        
        UIPopoverPresentationController *popPresenter = [activity popoverPresentationController];
        popPresenter.sourceView = self.view;
        popPresenter.sourceRect = _faceView.frame;
        
        [self presentViewController:activity animated:YES completion:nil];
    }];
    
    
    [alert addAction:cancel];
    [alert addAction:share];
    [alert addAction:rate];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (IBAction)btnRightAction:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Text" message:@"Enter title for this text" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Your_Text";
        textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    }];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [_btnRight setTitle:[alert.textFields firstObject].text forState:UIControlStateNormal];
    }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];

}

- (IBAction)btnLeftAction:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Text" message:@"Enter title for this text" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Your_Text";
        textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    }];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [_btnLeft setTitle:[alert.textFields firstObject].text forState:UIControlStateNormal];
    }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];

}

- (IBAction)btnTitleAction:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Text" message:@"Enter title for this text" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Your_Text";
        textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    }];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [_btnTitle setTitle:[alert.textFields firstObject].text forState:UIControlStateNormal];
    }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
                                
}

- (UIImage *)takeSnapshotOfView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view drawViewHierarchyInRect:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height) afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

-(void)interstitialDidDismissScreen:(GADInterstitial *)ad {
    UIActivityViewController *alert = [[UIActivityViewController alloc]initWithActivityItems:@[[NSString stringWithFormat:@"%@\n\n",_btnTitle.titleLabel.text],[self takeSnapshotOfView:self.faceView],[NSURL URLWithString:@"https://itunes.apple.com/us/app/faces-amazing-passcode-photo/id1100739725?ls=1&mt=8"]] applicationActivities:nil];
    alert.excludedActivityTypes = @[UIActivityTypePrint,UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact];
    
    UIPopoverPresentationController *popPresenter = [alert popoverPresentationController];
    popPresenter.sourceView = self.view;
    popPresenter.sourceRect = _faceView.frame;
    
    [self presentViewController:alert animated:YES completion:nil];
    
    _full = [[GADInterstitial alloc]initWithAdUnitID:@"ca-app-pub-9719677587937425/7162636596"];
    [_full loadRequest:[GADRequest request]];
    _full.delegate = self;

}

@end
