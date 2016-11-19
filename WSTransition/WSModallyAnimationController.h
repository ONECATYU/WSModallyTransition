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

@interface WSModallyAnimationController : NSObject
<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) BOOL opposite;
@property (nonatomic, assign) WSModallyAnimationStyle animationStyle;

/**
 开始动画的位置，从哪个方向做动画（WSModallyAnimationStyleActionSheet有效）
 */
@property (nonatomic, assign) WSAnimationStartPosition position;

@end
