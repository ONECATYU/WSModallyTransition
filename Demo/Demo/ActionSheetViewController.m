//
//  ActionSheetViewController.m
//  WSModallyTransition
//
//  Created by 余汪送 on 2016/11/15.
//  Copyright © 2016年 余汪送. All rights reserved.
//

#import "ActionSheetViewController.h"

@interface ActionSheetViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ActionSheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (WSModallyAnimationController *)animationController {
    WSModallyAnimationController *animation = [WSModallyAnimationController new];
    return animation;
}

- (IBAction)btnClick:(id)sender {
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
