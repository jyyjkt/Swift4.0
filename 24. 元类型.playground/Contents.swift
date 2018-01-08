//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//认识AnyClass
typealias AnyClass = AnyObject.Type
//所有类都隐式实现的协议
//当你在一个或者类中使用@obj创建类方法或者属性时,会被系统知道,认为它是AnyClass的方法
//我们看一个例子
class Student {
    @objc static let describe = "这是一个学生类";
    @objc class func getDefaultValue() -> Int {
        return 0;
    }
}

//定义两个方法
func getDefaultValue(_ c : AnyClass) -> Int? {
    return c.getDefaultValue?();
}

func getDescribeValue(_ c : AnyClass) -> String? {
    return c.describe;
}

//接下来我们调用一下
print(getDefaultValue(Student.self));
print(getDescribeValue(Student.self));

//结果
//Optional(0)
//Optional("这是一个学生类")

//OC的类跟AnyObject 没关系 跟NSObject 有关系
print(getDescribeValue(NSString.self));
print(getDefaultValue(NSString.self));

//类的类型
//a.获取类的类型
class Student1 {
    required init(){//required(必须)
        
    }
}

class Student2 : Student1{
    required init(){//required(必须)
        
    }
}

//定义类的类型变量
let StudentType : Student1.Type = Student1.self;
let StudentType2 : Student2.Type = Student2.self;
// AnyClass 可以接受任何类的类型
let type : AnyClass = Student1.self;
let type2 : Student1.Type = StudentType2;

//通过类的类型初始化对象
let stu = StudentType.init();
let stu2 = type2.init();

//注意:
//通过这种方式初始化对象的时候,必须有required 修饰的初始化方法才行

protocol TeacherDelegate {
    
}

class Teacher : TeacherDelegate {
    
}

let teacherType = Teacher.self
func isStudentDelegate(_ type:AnyClass ) -> Bool{
    if type is TeacherDelegate.Type {
        return true;
    }
    return false;
}
print(isStudentDelegate(teacherType));




