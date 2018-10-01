//
//  ResourceModel.m
//  imiss
//
//  Created by MAC on 2018/9/13.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ResourceModel.h"

@implementation ResourceModel

+ (instancetype)mj_objectWithKeyValues:(id)keyValues {
    ResourceModel *model = [super mj_objectWithKeyValues:keyValues];
    // 数据
    model.datas = ({
        NSData *data;
        if (DEBUG) {
            data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"后来" ofType:@"lrc"]];
        }
        else {
            data = [NSData dataWithContentsOfURL:[NSURL URLWithString:KStatic(model.lrc)]];
        }
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSArray *datas = [str componentsSeparatedByString:@"\n"];
        datas;
    });
    // 歌词
    model.lrcs = ({
        NSMutableArray *lrcs = [[NSMutableArray alloc] init];
        for (NSString *data in model.datas) {
            if ([model isLrc:data]) {
                NSString *lrc = [model getLrcWithData:data];
                [lrcs addObject:lrc];
            }
        }
        lrcs;
    });
    // 时间
    model.times = ({
        NSMutableArray *times = [[NSMutableArray alloc] init];
        for (NSString *data in model.datas) {
            if ([model isLrc:data]) {
                NSString *time = [model getTimeWithData:data];
                [times addObject:time];
            }
        }
        times;
    });
    // 秒数
    model.seconds = ({
        NSMutableArray *seconds = [[NSMutableArray alloc] init];
        for (NSString *time in model.times) {
            CGFloat milli = [[time substringWithRange:NSMakeRange(7, 2)] integerValue];
            CGFloat second = [[time substringWithRange:NSMakeRange(4, 2)] integerValue];
            CGFloat minute = [[time substringWithRange:NSMakeRange(1, 2)] integerValue];
            NSTimeInterval sec = milli / 100.f + second + minute * 60;
            [seconds addObject:@(sec)];
        }
        seconds;
    });
    return model;
}

// 是否是歌词
- (BOOL)isLrc:(NSString *)data {
    if (data.length <= 9) {
        return NO;
    }
    
    NSString *zero = [data substringWithRange:NSMakeRange(0, 1)]; // [
    NSString *three = [data substringWithRange:NSMakeRange(3, 1)]; // :
    NSString *six = [data substringWithRange:NSMakeRange(6, 1)]; // .
    NSString *nine = [data substringWithRange:NSMakeRange(9, 1)]; // ]
    if (!zero ||
        !three ||
        !six ||
        !nine ||
        ![zero isEqualToString:@"["] ||
        ![three isEqualToString:@":"] ||
        ![six isEqualToString:@"."] ||
        ![nine isEqualToString:@"]"]) {
        return NO;
    }
    return YES;
}



// 时间字符串    time
// 秒数   second
// 歌词   lrc
// 行数   line


/// 获取时间字符串 通过 行数
- (NSString *)getTimeWithLine:(NSInteger)line {
    NSString *time;
    if (self.times.count <= line) {
        time = [self.times lastObject];
    }
    else {
        time = self.times[line];
    }
    NSString *timeStr = [time substringWithRange:NSMakeRange(1, 5)];
    return timeStr;
}
/// 获取时间字符串 通过 秒数
- (NSString *)getTimeWithSecond:(NSTimeInterval)sec {
    NSInteger line = [self getLineWithSecond:sec];
    return [self getTimeWithLine:line];
}
/// 获取时间字符串 通过 秒数
- (NSString *)getTimeWithData:(NSString *)data {
    NSString *time = [data substringWithRange:NSMakeRange(0, 10)];
    return time;
}
//
///// 获取秒数 通过 时间
//- (NSTimeInterval)getSecondWithTime {
//
//}
/// 获取秒数 通过 行数
- (NSTimeInterval)getSecondWithLine:(NSInteger)line {
    NSTimeInterval second = [self.seconds[line] doubleValue];
    return second;
}
//
///// 获取歌词 通过 时间字符串
//- (NSString *)getLrcWithTime {
//
//}
///// 获取歌词 通过 秒数
//- (NSString *)getLrcWithSecond {
//
//}
///// 获取歌词 通过 行数
//- (NSString *)getLrcWithLine {
//
//}
/// 获取歌词 通过 数据
- (NSString *)getLrcWithData:(NSString *)data {
    NSString *lrc = [data substringWithRange:NSMakeRange(10, data.length - 10)];
    return lrc;
}
//
///// 获取行数 通过 时间
//- (NSInteger)getLineWithTime {
//
//}
/// 获取行数 通过 秒数
- (NSInteger)getLineWithSecond:(NSTimeInterval)second {
    for (NSInteger i=self.seconds.count-1; i>=0; i--) {
        if (second >= [self.seconds[i] doubleValue]) {
            return i;
        }
    }
    return 0;
}

@end
