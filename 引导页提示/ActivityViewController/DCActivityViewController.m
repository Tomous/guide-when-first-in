/**
 * ━━━━━━大橙子踏神兽而来━━━━━━
 * 　　　┏┓　　　┏┓
 * 　　┏┛┻━━━┛┻┓
 * 　　┃　　　　　　　┃
 * 　　┃　　　━　　　┃
 * 　　┃　┳┛　┗┳　┃
 * 　　┃　　　　　　　┃
 * 　　┃　　　┻　　　┃
 * 　　┃　　　　　　　┃
 * 　　┗━┓　　　┏━┛Code is far away from bug with the animal protecting
 * 　　　　┃　　　┃    神兽保佑,代码无bug
 * 　　　　┃　　　┃
 * 　　　　┃　　　┗━━━┓
 * 　　　　┃　　　　　　　┣┓
 * 　　　　┃　　　　　　　┏┛
 * 　　　　┗┓┓┏━┳┓┏┛
 * 　　　　　┃┫┫　┃┫┫
 * 　　　　　┗┻┛　┗┻┛
 *
 * ━━━━━━感觉萌萌哒━━━━━━
 */

#import "DCActivityViewController.h"
#import "DCGuideViewController.h"
@interface DCActivityViewController ()

@end

@implementation DCActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"activity";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self checkAndStartTutorial];
}
-(void) checkAndStartTutorial {
    
    //需要调用启动页startCode+1
        NSString* startCode = @"4";
        //传nil就是取值，否则就是赋值
        NSString * AppFirstLoad =  UserNameDefault(nil, @"AppFirstLoad", @"AppFirstLoad");
        if ([AppFirstLoad isEqual:[NSNull null]]||!AppFirstLoad||![AppFirstLoad isEqualToString:startCode]){
            
            DCGuideViewController* vc = [[DCGuideViewController alloc] init];
            [self presentViewController:vc animated:NO completion:nil];
    
            UserNameDefault(startCode, @"AppFirstLoad", @"AppFirstLoad");
        }
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
