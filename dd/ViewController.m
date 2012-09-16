//
//  ViewController.m
//  dd
//
//  Created by app on 12-9-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 120, 70)];
    [self.view addSubview:imageView];
    [imageView release];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 190, 120, 20);
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)buttonClick
{
    UIActionSheet* as = [[UIActionSheet alloc] initWithTitle:@"选择图片来源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"相机" otherButtonTitles:@"相册", nil];
    [as showInView:self.view];
    [as release];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 2) {
        return;
    }
    
    UIImagePickerController* pc = [[UIImagePickerController alloc] init];
    
    if (buttonIndex == 0 && TARGET_IPHONE_SIMULATOR) {
        [pc release];
        return;
    }
    
    if (buttonIndex == 0) {
        pc.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else if (buttonIndex == 1){
        pc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }
    pc.delegate = self;
    [self presentModalViewController:pc animated:YES];
    [pc release];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    
    imageView.image = image;
    imageView.center = CGPointMake(160, 230);
    imageView.bounds = CGRectMake(0, 0, 320, 460);
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissModalViewControllerAnimated:YES];
}

@end
