//
//  WSModallyView.h
//  Demo
//
//  Created by 余汪送 on 2018/3/22.
//  Copyright © 2018年 余汪送. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WSModallyContainerView : UIView

//是否根据safeInsets来调整子view依赖WSModallyView左右上下约束的constant
//default = YES
@property (nonatomic, assign) BOOL autoAdjustContentEdges;

@end

NS_ASSUME_NONNULL_END
