//
//  NSString+Extension.m
//  iOS
//
//  Created by RY on 2018/3/20.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (CGSize)sizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font {
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil].size;
}
- (CGSize)sizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font lineHeight:(CGFloat)lineHeight {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineHeight];
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle} context:nil].size;
}



// 中文转拼音
+ (NSString *)transform:(NSString *)chinese {
    //将NSString装换成NSMutableString
    NSMutableString *pinyin = [chinese mutableCopy];
    
    //将汉字转换为拼音(带音标)
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    //    NSLog(@"%@", pinyin);
    
    //去掉拼音的音标
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    //    NSLog(@"%@", pinyin);
    
    //返回最近结果
    return pinyin;
    
}
// 1000 转 1k
+ (NSString *)getMeasureThousand:(NSInteger)math {
    if (math / 1000 != 0) {
        return [NSString stringWithFormat:@"%ldk", math / 1000];
    }
    return [@(math) description];
}

@end
