//
//  WSModallyAnimationController.m
//  zhuanchang
//
//  Created by 余汪送 on 2016/11/11.
//  Copyright © 2016年 余汪送. All rights reserved.
//

#import "WSModallyAnimationController.h"

NSString *const WSModallyAnimatorContainerViewKey = @"containerView";

@implementation WSModallyAnimationController

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    [self animateTransition:transitionContext fromVC:fromVC toVC:toVC fromView:fromView toView:toView];
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView
{
    UIView *containView = transitionContext.containerView;
    UIView *destinationView = _opposite? fromView:toView;
    UIViewController *destinationVC = _opposite? fromVC:toVC;
    
    if (!_opposite) {
        destinationView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        [containView addSubview:destinationView];
    }
    
    if ([destinationVC respondsToSelector:NSSelectorFromString(WSModallyAnimatorContainerViewKey)]) {
        UIView *contentView = [destinationVC valueForKey:WSModallyAnimatorContainerViewKey];
        [contentView.superview layoutIfNeeded];
        if (contentView) {
            switch (_animationStyle) {
                default:
                case WSModallyAnimationStyleActionSheet:
                    [self actionSheetAnimationWithTransition:transitionContext
                                                 contentView:contentView
                                             destinationView:destinationView];
                    break;
                case WSModallyAnimationStyleAlert:
                    [self alterAnimationWithTransition:transitionContext
                                           contentView:contentView
                                       destinationView:destinationView];
                    break;
            }
            return;
        }
    }
    [transitionContext completeTransition:YES];
}

#pragma mark -- WSModallyAnimationStyleActionSheet

- (void)actionSheetAnimationWithTransition:(id <UIViewControllerContextTransitioning>)transitionContext
                         contentView:(UIView *)contentView
                     destinationView:(UIView *)destinationView
{
    UIView *containView = transitionContext.containerView;
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
}

#pragma mark -- WSModallyAnimationStyleAlert

- (void)alterAnimationWithTransition:(id <UIViewControllerContextTransitioning>)transitionContext
                         contentView:(UIView *)contentView
                     destinationView:(UIView *)destinationView
{
    UIView *containView = transitionContext.containerView;
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

- (NSTimeInterval)duration {
    if (_duration <= 0) {
        _duration = 0.25;
    }
    return _duration;
}

@end
