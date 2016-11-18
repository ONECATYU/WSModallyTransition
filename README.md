# WSModallyTransition

* 一个类似于系统alterView和actionSheet的模态弹出和消失的转场动画
* 可用于快速自定义alterView和actionSheet

## Usage

1. 申明一个类，如:AlertViewController或ActionSheetViewController，继承WSModallyViewController。
2. 在WSModallyViewController子类中实现WSModallyViewControllerDelegate中的协议方法:
```objective-c
    //返回一个过渡动画控制器,
    - (WSModallyAnimationController *)animationController {
        WSModallyAnimationController *animation = [WSModallyAnimationController new];
        animation.animationStyle = WSModallyAnimationStyleAlert;
        return animation;
    }

    //返回一个需要做动画的containerView,这里你也可以用storyboard拖拽一个，并关联
        //@property (weak, nonatomic) IBOutlet UIView *containerView;你可以参照Demo

    - (UIView *)containerView {
        return _containerView;
    }

    //动画类型
    typedef NS_ENUM(NSInteger, WSModallyAnimationStyle) {
        WSModallyAnimationStyleActionSheet = 0,
        WSModallyAnimationStyleAlert
    };
```
