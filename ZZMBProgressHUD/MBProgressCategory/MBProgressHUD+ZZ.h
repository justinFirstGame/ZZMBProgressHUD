//
//  MBProgressHUD+ZZ.h
//  ZZMBProgressHUDDemo
//
//  Created by sunparl on 2018/9/4.
//  Copyright © 2018年 zz. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (ZZ)

/*
 * 默认只支持显示在window上
 */

/*
 只有菊花1.5s后消失
 */
+ (void)justShowView;
/*
 隐藏
 */
+ (void)justHiddenWindow;
/*
 圆形进度
 */
+ (MBProgressHUD *)justShowViewFromProgress;
/*
 不消失的加载中
 */
+ (MBProgressHUD *)justShowLoadingView;


/*
 显示无图片的文字
 */
+ (void)justShowMessage:(NSString *)message;
/*
 成功的显示
 */
+ (void)justShowSuccess:(NSString *)success;
/*
 失败的显示
 */
+ (void)justShowError:(NSString *)error;
/*
 警告的显示
 */
+ (void)justShowWarning:(NSString *)Warning;
/*
 自定义图片文字信息的显示
 */
+ (void)justShowMessageWithImageName:(NSString *)imageName message:(NSString *)message;


@end
