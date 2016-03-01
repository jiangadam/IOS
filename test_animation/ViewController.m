//
//  ViewController.m
//  test_animation
//
//  Created by 蒋永忠 on 16/2/22.
//  Copyright © 2016年 jiangadam. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // button圆角
    self.loginButton.layer.cornerRadius = 4;
    self.loginButton.layer.masksToBounds = YES;
    
    // 设置动画
    CGPoint userCenter = self.userField.center;
    CGPoint pwdCenter = self.pwdField.center;
    
    userCenter.x -= 300;
    pwdCenter.x -= 300;
    
    // 设置位置到最左边
    self.userField.center = userCenter;
    self.pwdField.center = pwdCenter;
    
    // 还原位置
    userCenter.x += 300;
    pwdCenter.x += 300;
    // 动画
//    [UIView animateWithDuration:1 animations:^{
//        self.userField.center = userCenter;
//        self.pwdField.center = pwdCenter;
//    } completion:^(BOOL finished) {
//        self.loginButton.alpha = 1;
//    }];
    
    // easing动画
//    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        self.userField.center = userCenter;
//        self.pwdField.center = pwdCenter;
//    } completion:^(BOOL finished) {
//        self.loginButton.alpha = 1;
//    }];
    
    // easing 动画最终版
    // animateWithDuration 动画执行时间
    // delay 动画延迟多久执行
    // options 动画方式
    // animations 动画具体代码
    // completion 动画完成执行的代码，没有写nil
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.userField.center = userCenter;
        [UIView animateWithDuration:0.5 delay:0.3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.pwdField.center = pwdCenter;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                self.loginButton.alpha = 1;
            }];
        }];
    } completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
