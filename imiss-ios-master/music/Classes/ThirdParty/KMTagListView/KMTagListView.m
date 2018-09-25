//
//  KMTagListView.m
//  KMTag
//
//  Created by chavez on 2017/7/13.
//  Copyright © 2017年 chavez. All rights reserved.
//

#import "KMTagListView.h"
#import "KMTag.h"

@interface KMTagListView ()

@property (nonatomic,strong)NSMutableArray *tags;


@end

@implementation KMTagListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bounces = NO;
        self.pagingEnabled = YES;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (NSMutableArray *)tags {
    if (_tags == nil) {
        _tags = [NSMutableArray array];
    }
    return _tags;
}


- (void)setupSubViewsWithTitles:(NSArray *)titles {
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.tags removeAllObjects];
    
    for (NSInteger i = 0; i < titles.count; i++) {
        KMTag *tag = [[KMTag alloc] initWithFrame:CGRectZero];
        [tag setupWithText:titles[i]];
        [self addSubview:tag];
        [self.tags addObject:tag];
        // 添加手势
        tag.tag = i;
        UITapGestureRecognizer *pan = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectTagClick:)];
        [tag addGestureRecognizer:pan];
        tag.userInteractionEnabled = YES;
    }
    
    [self setupAllSubViews];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [self setupAllSubViews];
}


- (void)selectTagClick:(UIPanGestureRecognizer *)pan {
    KMTag *tag = (KMTag *)pan.view;

    if ([self.delegate_ respondsToSelector:@selector(ptl_TagListView:didSelectTagViewAtIndex:selectContent:)]) {
        [self.delegate_ ptl_TagListView:self didSelectTagViewAtIndex:tag.tag selectContent:tag.text];
    }
}



- (void)setupAllSubViews {
    

    CGFloat marginX = countcoordinatesX(10);
    CGFloat marginY = countcoordinatesY(5);
    
    __block CGFloat x = 0;
    __block CGFloat y = 10;
    
    [self.tags enumerateObjectsUsingBlock:^(KMTag *obj, NSUInteger idx, BOOL * _Nonnull stop) {
    
        
        CGFloat height = CGRectGetHeight(obj.frame);

        if (idx == 0) {
            x = marginX;
        }else {
            x = CGRectGetMaxX([self.tags[idx - 1] frame]) + marginX;
            if ( x + CGRectGetWidth(obj.frame) + marginX > CGRectGetWidth(self.frame) ) {
                x = marginX;
                y += height;
                y += marginY;
            }
        }
        CGRect frame = obj.frame;
        frame.origin = CGPointMake(x, y);
        obj.frame = frame;
        
    }];
    
    // 如果只有一行，居中显示
    if (y == 10) {
        
        [self.tags enumerateObjectsUsingBlock:^(KMTag *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            CGFloat height = CGRectGetHeight(obj.frame);
            y = CGRectGetHeight(self.frame) / 2 - height / 2.0;
            
            if (idx == 0) {
                x = marginX;
            }else {
                x = CGRectGetMaxX([self.tags[idx - 1] frame]) + marginX;
            }
            CGRect frame = obj.frame;
            frame.origin = CGPointMake(x, y);
            obj.frame = frame;
            
        }];
        
    }
    
    CGFloat contentHeight = CGRectGetMaxY([self.tags.lastObject frame]) + 10;
    if (contentHeight < CGRectGetHeight(self.frame)) {
        contentHeight = 0;
    }
    
    self.contentSize = CGSizeMake(0, contentHeight);
}



@end
