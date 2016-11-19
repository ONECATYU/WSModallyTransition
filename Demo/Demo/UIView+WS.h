//
//  UIView+WS.h
//  Demo
//
//  Created by 余汪送 on 2016/11/19.
//  Copyright © 2016年 余汪送. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WS)

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, weak) IBInspectable UIColor *borderColor;

@end
