//
//  DCPopView.m
//  引导页提示
//
//  Created by 大橙子 on 2018/8/8.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import "DCPopView.h"

@interface DCPopView ()

@property(nonatomic,strong)UIView *view;
@property(nonatomic,strong)UILabel *contentLab;
@property(nonatomic,copy)NSString *contentStr;
@property(nonatomic,copy)NSString *image;
@property(nonatomic,strong)UIImageView *arrowImgV;
@property (nonatomic,strong) UIView *backgroundView;
@end
@implementation DCPopView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

-(instancetype)initWithAlertContentString:(NSString *)contentStr withImage:(NSString *)image withSpecificUI:(UIView *)view
{
    if (self = [super init]) {
        self.view = view;
        self.contentStr = contentStr;
        self.image = image;
        
        [self setUpMainView];
    }
    return self;
}

-(void)setUpMainView
{
    self.backgroundView = [[UIView alloc]init];
    self.backgroundView.backgroundColor = [UIColor lightGrayColor];
    self.backgroundView.alpha = 0.3;
    UITapGestureRecognizer *tapBackgroundView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapBackgroundView)];
    [self.backgroundView addGestureRecognizer:tapBackgroundView];
    self.backgroundView.userInteractionEnabled = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:self.backgroundView];
    
    self.arrowImgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.image]];
    [[UIApplication sharedApplication].keyWindow addSubview:self.arrowImgV];
    
    self.contentLab = [[UILabel alloc]init];
    self.contentLab.text = self.contentStr;
    self.contentLab.numberOfLines = 0;
    self.contentLab.textAlignment = NSTextAlignmentCenter;
    self.contentLab.font = [UIFont systemFontOfSize:14];
    self.contentLab.textColor = [UIColor whiteColor];
    [self.arrowImgV addSubview:self.contentLab];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundView.frame = [UIScreen mainScreen].bounds;
    
    CGSize contentMaxSize = CGSizeMake(100, CGFLOAT_MAX);
    NSDictionary *contentDic = @{NSFontAttributeName:[UIFont systemFontOfSize:16]};
    CGSize contentSize = [self.contentStr boundingRectWithSize:contentMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:contentDic context:nil].size;
    self.arrowImgV.size = CGSizeMake(contentSize.width + 30, contentSize.height + 30);
    
    if (self.view.frame.origin.x < [UIScreen mainScreen].bounds.size.width * 0.5) {
        if (self.direction == BOTTOM) {
            _arrowImgV.x = self.view.centerX + self.view.width/2 - self.arrowImgV.width;
        }else if (self.direction == TOP){
            _arrowImgV.x = self.view.x + self.view.width/4;
        }
    } else {
        _arrowImgV.x = self.view.centerX + self.view.width/3 - self.arrowImgV.width;
    }
    if (self.direction == BOTTOM) {
        self.arrowImgV.y = CGRectGetMaxY(self.view.frame)+5;
    }else if (self.direction == TOP){
        self.arrowImgV.y = CGRectGetMaxY(self.view.frame)- self.view.height - self.arrowImgV.height - 5;
    }
    
    self.contentLab.frame = CGRectMake(5, 10, self.arrowImgV.width - 10, self.arrowImgV.height - 20);
}
-(void)tapBackgroundView
{
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        weakself.arrowImgV.transform = CGAffineTransformMakeScale(0.01, 0.01);
    } completion:^(BOOL finished) {
        [weakself.contentLab removeFromSuperview];
        [weakself.arrowImgV removeFromSuperview];
        [weakself.backgroundView removeFromSuperview];
        if (weakself.block) {
            weakself.block();
        }
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
