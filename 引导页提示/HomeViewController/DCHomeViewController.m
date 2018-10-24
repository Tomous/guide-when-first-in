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

#import "DCHomeViewController.h"
#import "DCPopView.h"
@interface DCHomeViewController ()

@property (nonatomic,strong) UILabel *firstView;
@property (nonatomic,strong) UILabel *secondView;
@property (nonatomic,strong) UILabel *thirdView;
@property (nonatomic,strong) UILabel *forthView;
@property (nonatomic,strong) UILabel *fiveView;

@property (nonatomic, assign) BOOL firstIn;

@end

@implementation DCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"home";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpMainView];
    
    [self judgeIfIsFirstLogin];

}

-(void)setUpMainView
{
    self.firstView = [self getLabelWithFrame:CGRectMake(60, 100, 80, 40) Text:@"1"];
    [self.view addSubview:self.firstView];
    
    self.secondView = [self getLabelWithFrame:CGRectMake(SCREEN_WIDTH - 100, 100, 80, 40) Text:@"2"];
    [self.view addSubview:self.secondView];
    
    self.thirdView = [self getLabelWithFrame:CGRectMake(60, SCREEN_HEIGHT - 120, 80, 40) Text:@"3"];
    [self.view addSubview:self.thirdView];
    
    self.forthView = [self getLabelWithFrame:CGRectMake(SCREEN_WIDTH - 100, SCREEN_HEIGHT - 120, 80, 40) Text:@"4"];
    [self.view addSubview:self.forthView];
    
    self.fiveView = [self getLabelWithFrame:CGRectMake((SCREEN_WIDTH - 80)/2, (SCREEN_HEIGHT - 40)/2, 80, 40) Text:@"5"];
    [self.view addSubview:self.fiveView];
    
}

-(void)judgeIfIsFirstLogin
{
    if(!self.firstIn) {
        self.firstIn = YES;

        NSNumber* version = UserDefault(nil, @"HomeViewController_guide_setup1");
        int currentVersion = 1;
        if (version == nil || version.intValue < currentVersion) {
            UserDefault([NSNumber numberWithInt:currentVersion], @"HomeViewController_guide_setup1");
            [self showRemind:1];
        }
    }
}

-(void) showRemind:(int)setup
{
    UIView* view;
    
    if (setup == 1) {
        view = self.firstView;
    }else if(setup == 2) {
        view = self.secondView;
    }else if(setup ==3) {
        view = self.thirdView;
    }else if (setup == 4){
        view = self.forthView;
    }else if (setup == 5){
        view = self.fiveView;
    }else{
        return;
    }
    NSString* content;
    NSString* imageStr;
    switch (setup) {
        case 1:
            content = @"1、点击这里加班你想干嘛😀";
            imageStr = @"rem_01";
            break;
            
        case 2:
            content = @"2、点击这里加班你想干嘛😂";
            imageStr = @"rem_01";
            break;
            
        case 3:
            content = @"3、点击这里加班你想干嘛😋";
            imageStr = @"rem_05";
            break;
        case 4:
            content = @"4、点击这里加班你想干嘛🙄";
            imageStr = @"rem_03";
            break;
        case 5:
            content = @"5、点击这里加班你想干嘛😊";
            imageStr = @"rem_01";
            break;
        default:
            break;
    }
    
    DCPopView *popView = [[DCPopView alloc] initWithAlertContentString:content withImage:imageStr withSpecificUI:view];
    
    if (setup == 1 || setup == 2 || setup == 5) {
        popView.direction = BOTTOM;
    }else{
        popView.direction = TOP;
    }
    setup ++;
    __weak typeof(self) weakself = self;
    popView.block = ^{
        [weakself showRemind:setup];
    };
    [self.view addSubview:popView];
}



-(UILabel *)getLabelWithFrame:(CGRect)frame Text:(NSString *)text
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.backgroundColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = text;
    return label;
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
