//
//  AFNManager.h
//  imiss
//
//  Created by 郑业强 on 2018/8/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - typeof
typedef void(^ServiceCompleteBlock)(APPResult *result);
typedef void(^ProgressNetWorkBlock)(CGFloat currentProgress, CGFloat maxProgress, CGFloat percentage);

#pragma mark - 声明
@interface AFNManager : NSObject

+ (void)GET:(NSString *)url params:(NSDictionary *)params complete:(ServiceCompleteBlock)complete;
+ (void)GET:(NSString *)url params:(NSDictionary *)params progress:(ProgressNetWorkBlock)progress complete:(ServiceCompleteBlock)complete;

+ (void)POST:(NSString *)url params:(NSDictionary *)params complete:(ServiceCompleteBlock)complete;
+ (void)POST:(NSString *)url params:(NSDictionary *)params progress:(ProgressNetWorkBlock)progress complete:(ServiceCompleteBlock)complete;

+ (void)POST:(NSString *)url params:(NSDictionary *)params andImages:(NSArray<UIImage *> *)images progress:(ProgressNetWorkBlock)progress complete:(ServiceCompleteBlock)complete;

@end
