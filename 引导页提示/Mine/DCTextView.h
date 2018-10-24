//
//  DCTextView.h
//  引导页提示
//
//  Created by 大橙子 on 2018/8/10.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^block)(NSInteger number);
@interface DCTextView : UIView

@property (nonatomic,copy) block block;
@end
