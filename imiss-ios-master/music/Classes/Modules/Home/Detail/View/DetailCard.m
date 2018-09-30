//
//  DetailCard.m
//  music
//
//  Created by zhongke on 2018/9/29.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DetailCard.h"

#pragma mark - 声明
@interface DetailCard()

@end

#pragma mark - 实现
@implementation DetailCard

- (void)initUI {
    self.iconImg.alpha = 0;
    self.nameLab.font = [UIFont systemFontOfSize:AdjustFont(14)];
    self.nameLab.textColor = kColor_Text_Black;
    self.nameLab.alpha = 0;
    self.detailLab.font = [UIFont systemFontOfSize:AdjustFont(14)];
    self.detailLab.textColor = kColor_Text_Gary;
    self.detailLab.alpha = 0;
    self.contentDescLab.font = [UIFont systemFontOfSize:AdjustFont(14)];
    self.contentDescLab.textColor = kColor_Text_Black;
    self.contentDescLab.alpha = 0;
    self.contentLab.font = [UIFont systemFontOfSize:AdjustFont(14)];
    self.contentLab.textColor = kColor_Text_Gary;
    self.contentLab.alpha = 0;
    
    
    NSString *strm = @"“感恩之心，幻化成蝶”雅而不失原本滋色，其实这八个字传递的是一种高度，人生在世因为懂得感恩，所以不再抱怨生活艰辛，因为懂得感恩，所以不去计较过多的利益得失，因为懂得感恩，所以不再在乎快乐或是悲伤，伤或不伤的这段过程本身就是一种幸福。曾看过这样一段话，其出自哈佛大学图书馆馆训：“你所浪费的今天，是昨天死去的人奢望的明天。你所厌恶的现在，是未来的你回不去的曾经。”自己就算再不堪，你还拥有大把的生命去挥霍，你还可以尽情享受生活，张开双手拥抱明早初生的太阳。感恩生命，活着就是最宝贵的拥有。\n感恩生活说到感恩，首先对自己说上一句谢谢，谢谢你始终默默坚守，谢谢你无论越过多少沟壑，通往前方的路是曲折是坎坷你都从未放弃行走。英国作家萨克雷说：“生活就是一面镜子，你笑，它也笑；你哭，它也哭。”\n“人有悲欢离合，月有阴晴圆缺。”就如同这诗句一般，人生在世，不如意事十有八九。难过、失落、彷徨注定贯穿在我们的生命线中的，若你过度在意、纠结那你就会始终陷入困顿的沼泽再无法自拔。没有一帆风顺的人生，有的只是内心的波澜不惊，从容不迫。如你抱怨，那你看到的世界处处不顺心意。你若感恩，很多事便化作是过眼烟云。内心保持一份安宁是我们对生命最好的感谢。\n生活中的幸事教会你微笑、自信。顺境是心情，逆境是心态，更是眼界和格局。\n生活中的各种坎坷教会了你成长。以积极心态勇敢的面对生活中那些困顿的人更坚强、更懂得挑战和突破自我，从而实现生命的价值，让生命不虚度。\n“塞翁失马，焉知非福”、“祸兮，福之所倚，福兮，祸之所伏。”不执着问题表象，保持头脑的清醒，静看人生，那么得失也亦不必在短时间内拍下定论，问题中或许还潜藏着陷阱和转机。 古诗中说：“山穷水尽疑无路，柳暗花明又一村。”\n日常生活当中，许多人经常以个人的利益得失来衡量事情的好坏，有些人每天都为蝇头小利或喜或忧。然由于人们看到的只是事情表象，得到未必是福，失去也不一定是祸。“物极必反，否极泰来。”没有挫折就不会有智慧，没有付出就难以有收获。\n一失败就是一次假期，乐观豁达之人都懂得享受假期而不会怨天尤人，反而会利用这种机会休养好自己的身心，冷静的思考人生、总结经验，在假期过后重踏人生旅途时就会出现新的转机。即使是遇到了最坏的状况时，也应该看到人生处处隐藏着令人意想不到的机会，坦然面对人生中的挫折，百折不挠，就必能走向光明的彼岸。";
    
    self.contentLab.attributedText = ({
        
        
        NSAttributedString *attr = [[NSAttributedString alloc] initWithString:strm attributes:({
            NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
            style.lineSpacing = 5;
            NSDictionary *attributes = @{NSParagraphStyleAttributeName: style,
                                         NSFontAttributeName: [UIFont systemFontOfSize:AdjustFont(14)],
                                         NSForegroundColorAttributeName: kColor_Text_Gary
                                         };
            attributes;
        })];
        attr;
    });
    
    
    CGSize size = [strm sizeWithMaxSize:CGSizeMake(self.width - 30, MAXFLOAT) font:[UIFont systemFontOfSize:AdjustFont(14)] lineHeight:5];
    
    [self setClipsToBounds:YES];
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:5];
    [self.maskView.layer setMask:[self greenHeadMaskLayer]];
    [self.scroll addSubview:self.scrollContentView];
    [self.scroll setContentSize:CGSizeMake(0, CGRectGetMaxY(self.contentLab.frame) + 15)];
    [self.scroll setContentSize:CGSizeMake(0, self.contentLab.top + size.height + 30)];
    [self.scrollContentView setFrame:self.bounds];
}

- (CALayer *)greenHeadMaskLayer {
    CALayer *mask = [CALayer layer];
    mask.frame = self.contentLab.bounds;
    
    CAShapeLayer *maskLayerUp = [CAShapeLayer layer];
    maskLayerUp.fillColor = [UIColor greenColor].CGColor;
    maskLayerUp.path = [UIBezierPath bezierPathWithRect:self.contentLab.bounds].CGPath;
    maskLayerUp.opacity = 0.8f;
    
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[[UIColor redColor] colorWithAlphaComponent:1.0].CGColor,
                             (__bridge id)[[UIColor redColor] colorWithAlphaComponent:1.0].CGColor,
                             (__bridge id)[[UIColor redColor] colorWithAlphaComponent:0.0].CGColor];
    gradientLayer.locations = @[@0.0, @0.8, @1.0];
    gradientLayer.startPoint = CGPointMake(0.5, 0);
    gradientLayer.endPoint = CGPointMake(0.5, 1.0);
    gradientLayer.frame = CGRectMake(0, 0, self.maskView.width, self.maskView.height - 25);
    [mask addSublayer:gradientLayer];
    
    return mask;
}

#pragma mark - 动画
- (void)show {
    self.iconImg.top += 10;
    self.nameLab.top += 10;
    self.detailLab.top += 10;
    self.contentDescLab.top += 10;
    [UIView animateWithDuration:0.5f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.iconImg.alpha = 1;
        self.nameLab.alpha = 1;
        self.detailLab.alpha = 1;
        self.contentDescLab.alpha = 1;
        self.contentLab.alpha = 1;
        self.iconImg.top -= 10;
        self.nameLab.top -= 10;
        self.detailLab.top -= 10;
        self.contentDescLab.top -= 10;
    } completion:^(BOOL finished) {
        
    }];
    
    
    // 专辑 - 位置
    POPSpringAnimation *contentBasic = ({
        CGRect rect = self.contentLab.frame;
        self.contentLab.top += self.contentLab.height;
        POPSpringAnimation *basic = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
        basic.springSpeed = 1;
        basic.springBounciness = 1;
        basic.dynamicsTension = 50;
        basic.beginTime = CACurrentMediaTime();
        basic.toValue = @(CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect)));
        basic;
    });
    [self.contentLab pop_addAnimation:contentBasic forKey:@"contentBasic"];
    
    
}
- (void)hide {
    
}

@end
