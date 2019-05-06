//
//  XMTabBarItem.m
//  XMNewsProject
//
//  Created by 刘灿 on 2019/4/30.
//  Copyright © 2019 LC. All rights reserved.
//

#import "XMTabBarItem.h"
#import "XMTabBar.h"
@interface XMTabBarItem ()

@property (nonatomic, strong) UILabel *titleLab;

@property(copy, nonatomic)   NSString *title;
//@property(strong, nonatomic) UIImage *loadingImage;
@property(strong, nonatomic) UIImage *selectedImage;
@property(strong, nonatomic) UIImage *noralImage;

/** 粒子动画效果 */
@property (nonatomic, strong) CAEmitterLayer *explosionLayer;
@property (nonatomic, strong) CAEmitterCell *explosionCell;

@end
@implementation XMTabBarItem
#pragma mark - init
-(instancetype)initWithTitle:(NSString *)title
                       image:(UIImage *)image
               selectedImage:(UIImage *)selectedImage{
    self = [super init];
    if (self) {
        self.noralImage = image;
        self.selectedImage = selectedImage;
        self.title = title;
        [self setUpUi];
        [self setUpEmitterForItem];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)setUpUi{
    


    self.iconImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLab.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.iconImageView];
    [self addSubview:self.titleLab];

    NSDictionary *views = NSDictionaryOfVariableBindings(_iconImageView,_titleLab);
    //设置高度
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-4-[_iconImageView(32)]-0-[_titleLab]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]];
    //设置宽度
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[_iconImageView(32)]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]];
    
    //水平居中
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_iconImageView
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1
                                                      constant:0]];
    //Label水平居中
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleLab
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1
                                                      constant:0]];
    
//    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(32, 32));
//        make.centerX.equalTo(self);
//        make.top.equalTo(self).offset(4);
//    }];
//
//
//    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.iconImageView.mas_bottom).offset(-4);
//        make.centerX.equalTo(self);
//    }];
    
    self.iconImageView.image = self.noralImage;
    self.titleLab.text = self.title;
}

-(void)setItemSelected:(BOOL)itemSelected{
    if(itemSelected){
        self.titleLab.textColor = [UIColor colorWithRed:0.84 green:0.23 blue:0.22 alpha:1];;
        self.iconImageView.image= self.selectedImage;
        
        [self startAnimation];
        
    }else{
        self.titleLab.textColor=[UIColor colorWithRed:0.36 green:0.36 blue:0.36 alpha:1];
        self.iconImageView.image=_noralImage;
    }
}
#pragma mark - lazyLoad
-(UIImageView *)iconImageView {
    if (!_iconImageView) {
        UIImageView *iconImageView = [UIImageView new];
        _iconImageView = iconImageView;
    }
    return _iconImageView;
}

-(UILabel *)titleLab {
    if (!_titleLab) {
        UILabel *titleLab = [[UILabel alloc] init];
        titleLab.font = [UIFont systemFontOfSize:14];
        _titleLab = titleLab;
    }
    return _titleLab;
}

#pragma mark - 点击动画相关
#pragma mark - tabBar点击动画相关
- (void)startAnimation{
    switch (self.animationType) {
        case XMTabBarAnimationTypeSpring:
            [self springAnimation];
            break;
        case XMTabBarAnimationTypeScale:
            [self scaleAnimation];
            break;
        case XMTabBarAnimationTypeRoll:
            [self rollAnimation];
            break;
        case XMTabBarAnimationTypeBoom:
            [self boomAnimation];
            break;
        case XMTabBarAnimationTypeShake:
            [self shakeAnimation];
            break;
        default:
            break;
    }
}

/**
 弹跳动画
 */
- (void)springAnimation{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.values = @[@0.0, @-4.15, @-7.26, @-9.34, @-10.37, @-9.34, @-7.26, @-4.15, @0.0, @2.0, @-2.9, @-4.94, @-6.11, @-6.42, @-5.86, @-4.44, @-2.16, @0.0];
    animation.duration = 0.8;
    animation.beginTime = CACurrentMediaTime();
    [self.iconImageView.layer addAnimation:animation forKey:nil];
}


/**
 缩放动画
 */
- (void)scaleAnimation{
    //放大效果，并回到原位
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //速度控制函数，控制动画运行的节奏
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 0.3;       //执行时间
    animation.repeatCount = 1;      //执行次数
    animation.autoreverses = YES;    //完成动画后会回到执行动画之前的状态
    animation.fromValue = [NSNumber numberWithFloat:0.7];   //初始伸缩倍数
    animation.toValue = [NSNumber numberWithFloat:1.3];     //结束伸缩倍数
    [self.iconImageView.layer addAnimation:animation forKey:nil];
}


