//
//  WSModallyAnimationController.h
//  zhuanchang
//
//  Created by 余汪送 on 2016/11/11.
//  Copyright © 2016年 余汪送. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WSModallyAnimationStyle) {
    WSModallyAnimationStyleActionSheet = 0,
    WSModallyAnimationStyleAlert
};

typedef NS_ENUM(NSInteger, WSAnimationStartPosition) {
    WSAnimationStartBottom,
    WSAnimationStartLeft,
    WSAnimationStartRight,
    WSAnimationStartTop
};

NS_ASSUME_NONNULL_BEGIN

@interface WSModallyAnimationController : NSObject
<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) BOOL opposite;
@property (nonatomic, assign) WSModallyAnimationStyle animationStyle;

//最终Modally出来的viewController.view的alpha(defalut = 0.5)
@property (nonatomic, assign) CGFloat finalAlpha;

/**
 开始动画的位置，从哪个方向做动画（WSModallyAnimationStyleActionSheet有效）
 */
@property (nonatomic, assign) WSAnimationStartPosition position;

//如有需要,其他view可以通过该block进行同步动画
@property (nonatomic, copy) void(^extraAnimations)(WSModallyAnimationController *animationController);

@end

NS_ASSUME_NONNULL_END
