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

#import "DCGuideViewController.h"

@interface DCGuideViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pageControl;
@end

@implementation DCGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setUpScrollView];
    
    [self setUpPageControl];
    
    [self setUpImageView];
}
-(void)setUpScrollView
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.backgroundColor = [UIColor yellowColor];
    self.scrollView.userInteractionEnabled = YES;
    [self.scrollView setScrollEnabled:true];
    [self.scrollView setPagingEnabled:true];
    [self.scrollView setShowsHorizontalScrollIndicator:false];
    [self.scrollView setShowsVerticalScrollIndicator:false];
    [self.scrollView setBounces:false];
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH *4, SCREEN_HEIGHT);
}
-(void)setUpPageControl
{
    self.pageControl  = [[UIPageControl alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 50, SCREEN_HEIGHT - 50, 100, 20)];
    self.pageControl.numberOfPages = 4;
    [self.view addSubview:self.pageControl];
}
-(void)setUpImageView
{
    for (int i = 0; i < 4; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        imageView.userInteractionEnabled = YES;
        [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"guidepage%d",i]]];
        if (i == 3) {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
            btn.backgroundColor = [UIColor redColor];
            [btn addTarget:self action:@selector(btnDidClick) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:btn];
        }
        [self.scrollView addSubview:imageView ];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetWidth = self.scrollView.contentOffset.x;
    int pageNum = offsetWidth / [[UIScreen mainScreen] bounds].size.width;
    self.pageControl.currentPage = pageNum;
}
-(void)btnDidClick
{
    [self dismissViewControllerAnimated:NO completion:nil];
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
