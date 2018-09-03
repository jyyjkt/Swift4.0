//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//实现步骤
//1.定义一个父类
//2.在父类中定义动态调用的方法
//3.引用父类的动态方法
//4.子类重写父类的动态方法
//5.在3引用的动态方法中传入需要执行方法的子类
//6.执行方法

//示例代码
//定义子类和父类

//定义一个父类
class Person {
    func describe(){
        print("我是父类人")
    }
}

//定义一个子类
class Man : Person {
    override func describe() {
        print("我是子类男人");
    }
}

//动态调用
// 引用父类的方法
//let describe = Person.describe;
// 传入实际执行的实例对象
let man = Man();
//let describeS = describe(man);
//执行方法
//describeS();

//一句话完成

Person.describe(man)()
//
//运行结果:
//
//我是子类男人








