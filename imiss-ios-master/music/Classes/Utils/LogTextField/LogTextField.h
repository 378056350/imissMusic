/**
 * 登录界面的输入框
 */

#import <UIKit/UIKit.h>

@interface LogTextField : BaseView

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, assign) BOOL hiddenPhone;

@end
