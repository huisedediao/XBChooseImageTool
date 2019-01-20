//
//  XBChooseImageTool.h
//  TongMeng
//
//  Created by xxb on 2019/1/20.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^XBChooseImageToolBlock)(UIImage *image, UIImagePickerController *picker);

typedef enum : NSUInteger {
    XBChooseImageToolSourceType_camera,
    XBChooseImageToolSourceType_album
} XBChooseImageToolSourceType;

NS_ASSUME_NONNULL_BEGIN

@interface XBChooseImageTool : NSObject
- (void)chooseImageWithType:(XBChooseImageToolSourceType)type presentVC:(UIViewController *)presentVC autoDismiss:(BOOL)autoDismiss completeBlock:(XBChooseImageToolBlock)completeBlock;
@end

NS_ASSUME_NONNULL_END
