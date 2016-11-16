//
//  WSModallyViewController.h
//  zhuanchang
//
//  Created by 余汪送 on 2016/11/11.
//  Copyright © 2016年 余汪送. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSModallyAnimationController.h"

@protocol WSModallyViewControllerDelegate <NSObject>

@required

/**
 返回一个过渡动画控制器
 */
- (WSModallyAnimationController *)animationController;

/**
 返回一个做动画的contentView
 */
- (UIView *)contentView;

@end


@interface WSModallyViewController : UIViewController
<UIViewControllerTransitioningDelegate,WSModallyViewControllerDelegate>

@end



