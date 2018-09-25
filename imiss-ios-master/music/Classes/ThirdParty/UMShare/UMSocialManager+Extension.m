//
//  UMSocialManager+Extension.m
//  imiss
//
//  Created by 郑业强 on 2018/9/16.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "UMSocialManager+Extension.h"

@implementation UMSocialManager (Extension)

+ (void)shareUrl:(UMSocialPlatformType)platformType
             url:(NSString *)url
           title:(NSString *)title
            desc:(NSString *)desc
      thumbImage:(UIImage *)thumbImage
         success:(KKShareSuccessBlock)successBlock
           error:(KKShareErrorBlock)errorBlock {
    
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    [messageObject setShareObject:({
        UMShareWebpageObject *shareObject = [[UMShareWebpageObject alloc] init];
        [shareObject setTitle:title];
        [shareObject setDescr:desc];
        [shareObject setThumbImage:thumbImage];
        [shareObject setWebpageUrl:url];
        shareObject;
    })];
    
    // 调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
        if (error) {
            if (errorBlock) {
                errorBlock(error.code);
            }
        } else {
            if (successBlock) {
                successBlock();
            }
        }
    }];
}

+ (void)shareImage:(UMSocialPlatformType)platformType controller:(UIViewController *)vc thumb:(id)thumb image:(id)image {
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    [messageObject setShareObject:({
        UMShareWebpageObject *shareObject = [[UMShareWebpageObject alloc] init];
        [shareObject setTitle:@"asdad"];
        [shareObject setDescr:@"asdasdassdasdasadsasad"];
        [shareObject setThumbImage:thumb];
        [shareObject setWebpageUrl:@"http://www.baidu.com"];
        shareObject;
    })];
    
    // 调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:vc completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"error");
        } else {
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            } else {
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
    }];
}



@end
