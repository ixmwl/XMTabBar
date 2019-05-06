//
//  XMTabBarItem.h
//  XMNewsProject
//
//  Created by 刘灿 on 2019/4/30.
//  Copyright © 2019 LC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMTabBar.h"
NS_ASSUME_NONNULL_BEGIN

@interface XMTabBarItem : UIButton

-(instancetype)initWithTitle:(NSString *)title
                       image:(UIImage *)image
               selectedImage:(UIImage *)selectedImage;
@property (nonatomic, strong) UIImageView *iconImageView;
@property(nonatomic)BOOL itemSelected;
@property (nonatomic, assign) XMTabBarAnimationType animationType;
@end

NS_ASSUME_NONNULL_END
