//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"

// 如果实现对象拷贝
//第一种方法:
//1.遵守协议 NSCopying
//2.实现协议
//NSCopying 协议
//public protocol NSCopying {
//
//
//    public func copy(with zone: NSZone? = nil) -> Any
//}

//示例代码:
class Student : NSCopying {
    var name : String;
    required init(name : String){
        self.name = name;
    }
    func copy(with zone: NSZone? = nil) -> Any{
        let student = Student(name: self.name);
        return student;
    }
}
//使用
let student1 = Student(name : "星星");
let student2 : Student = student1.copy() as! Student;
print(student2.name);
student2.name = "小星星";
print(student1.name);
print(student2.name);

//运行:
//星星
//星星
//小星星

//分析:
//由于NSCopying协议里面的方法copy返回的值为Any系统没法推断出来的是Student类型,所以必须as!指明是Student类型过程有点繁琐

//第二种方法
//1.创建一个一个required 修饰的初始化方法
//2.自定义一个copy
//示例代码
class StudentA{
    var name : String;
    required init(name : String){
        self.name = name;
    }
    
    func copy() -> Self {
        let result = type(of: self).init(name: self.name);
        return result;
    }
}
//使用
let studentA1 = StudentA(name: "星星");
let studentA2 = studentA1.copy();//
studentA2.name = "小星星";
print(studentA1.name);
print(studentA2.name);
//结果
//星星
//小星星
//分析
//type(of: self) 获取到自身类的类型,然后通过init(name:self.name) 初始化一个对象 ,初始化的对象为Self 类型

//思考:初始化为什么要使用required修饰的初始化
//参考元类型
//设计规范:
//像拷贝这种行为,不是很多对象都具体的行为,我们应该把它设计成协议,让类去集成它;

protocol Copy {
    func copy() -> Self;
}

class Student1 {
    var name : String;
    init(name : String) {
        self.name = name;
    }
    
    
    //其实如果我们但从技术上实现,下面也可
    func copy() -> Student1{
        let result = Student1.self.init(name:self.name)
        return result
    }
    
    func copy1() -> Student1{
        let result = Student1.init(name: self.name)
        return result
    }
    
    func copy2() -> Student1{
        let result = Student1(name: self.name)
        return result
    }
    
}

//给多个对象扩展相同的方法

//需求:给数字扩展一个返回平方的操作

//定义个协议
protocol NumberProtocol {
    
}
//扩展实现协议
extension Int : NumberProtocol {
    
}

extension Double : NumberProtocol{
    
}

//给协议扩展方法
extension NumberProtocol {
    // 我们不确定返回的Self 到底是什么类型
    func squareValue() -> Self{
        if self is Int {
            let n = self as! Int;
            return n*n as! Self;
        }
        
        if self is Double {
            let n = self as! Double;
            return n*n as! Self;
        }
        
        return 0 as! Self;
    }
}

print(3.44.squareValue());
print(3.squareValue());









