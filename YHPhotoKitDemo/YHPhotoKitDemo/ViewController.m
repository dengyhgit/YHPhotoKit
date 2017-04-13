//
//  ViewController.m
//  YHPhotoKitDemo
//
//  Created by deng on 13/04/2017.
//  Copyright © 2017 dengyonghao. All rights reserved.
//

#import "ViewController.h"
#import "YHPhotoKit.h"

@interface ViewController () <YHPhotoPickerViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)selectPhotos:(id)sender {
    YHPhotoPickerViewController *photoPickerVC = [[YHPhotoPickerViewController alloc] init];
    photoPickerVC.pickerDelegate = self;
    [self presentViewController:photoPickerVC animated:YES completion:NULL];
}

- (void)YHPhotoPickerViewController:(YHSelectPhotoViewController *)PhotoPickerViewController selectedPhotos:(NSArray *)photos {
    NSLog(@"selectedPhotos");
}

- (void)selectedPhotoBeyondLimit:(int)count currentView:(UIView *)view {
    NSLog(@"selectedPhotoBeyondLimit");
}

@end
