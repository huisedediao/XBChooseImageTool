//
//  XBChooseImageTool.m
//  TongMeng
//
//  Created by xxb on 2019/1/20.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import "XBChooseImageTool.h"

@interface XBChooseImageTool ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic,copy) XBChooseImageToolBlock bl_complete;
@property (nonatomic,assign) BOOL autoDismiss;
@end

@implementation XBChooseImageTool
- (void)chooseImageWithType:(XBChooseImageToolSourceType)type presentVC:(UIViewController *)presentVC autoDismiss:(BOOL)autoDismiss completeBlock:(XBChooseImageToolBlock)completeBlock
{
    self.autoDismiss = autoDismiss;
    self.bl_complete = completeBlock;
    if (type == XBChooseImageToolSourceType_camera)
    {
        UIImagePickerController *pickerPhoto = [[UIImagePickerController alloc] init];
        pickerPhoto.delegate = self;
        pickerPhoto.sourceType = UIImagePickerControllerSourceTypeCamera;
        [presentVC presentViewController:pickerPhoto animated:YES completion:nil];
    }
    else
    {
        UIImagePickerController *pickerPhoto = [[UIImagePickerController alloc] init];
        pickerPhoto.delegate = self;
        pickerPhoto.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [presentVC presentViewController:pickerPhoto animated:YES completion:nil];
    }
}

#pragma mark - UIImagePicker delegate methods
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    if (self.bl_complete)
    {
        self.bl_complete(image,picker);
    }
    if (self.autoDismiss)
    {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
