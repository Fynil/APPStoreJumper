//
//  YFAPPStoreJumper.h
//  APPStoreJumper
//
//  Created by Fynil on 2018/8/10.
//  Copyright © 2018年 Fynil. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface YFAPPStoreJumper : NSObject

- (instancetype)initWithAppID: (NSString *)appID;
- (void)jumpToAPPStore;
- (void)showAPPStoreInVC: (UIViewController *)viewController;

@end
