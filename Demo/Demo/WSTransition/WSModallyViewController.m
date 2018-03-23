//
//  WSModallyViewController.m
//  zhuanchang
//
//  Created by 余汪送 on 2016/11/11.
//  Copyright © 2016年 余汪送. All rights reserved.
//

#import "WSModallyViewController.h"

@interface WSModallyViewController ()

@end

@implementation WSModallyViewController

- (instancetype)init {
    if (self = [super init]) {
        [self configure];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self configure];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self configure];
    }
    return self;
}

- (void)configure {
    self.transitioningDelegate = self;
    self.modalPresentationStyle = UIModalPresentationCustom;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [self animationController];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    WSModallyAnimationController *animation = [self animationController];
    animation.opposite = YES;
    return animation;
}

#pragma mark WSModallyViewControllerDelegate
- (WSModallyAnimationController *)animationController {
    NSAssert(0, @"****** Must be in subclasses override this method and return WSModallyAnimationController object ******");
    return nil;
}

- (WSModallyContainerView *)containerView {
    NSAssert(0, @"****** Must be in subclasses override this method and return WSModallyView object ******");
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
