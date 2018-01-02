//: Playground - noun: a place where people can play

import UIKit
import Foundation
import SceneKit

var str = "Hello, playground"
// 学习目标
// Swift中的协议和OC中协议的区别
// Swift中的协议的用法
// 怎么使用

// swift 和 Object-C 协议的区别

// 1.OC中的协议只能用于类,swift中的协议不仅能用于类,还能用于结构体和枚举
// 2.OC中的协议可以设置可选实现,但Swift中的协议必须实现
// 3.Swift中的协议增加了一个关键字mutating可以决定结构体和枚举实现协议的时候,是否可以修改属性的值

//Swift协议(protocol)

//定义一个协议
protocol LoveMusic {
    func songMusic();
    var simpleDescription: String {
        get
    }
    mutating func modifyMusic(name : String);
}

//协议可以继承协议(多个)

protocol Love{
    func loveJazz();
}

protocol Skill{
    func highPitch();
}

protocol LoveMusic1 : Love,Skill{
    func songMusic();
    var simpleDescription : String {
        get
    }
    mutating func modifyMusic(name : String);
}
//注意方法不能重写

//.可以实现多个协议
class Student : Love,Skill{
    func loveJazz() {
        print("爵士乐");
    }
    
    func highPitch() {
        print("高音");
    }
    
    internal var name : String = "";
    internal func modifyMusic(name : String) {
        
    }
}

// 协议类型的变量
// 协议的 标准写法
var prptocol : LoveMusic;
var delegate : LoveMusic & Love & Skill;

// 协议做函数参数
func getStudent(student : Love & Skill){
    student.loveJazz();
    student.highPitch();
}

//实现协议可选函数或者变量
//1.在协议的前面加上关键字 @objc ,再在你需要设置可选方法或者属性的前面加上关键字@objc 和 optional 即可
@objc protocol OptionalProtocol{//可选
    @objc optional func optionalMethod()
    @objc optional var name:String {set get}
}

//2.还有另外一种方法可以实现可选协议就是遵守NSObjectProtocol
// 实例代码:
public protocol SCNSceneRendererDelegate : NSObjectProtocol {
   func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval);
}

//你应该注意的
//
//在协议中定义属性的时候,必须使用set get \ get\ 修饰,但不能只用set修饰,swift要求我们属性必须有get方法
//
//类不能多次继承同一个协议

//class Student4 : Love,Love {//错误的
//    internal var name : String;
//    internal func modifyMusic(name: String){
//
//    }
//}

//如果多个协议中有相同的方法和属性,只需要实现一次即可
protocol Love3{
    var name:String{get set};
    mutating func modifyMusic(name : String);
}

protocol Skill3{
    var name : String{
        get set
    };
    mutating func modifyMusic(name : String);
}

class Student3 : Love3 , Skill3{
    internal var name : String = "";
    internal func modifyMusic(name: String) {
        
    }
}

//一般人不知道
//需求:创建一个协议只能被类遵守
protocol MyClassDelegate : class {
    func getName();
}
//什么时候必须使用类协议?
//当你要使用weak修饰的时候
protocol UDPDelegate:class{
    
}

class UDP{
    weak var delegate : UDPDelegate?;
}










