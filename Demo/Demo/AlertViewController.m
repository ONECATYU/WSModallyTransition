//
//  AlertViewController.m
//  WSModallyTransition
//
//  Created by 余汪送 on 2016/11/15.
//  Copyright © 2016年 余汪送. All rights reserved.
//

#import "AlertViewController.h"

@interface AlertViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _containerView.layer.masksToBounds = YES;
    _containerView.layer.cornerRadius = 10;
}

- (WSModallyAnimationController *)animationController {
    WSModallyAnimationController *animation = [WSModallyAnimationController new];
    animation.animationStyle = WSModallyAnimationStyleAlert;
    return animation;
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)sure:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
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
