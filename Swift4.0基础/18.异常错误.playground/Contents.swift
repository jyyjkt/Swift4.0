//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"

//定义异常枚举类型
enum OSUserLoginError : Error{
    case AllNoComplete;
    case UserNameEmpty;
    case PasswordEmpty;
}

//提示:
//注意异常枚举类型必须遵守Error协议
//public protocol Error {
//
//}
//extension Error{
//
//}

//可以使输出错误值的枚举定义
//需求:
//录入学生成绩,如果输入的成绩不在0...100抛出异常

//定义错误协议
enum ScoreInputError:Error{
    case lowZero(name:String,score:Float)
    case highHundred(name:String,score:Float)
}

//定义含有异常机制的函数
func inputStudentName(name:String,score:Float) throws -> Bool{
    
    if score < 0 {
        throw ScoreInputError.lowZero(name: name, score: score)
    
    }else if score > 100{
        throw ScoreInputError.highHundred(name: name, score: score);
        
    }
    //开始录入
    //录入结束
    return true;
}

// 调用函数
do {
    let result = try inputStudentName(name: "张丹", score:300)
    print(result);
}catch ScoreInputError.lowZero(let name,let score){
    print("异常:\(name)的成绩为\(score) --小于0")
}catch ScoreInputError.highHundred(let name,let score){
    print("异常:\(name)的成绩为\(score) -- 大于1000")
}

//处理不同类型的异常

//需求:
//用户输入的密码或者用户名为空抛出异常,如果是密码为空,输入密码为空的用户
//定义异常
enum OSUserLoginErrors : Error{
    case AllNoComplete;
    case UserNameEmpty;
    case PasswordEmpty(userName:String);
}
//定义含有异常机制的函数
func verifyUserName(userName:String,password:String) throws -> Bool{
    if userName == "" && password == "" {
        throw OSUserLoginErrors.AllNoComplete;
    }else if (userName == "" && password != ""){
        throw OSUserLoginErrors.UserNameEmpty;
    }else if (userName == "" && password == ""){
        throw OSUserLoginErrors.PasswordEmpty(userName:userName);
    }
    
    return true;
}

//使用含有异常的函数
do {
    try verifyUserName(userName: "你好", password: "");
}catch OSUserLoginErrors.PasswordEmpty(let userName){
    print("用户:"+userName+"输入的密码为空");
}catch OSUserLoginError.UserNameEmpty{
    print("用户名为空");
}catch{
    print(error);
}

//用户:酷走天涯输入的密码为空

//where在错误类型的使用
enum ErrorType : Error {
    case success
    case error(code:Int)
}

func inputScore(score:Int) throws -> Bool{
    if score < 0 {
        throw ErrorType.error(code: 0);
    }else if score > 100 {
        throw ErrorType.error(code: 1);
    }
    return true;
}

do {
    let score = try inputScore(score: 1000);
}catch ErrorType.error(let x) where x == 0{ // 可以做判断错误类型
    print("错误Code:x=0");
}catch ErrorType.error(let x) where x == 1{
    print("错误Code:x=1")
}catch ErrorType.error(let x) where x == 2{
    print("错误Code:x=2")
}catch{
    print(error)
}
//运行结果:
//第1步 抛出异常
//第2步发生异常清理内存
//NameEmpty

//注意
//1.类中使用defer,在对象方法中,使用defer,在defer块中,调用属性之前,必须初始化所有存储属性,重要事说三遍,所有的存储属性,所有的,存储属性
//2.defer 在定义的 当前作用域 最后一步执行

//try,try!,try?的用法

//A.try

class Student{
    var name : String?;
    init(name : String) {
        self.name = name;
    }
}

let student2 = try Student(name:"");
print("运行结果aaa :\(student2)");

//运行结果:
//第一步
//第二步 发生异常清理内存

//结论:
//我们发现print("运行结果(student)") 这句代码没有执行,说明发生了异常,后面的代码不会执行,但没有报错提示

//B.try!
let student = try! Student(name: "");
print(student);

//运行结果
//第1步
//第2步发生异常清理内存
//fatal error: 'try!' expression unexpectedly raised an error: StudentError.NameEmpty: file /Library/Caches/com.apple.xbs/Sources/swiftlang/swiftlang-800.0.46.2/src/swift/stdlib/public/core/ErrorType.swift, line 178

//结论:
//一旦发生异常,系统会报错,后面的代码不再继续执行

//C.try?
//let student = try? Student(name: "");
//print("运行结果\(student)");

//第1步
//第2步发生异常清理内存
//运行结果nil

//let student1 = try? Student(name: "123");
//print("运行结果\(student1)")


//应用1:

public enum OSNetError:Error{
    /// 错误类型枚举值
    case requestError(RequestError)
    case responseError(ResponseError)
    
    
    /// 请求错误异常
    public  enum RequestError{
        case invalidUrl(url:URL)
        case parameterException
    }
    
    /// 响应错误异常
    public  enum ResponseError:Int{
        case dataFileNil
        case missingContentType
        case unacceptableStatusCode
        case dataFileReadFailed
    }
    
}

//请求:

func requestUrl(url:URL)throws{
    if !url.absoluteString.contains("http"){
        throw OSNetError.requestError(.invalidUrl(url:url))
    }
}

//应用2: 如果你要使用的值有可能为nil,你最好的写法应该像下面这样

let parameters = ["name":"星星"];
guard let filter = CIFilter(name: "CIGaussianBlur",withInputParameters: parameters)
    else { fatalError() }

