//
//  YHPhotoModel.m
//  YHPhotoKit
//
//  Created by deng on 16/11/26.
//  Copyright © 2016年 dengyonghao. All rights reserved.
//

#import "YHPhotoModel.h"

@implementation YHPhotoModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isSelected = NO;
        _isOriginPhoto = NO;
    }
    return self;
}

- (void)setDataWithPhotoAsset:(PHAsset *)asset imageManager:(PHCachingImageManager *)imageManager {
    _cachingManager = imageManager;
    _photoAsset = asset;
    CGSize imgSize;
    
    if (_isOriginPhoto) {
        imgSize = CGSizeMake(asset.pixelWidth, asset.pixelHeight);
    } else {
        imgSize = [[UIScreen mainScreen] bounds].size;
        CGFloat imgScale = [[UIScreen mainScreen] scale];
        imgSize = CGSizeMake(imgSize.width * imgScale, imgSize.height * imgScale);
    }
    
    _largeImageSize = imgSize;
}

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    
    if (isSelected) {

        CGSize originSize = CGSizeMake(_photoAsset.pixelHeight / UIScreen.mainScreen.scale, _photoAsset.pixelWidth / UIScreen.mainScreen.scale);
        if (_isOriginPhoto) {
            _largeImageSize = originSize;
            [self loadOriginPhoto];
        } else {
//            _largeImageSize = CGSizeMake(originSize.width / 2, originSize.height / 2);
            PHImageRequestOptions *options = [[PHImageRequestOptions alloc]init];
            options.synchronous  = YES;
            options.resizeMode = PHImageRequestOptionsResizeModeExact;
            options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
            [_cachingManager requestImageForAsset:_photoAsset
                                       targetSize:_largeImageSize
                                      contentMode:PHImageContentModeDefault
                                          options:options
                                    resultHandler:^(UIImage *result, NSDictionary *info) {
                                        _largeImage = result;
                                    }];
        }
       
    } else {
        _largeImage = nil;
    }
}

- (void)setIsOriginPhoto:(BOOL)isOriginPhoto {
    _isOriginPhoto = isOriginPhoto;
    
    if (_isSelected) {
        CGSize originSize = CGSizeMake(_photoAsset.pixelWidth / UIScreen.mainScreen.scale, _photoAsset.pixelHeight / UIScreen.mainScreen.scale);
        _largeImageSize = originSize;
        [self loadOriginPhoto];
    }

}

- (void)loadOriginPhoto {
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc]init];
    options.synchronous  = YES;
    options.resizeMode = PHImageRequestOptionsResizeModeExact;
    options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
    [_cachingManager requestImageForAsset:_photoAsset
                               targetSize:_largeImageSize
                              contentMode:PHImageContentModeDefault
                                  options:options
                            resultHandler:^(UIImage *result, NSDictionary *info) {
                                _largeImage = result;
                            }];
}


- (CGSize)fetchImageSizeWithOriginSize:(CGSize)originSize {
    CGFloat scale = originSize.width/originSize.height;
    CGSize fetchSize;
    if (scale > 1) {
        fetchSize = CGSizeMake(1280, 1280 / scale );
    } else {
        fetchSize = CGSizeMake(720 * scale, 720);
    }
    return fetchSize;
}

@end
