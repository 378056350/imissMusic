//
//  RLMObject+Extension.h
//  imiss
//
//  Created by MAC on 2018/9/14.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Realm/Realm.h>

@interface RLMObject (Extension)

@property (nonatomic, strong) NSDictionary *classInArray;
@property (nonatomic, strong) NSDictionary *replaceInArray;

// 解析
+ (__kindof RLMObject *)kk_objectWithKeyValues:(NSDictionary *)param;

// 模型转字典
- (NSMutableDictionary *)kk_keyValues;
// 模型数组 -> 字典数组
- (NSMutableArray *)kk_keyValuesArrayWithObjectArray:(NSArray *)objectArray;

// 字典转模型
- (RLMObject *)kk_objectWithKeyValues:(NSDictionary *)param;

@end
