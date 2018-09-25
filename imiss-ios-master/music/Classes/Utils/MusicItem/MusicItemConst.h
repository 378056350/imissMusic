//
//  MusicItemConst.h
//  imiss
//
//  Created by 郑业强 on 2018/9/1.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - const
// 开始播放
UIKIT_EXTERN NSString *const MusicItemStartMusic;
// 停止播放
UIKIT_EXTERN NSString *const MusicItemEndMusic;
// 添加音乐
UIKIT_EXTERN NSString *const MusicItemAddMusic;
// 删除音乐
UIKIT_EXTERN NSString *const MusicItemRemoveMusic;

#pragma mark - 声明
@interface MusicItemConst : NSObject
SingleInterface(MusicItemConst)

// 是否在播放
@property (nonatomic, assign, getter=isPlaying) BOOL playing;
// 是否有歌曲
@property (nonatomic, assign) BOOL hasSong;

@end
