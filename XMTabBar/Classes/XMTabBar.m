//
//  XMTabBar.m
//  XMNewsProject
//
//  Created by 刘灿 on 2019/4/30.
//  Copyright © 2019 LC. All rights reserved.
//

#import "XMTabBar.h"
#import "XMTabBarItem.h"
#define kRandomColor [UIColor colorWithRed:arc4random() % 256/255.0 green:arc4random() % 256/255.0 blue:arc4random() % 256/255.0 alpha:1]
@interface XMTabBar ()
@property (nonatomic, assign) XMTabBarAnimationType animationType;
@property (nonatomic, strong) CAEmitterLayer *explosionLayer;
@property (nonatomic, strong) CAEmitterCell *explosionCell;
@end

@implementation XMTabBar
-(instancetype)initWithFrame:(CGRect)frame animationType:(XMTabBarAnimationType)animationType{
    if(self=[super initWithFrame:frame])
    {
        self.translucent=NO;
        self.barTintColor=[UIColor colorWithRed:0.98 green:0.98 blue:0.97 alpha:1];
        self.animationType = animationType;
       
        //  [self addSubview:self.topFengImg];
    }
    return self;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self setupTabBarItems];
}

-(void)setTabItems:(NSArray *)tabItems{
    _selectedIndex=1000;
    _tabItems=tabItems;
    [self clearView];
    for (int i=0; i<tabItems.count; i++) {
        XMTabBarItem *barItem=tabItems[i];
        barItem.animationType = self.animationType;
        barItem.tag=i+1000;
        [barItem addTarget:self action:@selector(onClickItem:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:barItem];
//        barItem.backgroundColor = kRandomColor;
        [self bringSubviewToFront:barItem];
    }
    [self setSelectedIndex:_selectedIndex];
}
-(void)clearView{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

-(void)onClickItem:(XMTabBarItem*)sender{
    if([self.xmdelegate respondsToSelector:@selector(didSelectedItem:)])
    {
        [self.xmdelegate didSelectedItem:sender.tag-1000];
    }
    self.selectedIndex = sender.tag;
}

-(void)setSelectedIndex:(NSInteger)selectedIndex{
    
    XMTabBarItem *barItemOldSelect=(XMTabBarItem *)[self viewWithTag:_selectedIndex];
    barItemOldSelect.itemSelected=NO;

    XMTabBarItem *barItemNewSelect=(XMTabBarItem *)[self viewWithTag:selectedIndex];
    barItemNewSelect.itemSelected=YES;
    _selectedIndex=selectedIndex;
    
}




- (void)setupTabBarItems
{
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    
    int count = (int)self.tabItems.count;
    CGFloat itemY = 0;
    CGFloat itemW = w / count;
    CGFloat itemH = h;
    
    for (int index = 0; index < count; index++) {
        
        XMTabBarItem *tabBarItem = self.tabItems[index];
        CGFloat itemX = index * itemW;
        tabBarItem.frame = CGRectMake(itemX, itemY, itemW, itemH);
        
    }
}




#pragma mark - 重写系统方法,去掉系统TabBar

- (NSArray<UITabBarItem *> *)items {
    return @[];
}
- (void)setItems:(NSArray<UITabBarItem *> *)items {
}
- (void)setItems:(NSArray<UITabBarItem *> *)items animated:(BOOL)animated {
}

@end
