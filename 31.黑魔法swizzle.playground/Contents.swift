//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//举个例子理解一下
//如果你想统计App中所有页面的点击事件,最简单会计的方式是什么?
extension UIButton{
    class func swip() {
        //创建一个结构体,写个静态变量
        struct T {
            static let x : Bool = {
                let cls : AnyClass = UIButton.self;
                //创建消息对象
                let originalSelector = #selector(UIButton.sendAction(_:to:for:));
                let swizzleSelector = #selector(UIButton.swizzle_sendAction(action:to:forEvent:))
                // 创建方法
                let ori_method = class_getInstanceMethod(cls, originalSelector);
                let swi_method = class_getInstanceMethod(cls, swizzleSelector);
                
                print(ori_method);
                print(swi_method);
                
                // 交换两个方法的实现部分
                method_exchangeImplementations(ori_method!, swi_method!);
                print("执行了...............");
                return false;
            }();
        }
        // 这里必须执行一下,不然没法创建静态变量
        T.x;
    }
    
    // 定义要交换的函数
    @objc public  func swizzle_sendAction(action: Selector,to: AnyClass!,forEvent: UIEvent!){
        // 定义一个累加器
        struct button_tap_count{
            static var count = 0
        }
        button_tap_count.count += 1
        print(button_tap_count.count)
        // 看似好像调用了自己构成死循环,但是 我们其实已经将两个方法名的实现进行了调换 所以 其实我们调用的是 方法sendAction:to:forEvent 的实现 这样就可以在不破环原先方法结构的基础上进行交换实现
        swizzle_sendAction(action: action, to: to, forEvent: forEvent)
    }
    
}

//使用

class ViewController: UIViewController {
    var button: UIButton?
    
    func myView() -> Void {
        // 执行一次交换方法
        button = UIButton();
        UIButton.swip();
        button?.addTarget(self, action: #selector(tap(button:)), for: .touchUpInside)
    }
    
    @objc func tap(button:UIButton){
        print("你好")
    }
}

let VC = ViewController();
VC.myView()

//后面部分当你点击按钮才会出现结果
//所以最好在工程测试,playground没法测试 






