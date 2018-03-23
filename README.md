# WSModallyTransition

* 一个类似于系统alterView和actionSheet的模态弹出和消失的转场动画
* 可用于快速自定义alterView和actionSheet


    ![](https://github.com/ONECATYU/WSModallyTransition/raw/master/demo.gif)

## Usage
1.在storyboard里你可以像这样拖拽并设置好约束   
![](https://github.com/ONECATYU/WSModallyTransition/blob/master/storyboard.png) <br/>
2.安全区域(safeAreaInsets)<br/>
在iOS 11下，会根据safeAreaInsets来调整WSModallyContainerView的subView的上下左右约束的constant，所以你不需要做额外的适配工作. 如下图，在safeAreaInsets改变时，将subView的边界距离，从原始的红色方框区域，调整到右边图中的subView区域。        
![](https://github.com/ONECATYU/WSModallyTransition/blob/master/transform.png)<br/>
3.该viewController需要继承WSModallyViewController.<br/>
4.在WSModallyViewController子类中实现WSModallyViewControllerDelegate中的协议方法:
```objective-c
    //返回一个过渡动画控制器,
    - (WSModallyAnimationController *)animationController {
        WSModallyAnimationController *animation = [WSModallyAnimationController new];
        animation.animationStyle = WSModallyAnimationStyleAlert;
        return animation;
    }

    //返回一个需要做动画的containerView,这里你也可以用storyboard拖拽一个，并关联
        //@property (weak, nonatomic) IBOutlet UIView *containerView; 你可以参照Demo

    - (WSModallyContainerView *)containerView {
        return _containerView;
    }
```
