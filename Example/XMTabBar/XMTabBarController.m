//
//  XMTabBarController.m
//  XMTabBar_Example
//
//  Created by 刘灿 on 2019/5/6.
//  Copyright © 2019 ixmwl. All rights reserved.
//

#import "XMTabBarController.h"
#import "XMTabBar.h"
#import "XMTabBarItem.h"
#define UITabBarItemNomalStatus(color,font) [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:color,NSFontAttributeName:font} forState:UIControlStateNormal];

#define UITabBarItemSelectedStatus(color,font) [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:color,NSFontAttributeName:font} forState:UIControlStateSelected];
@interface XMTabBarController ()<XMTabBarDelegate>
@property(nonatomic,strong) XMTabBar *xmTabBar;
@end

@implementation XMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    XMTabBar *xmTabBar = [[XMTabBar alloc] initWithFrame:self.tabBar.frame
                                           animationType:XMTabBarAnimationTypeRoll];
    xmTabBar.xmdelegate = self;
    [self setValue:xmTabBar forKeyPath:@"tabBar"];
    self.xmTabBar= xmTabBar;
    [self initTabBarViewControllers];
}
- (void)initTabBarViewControllers{
    
    // tab组装
    UIViewController *home  = [[UIViewController alloc] init];
    
    UIViewController *melon = [[UIViewController alloc] init];
    UIViewController *mine  = [[UIViewController alloc] init];
    NSMutableArray *tabBarViewConrtrollers = [NSMutableArray new];
    for (UIViewController *viewController in @[home,melon,mine]) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
        [tabBarViewConrtrollers addObject:nav];
    }
    UITabBarItemNomalStatus([UIColor grayColor], [UIFont systemFontOfSize:14]);
    UITabBarItemSelectedStatus([UIColor redColor], [UIFont systemFontOfSize:14]);
    self.viewControllers = tabBarViewConrtrollers;
    
    
    
    XMTabBarItem *one1=[[XMTabBarItem alloc]initWithTitle:@"首页"
                                                    image:[UIImage imageNamed:@"home_tabbar_night"]
                                            selectedImage:[UIImage imageNamed:@"home_tabbar_press"]];
    XMTabBarItem *one2=[[XMTabBarItem alloc]initWithTitle:@"视频"
                                                    image:[UIImage imageNamed:@"video_tabbar_night"]
                                            selectedImage:[UIImage imageNamed:@"video_tabbar_press"]];
    XMTabBarItem *one3=[[XMTabBarItem alloc]initWithTitle:@"我的"
                                                    image:[UIImage imageNamed:@"weitoutiao_tabbar_night"]
                                            selectedImage:[UIImage imageNamed:@"weitoutiao_tabbar_press"]];
    
    self.xmTabBar.tabItems = @[one1,one2,one3];
    
    
}

-(void)didSelectedItem:(NSInteger)index{
    self.selectedViewController = self.viewControllers[index];
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