/**
 翻转动画
 */
- (void)rollAnimation {
    //z轴旋转180度
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    //速度控制函数，控制动画运行的节奏
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 0.5;       //执行时间
    animation.repeatCount = 1;      //执行次数
    animation.removedOnCompletion = YES;
    animation.fromValue = [NSNumber numberWithFloat:0];   //初始伸缩倍数
    animation.toValue = [NSNumber numberWithFloat:2*M_PI];     //结束伸缩倍数
    [self.iconImageView.layer addAnimation:animation forKey:nil];
}


/**
 爆炸粒子动画
 */
- (void)boomAnimation {
    // 创建关键帧动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];

    animation.values = @[@1.5 ,@0.8, @1.0,@1.2,@1.0];
    animation.duration = 0.5;
    // 粒子发射器 发射
    [self startFire];
    // 动画模式
    animation.calculationMode = kCAAnimationCubic;
    [self.iconImageView.layer addAnimation:animation forKey:@"transform.scale"];
}

- (void)setUpEmitterForItem{
    // 粒子使用CAEmitterCell初始化
    CAEmitterCell *emitterCell   = [CAEmitterCell emitterCell];
    // 粒子的名字,在设置喷射个数的时候会用到
    emitterCell.name             = @"emitterCell";
    // 粒子的生命周期和生命周期范围
    emitterCell.lifetime         = 0.7;
    emitterCell.lifetimeRange    = 0.3;
    // 粒子的发射速度和速度的范围
    emitterCell.velocity         = 40.00;
    emitterCell.velocityRange    = 4.00;
    // 粒子的缩放比例和缩放比例的范围
    emitterCell.scale            = 0.1;
    emitterCell.scaleRange       = 0.02;
    
    // 粒子透明度改变范围
    emitterCell.alphaRange       = 0.10;
    // 粒子透明度在生命周期中改变的速度
    emitterCell.alphaSpeed       = -1.0;
    // 设置粒子的图片
    emitterCell.contents         = (id)[UIImage imageNamed:@"Sparkle3"].CGImage;
    
    /// 初始化粒子发射器
    CAEmitterLayer *layer        = [CAEmitterLayer layer];
    // 粒子发射器的 名称
    layer.name                   = @"emitterLayer";
    // 粒子发射器的 形状(可以想象成打仗时,你需要的使用的炮的形状)
    layer.emitterShape           = kCAEmitterLayerCircle;
    // 粒子发射器 发射的模式
    layer.emitterMode            = kCAEmitterLayerOutline;
    // 粒子发射器 中的粒子 (炮要使用的炮弹)
    layer.emitterCells           = @[emitterCell];
    // 定义粒子细胞是如何被呈现到layer中的
    layer.renderMode             = kCAEmitterLayerOldestLast;
    // 不要修剪layer的边界
    layer.masksToBounds          = NO;
    // z 轴的相对坐标 设置为-1 可以让粒子发射器layer在self.layer下面
    layer.zPosition              = 1;
    layer.emitterPosition = CGPointMake(self.iconImageView.center.x+16, self.iconImageView.center.y + 16);
    // 添加layer
    [self.iconImageView.layer addSublayer:layer];
    _explosionLayer = layer;
}
- (void)startFire{
    // 每秒喷射的80个
    [self.explosionLayer setValue:@1000 forKeyPath:@"emitterCells.emitterCell.birthRate"];
    // 开始
    self.explosionLayer.beginTime = CACurrentMediaTime();
    // 执行停止
    [self performSelector:@selector(stopFire) withObject:nil afterDelay:0.1];
    
}
- (void)stopFire {
    //每秒喷射的个数0个 就意味着关闭了
    [self.explosionLayer setValue:@0 forKeyPath:@"emitterCells.emitterCell.birthRate"];
}


/**
 抖动动画
 */
- (void)shakeAnimation {
    //创建动画
    CAKeyframeAnimation * keyAnimaion = [CAKeyframeAnimation animation];
    keyAnimaion.keyPath = @"transform.rotation";
    keyAnimaion.values = @[@(-20 / 180.0 * M_PI),@(20 /180.0 * M_PI),@(-20/ 180.0 * M_PI)];//度数转弧度
    
    keyAnimaion.removedOnCompletion = NO;
    keyAnimaion.fillMode = kCAFillModeBackwards;
    keyAnimaion.duration = 0.3;
    keyAnimaion.repeatCount = 2;
    [self.iconImageView.layer addAnimation:keyAnimaion forKey:nil];
}
@end

