//
//  YFAPPStoreJumper.m
//  APPStoreJumper
//
//  Created by Fynil on 2018/8/10.
//  Copyright © 2018年 Fynil. All rights reserved.
//

#import "YFAPPStoreJumper.h"
@import StoreKit;

@interface YFAPPStoreJumper () <SKStoreProductViewControllerDelegate>

@property (nonatomic, copy) NSString *appID;
@property (nonatomic, strong) SKStoreProductViewController *storeVC;

@end

@implementation YFAPPStoreJumper

- (instancetype)initWithAppID: (NSString *)appID
{
    self = [super init];
    if (self) {
        self.appID = appID;
    }
    return self;
}

- (void)jumpToAPPStore {
    NSURL *url = [self appStoreLink];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
            
        }];
    }
}

- (NSURL *)appStoreLink {
    NSString *link = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/id%@?mt=8",self.appID];
    NSURL *url = [NSURL URLWithString:link];
    return url;
}

- (void)showAPPStoreInVC: (UIViewController *)viewController {
    self.storeVC = [[SKStoreProductViewController alloc] init];
    self.storeVC.delegate = self;
    [viewController presentViewController:self.storeVC animated:YES completion:nil];
    [self.storeVC loadProductWithParameters:@{SKStoreProductParameterITunesItemIdentifier:[NSNumber numberWithInteger:self.appID.integerValue]} completionBlock:^(BOOL result, NSError * _Nullable error) {
        
    }];
}

- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

@end
