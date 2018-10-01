//
//  SongRealmModel.h
//  imiss
//
//  Created by 郑业强 on 2018/9/15.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Realm/Realm.h>

@interface SongRealmModel : RLMObject

@property NSString *ID;
@property NSString *album_id;
@property NSString *img;
@property BOOL isRecommend;
@property NSString *list_id;
@property NSString *name;
@property NSString *singer_id;
@property NSString *small_img;

@end

RLM_ARRAY_TYPE(SongRealmModel)
