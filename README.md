# XMTabBar

为TabBar点击增加动画效果,让你的点击不再单调,暂时就提供五种动画效果,具体效果可参考下面的动图

> 弹跳效果

![](https://github.com/ixmwl/XMTabBar/blob/master/resource/spring.gif?raw=true)

> 缩放效果

![](https://github.com/ixmwl/XMTabBar/blob/master/resource/scale.gif?raw=true)

> 翻转效果

![](https://github.com/ixmwl/XMTabBar/blob/master/resource/roll.gif?raw=true)

> 粒子爆炸效果

![](https://github.com/ixmwl/XMTabBar/blob/master/resource/Boom%20.gif?raw=true)

> 抖动效果

![](https://github.com/ixmwl/XMTabBar/blob/master/resource/shake.gif?raw=true)


## Requirements 要求

* iOS 7+
* Xcode 8+

## Installation 安装

* **手动安装**

    下载DEMO后,将子文件夹XMTabBar拖入到项目中, 导入头文件XMTabBar.h开始使用,无需依赖其他框架

* **CocoaPods安装**

    ```ruby
    pod 'XMTabBar'
    ```
    
    
## Usage使用
* 导入头文件

```ruby
#import "XMTabBar.h"
#import "XMTabBarItem.h"
```

* 定义一个tabBar

```ruby
@property(nonatomic,strong)XMTabBar *xmTabBar;
```

* 初始化自定义的TabBar


```ruby
XMTabBar *xmTabBar = [[XMTabBar alloc] initWithFrame:self.tabBar.frame
                                   animationType:XMTabBarAnimationTypeShake];
xmTabBar.xmdelegate = self;
// 利于kvc替换系统TabBar
[self setValue:xmTabBar forKeyPath:@"tabBar"];
self.xmTabBar= xmTabBar;
```
* 实现代理方法,切换控制器

```ruby
-(void)didSelectedItem:(NSInteger)index{
    self.selectedViewController = self.viewControllers[index];
}
```

## Author

ixmwl, ixmwl510@163.com

## License

XMTabBar is available under the MIT license. See the LICENSE file for more info.


