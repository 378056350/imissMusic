//
//  RLMObject+Extension.m
//  imiss
//
//  Created by MAC on 2018/9/14.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "RLMObject+Extension.h"
#import <objc/runtime.h>

static NSString *classInArrayWithSetterGetterKey = @"classInArrayWithSetterGetterKey";
static NSString *replaceInArrayWithSetterGetterKey = @"replaceInArrayWithSetterGetterKey";

@implementation RLMObject (Extension)

// 解析
+ (__kindof RLMObject *)kk_objectWithKeyValues:(NSDictionary *)param {
    RLMObject *object = [[self alloc] init];
    [object kk_objectWithKeyValues:param];
    return object;
}

#pragma mark - 模型转字典
- (NSMutableDictionary *)kk_keyValues {
    NSMutableDictionary *propertyDic = [NSMutableDictionary dictionaryWithCapacity:0];
    unsigned int outCount;
    // 获取对象的属性列表
    objc_property_t *properties = class_copyPropertyList(NSClassFromString([[self class] className]), &outCount);
    for (int i=0; i<outCount; i++) {
        
        NSString *name = [NSString stringWithCString:property_getName(properties[i]) encoding:NSUTF8StringEncoding];
        id value = [self valueForKey:name];
        if (value) {
            // 判断是否是数组
            if ([value isKindOfClass:[RLMArray class]]) {
                // 模型数组转字典数组成
                [propertyDic setObject:[self kk_keyValuesArrayWithObjectArray:value] forKey:name];
            } else {
                [propertyDic setObject:value forKey:name];
            }
        }
    }
    free(properties);
    return propertyDic;
}

#pragma mark - 模型数组 -> 字典数组
- (NSMutableArray *)kk_keyValuesArrayWithObjectArray:(NSArray *)objectArray {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (RLMObject *obje in objectArray) {
        [array addObject:obje.kk_keyValues];
    }
    return array;
}

#pragma mark - 字典转模型
- (RLMObject *)kk_objectWithKeyValues:(NSDictionary *)param {
    // 获取对象的属性列表
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList(NSClassFromString([[self class] className]), &outCount);
    NSMutableArray *param_names = [[NSMutableArray alloc] init];
    for (int i=0; i<outCount; i++) {
        NSString *name = [NSString stringWithCString:property_getName(properties[i]) encoding:NSUTF8StringEncoding];
        [param_names addObject:name];
    }
    
    
    NSArray *allkeys = [param allKeys];
    for (int i=0; i<allkeys.count; i++) {
        NSString *key = allkeys[i];
        id value = [param valueForKey:key];
        if (value) {
            // 是数组
            if ([value isKindOfClass:[NSArray class]]) {
                // 数组个数不为0 && 对象有该属性
                if ([value count] != 0 && [param_names containsObject:key]) {
                    NSString *className = [self.classInArray valueForKey:key];
                    [self setValue:[self kk_objectArrayWithObjectArray:value className:className] forKey:key];
                }
            }
            // 不是数组
            else {
                // 是否是数字
                if ([value isKindOfClass:NSClassFromString(@"__NSCFNumber")]) {
                    value = [value description];
                    value = [NSString stringWithFormat:@"%@", value];
                }
                // 替换键值对
                if ([[self.replaceInArray allKeys] containsObject:key]) {
                    key = self.replaceInArray[key];
                }
                // 有数据 && 不为空 && 对象有该属性
                if (value && ![value isKindOfClass:[NSNull class]] && [param_names containsObject:key]) {
                    [self setValue:value forKey:key];
                }
            }
        }
    }
//    free(properties);
    return self;
}

#pragma mark - 字典数组 -> 模型数组
- (RLMArray *)kk_objectArrayWithObjectArray:(NSArray *)param className:(NSString *)className {
    RLMArray *array = [[RLMArray alloc] initWithObjectClassName:className];
    for (NSDictionary *dict in param) {
        Class cls = NSClassFromString(className);
        RLMObject *object = [[cls alloc] init];
        [array addObject:[object kk_objectWithKeyValues:dict]];
    }
    return array;
}

#pragma mark - set / get
- (void)setClassInArray:(NSDictionary *)classInArray {
    objc_setAssociatedObject(self, &classInArrayWithSetterGetterKey, classInArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSDictionary *)classInArray {
    return objc_getAssociatedObject(self, &classInArrayWithSetterGetterKey);
}

- (void)setReplaceInArray:(NSDictionary *)replaceInArray {
    objc_setAssociatedObject(self, &replaceInArrayWithSetterGetterKey, replaceInArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSDictionary *)replaceInArray {
    return objc_getAssociatedObject(self, &replaceInArrayWithSetterGetterKey);
}

@end



