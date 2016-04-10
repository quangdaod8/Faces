//
//  FaceKey.h
//  faces
//
//  Created by Duy Quang on 4/6/16.
//  Copyright © 2016 duyquang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FaceKey : UIButton<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

-(void)setNumTitle:(NSString*)title SubTitle:(NSString*)subTitle;

@end
