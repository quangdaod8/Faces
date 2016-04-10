//
//  FaceKey.m
//  faces
//
//  Created by Duy Quang on 4/6/16.
//  Copyright © 2016 duyquang. All rights reserved.
//

#import "FaceKey.h"

@implementation FaceKey

- (void)drawRect:(CGRect)rect {
    self.clipsToBounds = YES;
    self.layer.cornerRadius = self.bounds.size.width/2;
    self.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.layer.borderWidth = 1;
    [self setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
    self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:9];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.alpha = 0.9;
    
    [self addTarget:self action:@selector(setBackgroundImageWithImage) forControlEvents:UIControlEventTouchDown];
}

-(void)setNumTitle:(NSString *)title SubTitle:(NSString *)subTitle {
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, self.bounds.size.height/2 - 10, self.bounds.size.width, 20)];
    lbl.text = title;
    lbl.textColor = [UIColor whiteColor];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    lbl.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:self.bounds.size.width/3];
    lbl.alpha = 0.9;
    [self addSubview:lbl];
    [self setTitle:subTitle forState:UIControlStateNormal];
}

-(void)setBackgroundImageWithImage {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.allowsEditing = YES;
    imagePickerController.delegate = self;
    [[self topMostController] presentViewController:imagePickerController animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *originalImage, *editedImage, *imageToUse;
    
    editedImage = (UIImage *) [info objectForKey:
                               UIImagePickerControllerEditedImage];
    originalImage = (UIImage *) [info objectForKey:
                                 UIImagePickerControllerOriginalImage];
    
    if (editedImage) {
        imageToUse = editedImage;
    } else {
        imageToUse = originalImage;
    }
    [self setBackgroundImage:imageToUse forState:UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (UIViewController*) topMostController
{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    
    return topController;
}


@end
