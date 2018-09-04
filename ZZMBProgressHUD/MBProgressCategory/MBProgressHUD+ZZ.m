//
//  MBProgressHUD+ZZ.m
//  ZZMBProgressHUDDemo
//
//  Created by sunparl on 2018/9/4.
//  Copyright © 2018年 zz. All rights reserved.
//

#import "MBProgressHUD+ZZ.h"


#define appWindow [[UIApplication sharedApplication].windows lastObject]
// 时长
#define kHudShowTime 1.5


@implementation MBProgressHUD (ZZ)

+ (void)justShowView {
    [self justShowWindow];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kHudShowTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self justHiddenWindow];
    });
}

+ (void)justShowWindow {
    [MBProgressHUD showHUDAddedTo:appWindow animated:YES];
}

+ (void)justHiddenWindow {
    [MBProgressHUD hideHUDForView:appWindow animated:YES];
}

+ (MBProgressHUD *)justShowViewFromProgress {
    MBProgressHUD *mbHUD = [MBProgressHUD showHUDAddedTo:appWindow animated:YES];
    mbHUD.mode = MBProgressHUDModeDeterminate;
    mbHUD.label.text = @"等待中";
    mbHUD.contentColor = [UIColor redColor];
    return mbHUD;
}

+ (void)justShow:(NSString *)text icon:(NSString *)icon {
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:appWindow animated:YES];
    hud.label.text = text;
    // 判断是否显示图片
    if (icon == nil) {
        hud.mode = MBProgressHUDModeText;
    }else{
        // 设置图片
        UIImage *img = [UIImage imageNamed:icon];
        hud.customView = [[UIImageView alloc] initWithImage:img];
        // 再设置模式
        hud.mode = MBProgressHUDModeCustomView;
    }
    hud.removeFromSuperViewOnHide = YES;
    // 指定时间之后再消失
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kHudShowTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self justHiddenWindow];
    });
}

#pragma mark 显示成功信息
+ (void)justShowSuccess:(NSString *)success {
    [self justShow:success icon:@"success.png"];
}

#pragma mark 显示错误信息
+ (void)justShowError:(NSString *)error {
    [self justShow:error icon:@"error.png"];
}

#pragma mark 显示警告信息
+ (void)justShowWarning:(NSString *)Warning {
    [self justShow:Warning icon:@"warn"];
}

#pragma mark 显示自定义图片信息
+ (void)justShowMessageWithImageName:(NSString *)imageName message:(NSString *)message {
    [self justShow:message icon:imageName ];
}

#pragma mark 显示一条信息
+ (void)justShowMessage:(NSString *)message {
    [self justShow:message icon:nil];
}

+ (MBProgressHUD *)justShowLoadingView{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:appWindow animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = @"加载中...";
    return hud;
}

@end
