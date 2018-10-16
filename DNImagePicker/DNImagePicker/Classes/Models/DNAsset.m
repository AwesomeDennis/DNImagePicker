//
//  DNAsset.m
//  ImagePicker
//
//  Created by DingXiao on 15/3/6.
//  Copyright (c) 2015年 Dennis. All rights reserved.
//

#import "DNAsset.h"
#import <Photos/Photos.h>
@interface DNAsset ()
@property (nonatomic, strong, nullable) PHAsset *asset;
@end

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveMemoryWarningInAssets) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    return self;
}

@implementation DNAsset

+ (DNAsset *)assetWithPHAsset:(PHAsset *)asset {
    DNAsset *a = [[DNAsset alloc] init];
    if (!asset) {
        return a;
    }
    a.asset = asset;
    a.assetIdentifier = asset.localIdentifier;
    return a;
}

- (void)didReceiveMemoryWarningInAssets {
    _cacheImage = nil;
}


@end
