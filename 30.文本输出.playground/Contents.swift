//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Person : CustomStringConvertible {
    var name : String;
    var age : Int;
    var weight : Double;
    init(name : String, age : Int,weight : Double) {
        self.name = name;
        self.age = age;
        self.weight = weight;
    }
    var description: String{
        return name + String(age) + String(weight);
    }
    
}

// 获取对象文本
let person = Person(name: "小星星",age: 25,weight: 150);
let des = String(describing: person); //描述
print(des);

//运行结果
//酷走天涯25150.0

//提示:
//让对象文本输出很简单,只是实现协议CustomStringConvertible 即可

//思考: 下面的代码为什么不正确
//class Person1 : NSObject,CustomStringConvertible {
//    var name : String;
//    var age : Int;
//    var weight : Double;
//    init(name: String,age: Int,weight: Double) {
//        self.name = name;
//        self.age = age;
//        self.weight = weight;
//    }
//
//    var description: String{
//        return name + String(age) + String(weight);
//    }
//
//}

//提示:
//NSObject 里面已经实现了协议CustomStringConvertible,
//不能重复实现,我们只需要重写var description: String 即可

//改正
class Person2 : NSObject {
    var name : String;
    var age : Int;
    var weight : Double;
    init(name: String,age: Int,weight: Double) {
        self.name = name;
        self.age = age;
        self.weight = weight;
    }

    override var description: String{
        return name + String(age) + String(weight);
    }

}

