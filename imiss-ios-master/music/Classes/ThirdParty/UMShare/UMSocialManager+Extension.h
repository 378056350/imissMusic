//
//  UMSocialManager+Extension.h
//  imiss
//
//  Created by 郑业强 on 2018/9/16.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UMShare/UMShare.h>
#import "KKShareContent.h"

@interface UMSocialManager (Extension)

+ (void)shareImage:(UMSocialPlatformType)platformType controller:(UIViewController *)vc thumb:(id)thumb image:(id)image;

+ (void)shareUrl:(UMSocialPlatformType)platformType
             url:(NSString *)url
           title:(NSString *)title
            desc:(NSString *)desc
      thumbImage:(UIImage *)thumbImage
         success:(KKShareSuccessBlock)successBlock
           error:(KKShareErrorBlock)errorBlock;

@end
