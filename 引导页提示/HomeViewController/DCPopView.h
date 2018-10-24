//
//  DCPopView.h
//  引导页提示
//
//  Created by 大橙子 on 2018/8/8.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^onDismiss)(void);

typedef enum : NSUInteger {
    TOP,
    BOTTOM,
} DIRECTION;
@interface DCPopView : UIView

@property (nonatomic,copy) onDismiss block;
@property(nonatomic, assign) DIRECTION direction;
- (instancetype)initWithAlertContentString:(NSString *)contentStr withImage:(NSString *)image withSpecificUI:(UIView *)view;
@end
