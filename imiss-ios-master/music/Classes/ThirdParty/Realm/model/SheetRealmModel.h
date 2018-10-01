//
//  SheetRealmModel.h
//  imiss
//
//  Created by 郑业强 on 2018/9/15.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Realm/Realm.h>

@interface SheetRealmModel : RLMObject

@property NSString *ID;
@property NSString *img;
@property NSString *name;
@property NSString *small_img;

@end

RLM_ARRAY_TYPE(SheetRealmModel)
