//
//  MusicNavigation.m
//  music
//
//  Created by 郑业强 on 2018/9/28.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MusicNavigation.h"

#pragma mark - 声明
@interface MusicNavigation()

@property (weak, nonatomic) IBOutlet UIView *backBtn;
@property (weak, nonatomic) IBOutlet UIView *listBtn;

@end

#pragma mark - 实现
@implementation MusicNavigation

- (void)initUI {
    
}
- (IBAction)leftTap:(UITapGestureRecognizer *)sender {
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)rightTap:(UITapGestureRecognizer *)sender {
    
}

@end
