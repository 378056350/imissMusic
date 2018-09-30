//
//  AFNManager.m
//  imiss
//
//  Created by 郑业强 on 2018/8/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "AFNManager.h"
#import <AFNetworking/AFNetworking.h>

#pragma mark - 实现
@implementation AFNManager

static AFHTTPSessionManager *_manager;

+ (AFHTTPSessionManager *)manager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [AFHTTPSessionManager manager];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
    });
    return _manager;
}
+ (void)GET:(NSString *)url params:(NSDictionary *)params complete:(ServiceCompleteBlock)complete {
    [self GET:url params:params progress:nil complete:complete];
}
+ (void)GET:(NSString *)url params:(NSDictionary *)params progress:(ProgressNetWorkBlock)progress complete:(ServiceCompleteBlock)complete {
    AFHTTPSessionManager *manager = [self manager];
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress) {
            progress(downloadProgress.completedUnitCount, downloadProgress.totalUnitCount, downloadProgress.fractionCompleted);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (complete) {
            APPResult *result = [APPResult mj_objectWithKeyValues:responseObject];
            complete(result);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull err) {
        if (complete) {
            APPResult *result = [[APPResult alloc] init];
            result.data = nil;
            result.result = ServiceTypeNetwork;
            result.status = ServiceStatusSuccess;
            result.message = @"请求失败";
            complete(result);
        }
    }];
}


+ (void)POST:(NSString *)url params:(NSDictionary *)params complete:(ServiceCompleteBlock)complete {
    [self POST:url params:params progress:nil complete:complete];
}
+ (void)POST:(NSString *)url params:(NSDictionary *)params progress:(ProgressNetWorkBlock)progress complete:(ServiceCompleteBlock)complete {
    AFHTTPSessionManager *manager = [self manager];
    // 请求
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress.completedUnitCount, uploadProgress.totalUnitCount, uploadProgress.fractionCompleted);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (complete) {
            APPResult *result = [APPResult mj_objectWithKeyValues:responseObject];
            complete(result);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (complete) {
            APPResult *result = [[APPResult alloc] init];
            result.data = nil;
            result.result = ServiceTypeNetwork;
            result.status = ServiceStatusSuccess;
            result.message = @"请求失败";
            complete(result);
        }
    }];
}

//+ (void)POST:(NSString *)url params:(NSDictionary *)params progress:(ProgressNetWorkBlock)progress complete:(ServiceCompleteBlock)complete {
//    AFHTTPSessionManager *manager = [self manager];
//    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
//        if (progress) {
//            progress(uploadProgress.completedUnitCount, uploadProgress.totalUnitCount, uploadProgress.fractionCompleted);
//        }
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (complete) {
//            APPResult *result = [[APPResult alloc] init];
//            result.data = responseObject;
//            result.result = ServiceTypeSuccess;
//            complete(result);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (complete) {
//            APPResult *result = [[APPResult alloc] init];
//            result.data = nil;
//            result.result = ServiceTypeFail;
//            complete(result);
//        }
//    }];
//}
+ (void)POST:(NSString *)url params:(NSDictionary *)params andImages:(NSArray<UIImage *> *)images progress:(ProgressNetWorkBlock)progress complete:(ServiceCompleteBlock)complete {
    AFHTTPSessionManager *manager = [self manager];
    // 请求
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (images && [images count] > 0) {
            for (NSInteger index = 0; index < images.count; index++) {
                // 图片转数据
                NSData *data = UIImagePNGRepresentation(images[index]);
                if (data == nil) {
                    data = UIImageJPEGRepresentation(images[index], 1.0);
                }
                // 添加参数
                [formData appendPartWithFileData:data name:@"file" fileName:@"testImage" mimeType:@"image/png"];
            }
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress.completedUnitCount, uploadProgress.totalUnitCount, uploadProgress.fractionCompleted);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (complete) {
            APPResult *result = [[APPResult alloc] init];
            result.data = responseObject;
            result.result = ServiceStatusSuccess;
            complete(result);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (complete) {
            APPResult *result = [[APPResult alloc] init];
            result.data = nil;
            result.result = ServiceStatusFail;
            complete(result);
        }
    }];
}

@end
