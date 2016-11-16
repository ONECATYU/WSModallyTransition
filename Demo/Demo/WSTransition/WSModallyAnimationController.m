//
//  WSModallyAnimationController.m
//  zhuanchang
//
//  Created by 余汪送 on 2016/11/11.
//  Copyright © 2016年 余汪送. All rights reserved.
//

#import "WSModallyAnimationController.h"

@implementation WSModallyAnimationController

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    switch (_animationStyle) {
        case WSModallyAnimationStyleAlert:
            [self alertBoxAnimateTransition:transitionContext];
            break;
        default:
            [self actionSheetAnimateTransition:transitionContext];
            break;
    }
}

- (void)alertBoxAnimateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *containView = transitionContext.containerView;
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIView *destinationView = _opposite? fromView:toView;
    UIViewController *destinationVC = _opposite? fromVC:toVC;
    
    if (!_opposite) {
        destinationView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        [containView addSubview:destinationView];
    }
    
    if ([destinationVC respondsToSelector:@selector(contentView)]) {
        UIView *contentView = [destinationVC valueForKey:@"contentView"];
        [contentView.superview layoutIfNeeded];
        if (contentView) {
            __block CGRect rect = contentView.frame;
            CGFloat scale = (containView.bounds.size.width - rect.size.width) / rect.size.width;
            if (!_opposite) {
                contentView.transform = CGAffineTransformMakeScale(1 + scale, 1 + scale);
            }else{
                contentView.alpha = 0.5;
            }
            
            [UIView animateWithDuration:self.duration
                             animations:^{
                                 [UIView setAnimationCurve:7];
                                 destinationView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5 * (!_opposite)];
                                 if (!_opposite) {
                                     contentView.transform = CGAffineTransformMakeScale(1, 1);
                                 }else{
                                     contentView.alpha = 0;
                                 }
                             } completion:^(BOOL finished) {
                                 [transitionContext completeTransition:YES];
                             }];
        }
    }
    
    
}

- (void)actionSheetAnimateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *containView = transitionContext.containerView;
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIView *destinationView = _opposite? fromView:toView;
    UIViewController *destinationVC = _opposite? fromVC:toVC;
    
    if (!_opposite) {
        destinationView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        [containView addSubview:destinationView];
    }
    
    if ([destinationVC respondsToSelector:@selector(contentView)]) {
        UIView *contentView = [destinationVC valueForKey:@"contentView"];
        [contentView.superview layoutIfNeeded];
        if (contentView) {
            __block CGRect rect = contentView.frame;
            if (!_opposite) {
                rect.origin.y = containView.frame.size.height;
                contentView.frame = rect;
            }
            [UIView animateWithDuration:self.duration
                             animations:^{
                                 [UIView setAnimationCurve:7];
                                 destinationView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5 * (!_opposite)];
                                 rect.origin.y = containView.frame.size.height - rect.size.height + rect.size.height * _opposite;
                                 contentView.frame = rect;
                             } completion:^(BOOL finished) {
                                 [transitionContext completeTransition:YES];
                             }];
            return;
        }
    }
    [transitionContext completeTransition:YES];
}

- (NSTimeInterval)duration {
    if (_duration <= 0) {
        _duration = 0.25;
    }
    return _duration;
}

@end
