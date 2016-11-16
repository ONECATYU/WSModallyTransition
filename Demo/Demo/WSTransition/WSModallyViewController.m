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

/**
 实现WSModallyViewControllerDelegate协议方法

 @return WSModallyAnimationController 对象
 */
- (WSModallyAnimationController *)animationController {
    NSAssert(0, @"Please in WSModallyViewController WSModallyViewControllerDelegate subclass implementation, return a WSModallyAnimationController object");
    return nil;
}

- (UIView *)contentView {
    NSAssert(0, @"Please in WSModallyViewController WSModallyViewControllerDelegate subclass implementation, return a contentView object");
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
