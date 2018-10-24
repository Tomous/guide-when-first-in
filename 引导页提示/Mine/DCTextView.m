//
//  DCTextView.m
//  引导页提示
//
//  Created by 大橙子 on 2018/8/10.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import "DCTextView.h"

@interface DCTextView ()
@property (nonatomic,strong) UIButton *plusBtn;
@property (nonatomic,strong) UILabel *numLabel;
@property (nonatomic,strong) UIButton *subtractBtn;

@property (nonatomic,assign) NSInteger number;
@end
@implementation DCTextView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setUpMainView];
    }
    return self;
}
-(void)setUpMainView
{
    self.subtractBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.subtractBtn.backgroundColor = [UIColor blackColor];
    [self.subtractBtn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    self.subtractBtn.tag = 0;
    [self addSubview:self.subtractBtn];
    
    self.numLabel = [[UILabel alloc]init];
    self.numLabel.backgroundColor = [UIColor whiteColor];
    self.numLabel.textAlignment = NSTextAlignmentCenter;
    self.numLabel.text = @"0";
    [self addSubview:self.numLabel];
    
    self.plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.plusBtn.backgroundColor = [UIColor blackColor];
    [self.plusBtn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    self.plusBtn.tag = 1;
    [self addSubview:self.plusBtn];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.subtractBtn.frame = CGRectMake(0, 0, 50, self.height);
    self.numLabel.frame = CGRectMake(CGRectGetMaxX(self.subtractBtn.frame), 0, self.width-100, self.height);
    self.plusBtn.frame = CGRectMake(CGRectGetMaxX(self.numLabel.frame), 0, 50, self.height);
    
}
-(void)btnDidClick:(UIButton *)btn
{
    self.number = [self.numLabel.text integerValue];
    if (btn.tag == 0) {
        
        self.number --;
        self.numLabel.text = [NSString stringWithFormat:@"%ld",self.number<0?0:self.number];
    }else
    {
        self.number ++;
        self.numLabel.text = [NSString stringWithFormat:@"%ld",self.number];
    }
    if (self.block) {
        self.block(self.number<0?0:self.number);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
