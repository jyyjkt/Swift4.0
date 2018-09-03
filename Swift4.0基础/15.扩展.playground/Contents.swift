
//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//给存在的类型增加扩展
//a.我们演示一个简单的例子
//线定义一个协议
protocol Custom {
    var describe : String {
        get
    }
}

//通过扩展的方式,让Int实现协议
extension Int : Custom {
    var describe : String {
        return String(self);
    }
}

//高级用法
//a.需求:给Array扩展一个属性,但是只能让元素为Int 时才能使用
//思路:承接上文,我们给Int遵守了一个协议Custom,我们就借助这个来实现需求

extension Array where Element : Custom {
    var lastValue : Element {
        return self[count - 1];
    }
}
// 使用
let nums = [1,2,3,4,5];
print(nums.lastValue);//使用

//b.如果想要在定义协议的时候,不指定变量名称,在实现协议的时候,再去设定变量类型,应该怎么写?
//定义一个协议
protocol Draw {
    associatedtype CompatableType //自定义一个变量名字
    var name : CompatableType{
        get
    }
}

//如何继承协议
class Person1 : Draw {
    typealias CompatableType =  String;//定义类型别名
    var name : String {
        return "人";
    }
}

let person1 = Person1();
person1.name;

//当然由于Swift 有类型推断能力,可以像线面这样写
class Person2 : Draw {
    var name : String {
        return "人";
    }
}

//你不能干的事情
//不能给对象扩展存储属性
