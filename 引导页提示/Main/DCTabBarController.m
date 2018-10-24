//
//  DCTabBarController.m
//  引导页提示
//
//  Created by 大橙子 on 2018/8/6.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import "DCTabBarController.h"
#import "DCHomeViewController.h"
#import "DCActivityViewController.h"
#import "DCMineViewController.h"


// ios7
#define iOS7 ([UIDevice currentDevice].systemVersion.doubleValue >= 7.0)
@interface DCTabBarController ()

@end

@implementation DCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpMainVC];
}
-(void)setUpMainVC
{
    DCHomeViewController *mainController = [[DCHomeViewController alloc]init];
    [self addChildViewController:mainController title:@"首页" imageName:@"course_normal" selImageName:@"course_click"];
    
    DCActivityViewController *resourse = [[DCActivityViewController alloc]init];
    [self addChildViewController:resourse title:@"活动" imageName:@"activity_normal" selImageName:@"activity_click"];
    
    DCMineViewController *activity = [[DCMineViewController alloc]init];
    [self addChildViewController:activity title:@"我的" imageName:@"积分切图_people_normal" selImageName:@"积分切图_people_click"];
   
    UITabBarItem *item = [UITabBarItem appearance];
    NSMutableDictionary *norAtt = [NSMutableDictionary dictionary];
    norAtt[NSForegroundColorAttributeName] = DCColor(50, 50, 50);
    [item setTitleTextAttributes:norAtt forState:UIControlStateNormal];
    
    NSMutableDictionary *selAtt = [NSMutableDictionary dictionary];
    selAtt[NSForegroundColorAttributeName] = DCColor(234, 89, 71);
    [item setTitleTextAttributes:selAtt forState:UIControlStateSelected];
}
-(void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selImageName:(NSString *)selImageName
{
    childController.title = title;
    UIImage *selImage = [UIImage imageNamed:selImageName];
    if (iOS7) {
        selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    UIImage *image = [UIImage imageNamed:imageName];
    [childController.tabBarItem setImage:image];
    [childController.tabBarItem setSelectedImage:selImage];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:childController];
    [self addChildViewController:navigationController];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
