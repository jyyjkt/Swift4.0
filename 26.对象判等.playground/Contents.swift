//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//实现步骤
//1.d对象遵守协议Equatable
//2.实现协议的方法

//a.第一种写法 在类内部实现

class A : Equatable {
    var name : String?
    static func ==(lhs: A,rhs: A) -> Bool{
        return lhs.name == rhs.name;
    }
}

//b.第二种写法将实现方法写到全局去
class B : Equatable {
    var name : String?
}

func  ==(lhs: B, rhs : B) -> Bool {
    return lhs.name == rhs.name;
}

//c.你也可以使用扩展方式去实现协议
extension A {
    static func equal(lhs: A, rhs: A) -> Bool{
        return lhs.name == rhs.name
    }
}

let classa = A();
classa.name = "小星星";
let classb = A();
classb.name = "小星星";
if classa == classb { //其实判断的是classa.name 是否相等
    print("==");
}
//提示:
//如果对象没有实现Equatable 协议方法,系统不允许使用 == 进行判断,这是swift的严谨性




