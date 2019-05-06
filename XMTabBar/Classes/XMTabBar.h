//
//  XMTabBar.h
//  XMNewsProject
//
//  Created by 刘灿 on 2019/4/30.
//  Copyright © 2019 LC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XMTabBarAnimationType) {
    XMTabBarAnimationTypeSpring,
    XMTabBarAnimationTypeScale,
    XMTabBarAnimationTypeRoll,
    XMTabBarAnimationTypeBoom,
    XMTabBarAnimationTypeShake,
};


@class XMTabBarItem;
@protocol XMTabBarDelegate <NSObject>

-(void)didSelectedItem:(NSInteger)index;

@end
NS_ASSUME_NONNULL_BEGIN

@interface XMTabBar : UITabBar

-(instancetype)initWithFrame:(CGRect)frame
               animationType:(XMTabBarAnimationType)animationType;

@property(strong, nonatomic) NSArray <XMTabBarItem*> *tabItems;
@property(nonatomic) NSInteger selectedIndex;
@property(nonatomic,weak)id <XMTabBarDelegate>xmdelegate;
@end

NS_ASSUME_NONNULL_END
