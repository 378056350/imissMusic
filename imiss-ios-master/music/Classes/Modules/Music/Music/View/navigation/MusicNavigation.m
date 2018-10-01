//
//  MusicNavigation.m
//  music
//
//  Created by 郑业强 on 2018/9/28.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MusicNavigation.h"
#import "MusicController.h"

#pragma mark - 声明
@interface MusicNavigation()

@property (weak, nonatomic) IBOutlet UIView *backBtn;
@property (weak, nonatomic) IBOutlet UIView *listBtn;

@end

#pragma mark - 实现
@implementation MusicNavigation

- (void)initUI {
    self.allowNight = YES;
}
- (IBAction)leftTap:(UITapGestureRecognizer *)sender {
    MusicController *vc = (MusicController *)self.viewController;
    [vc showCD:YES duation:0.2f completion:^(BOOL finished) {
        [self.viewController.navigationController popViewControllerAnimated:YES];
    }];
    
}
- (IBAction)rightTap:(UITapGestureRecognizer *)sender {
    
}

@end
