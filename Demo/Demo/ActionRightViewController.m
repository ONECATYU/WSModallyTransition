//
//  ActionRightViewController.m
//  Demo
//
//  Created by 余汪送 on 2016/11/19.
//  Copyright © 2016年 余汪送. All rights reserved.
//

#import "ActionRightViewController.h"

@interface ActionRightViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation ActionRightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (WSModallyAnimationController *)animationController {
    WSModallyAnimationController *animation = [WSModallyAnimationController new];
    animation.position = WSAnimationStartRight;
    return animation;
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
