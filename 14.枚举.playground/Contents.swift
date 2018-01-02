//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//基本用法
//最简单的定义
//a.多行写法
enum CompassPoint1{
    case north;
    case south;
    case east;
    case west;
}

//b.单行写法
enum CompassPoint2 {
    case north,south,ease,west;
}

//提示 Swift 3.0 开始,定义枚举值,统一小写

//指定枚举类型的原始数据类型
enum Rank : Int {// Int 设置枚举值的类型
    // 定义枚举值设置值
    case ace;
    // 可以case后面一次定义多个枚举值
    case onr,two,three,four,five,six,seven,eight,nine,ten
    case jack,queen,king
    
    // 定义函数 如果多人合作的时候,可以使用这个让别人更加了解你定义的属性含义
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace1";
        case .jack:
            return "jack1";
        case .queen:
            return "queen1";
        case .king:
            return "king1";
        default:
            return String(self.rawValue);
        }
    }
}

//注意
//枚举类型可以Int String等基本类型值,对象是不可以的,官方说必须是实现RawRepresentable协议的类型才可以

//使用
let ace = Rank.ace;
let rank = Rank(rawValue : 4);

//提示

//第二种创建的枚举为可选类型,这样设计的原因是,你有可能创建一个nil对象,处于安全考虑它也必须是可选值,使用的时候要解包

//给枚举设置原始值
//enum CompassPoint3 {
//    case north = "1";
//    case south = "2";
//    case east = "3";
//    case west = "4";
//}
//提示:

//你认为上面这样定义是否是正确的,答案是否定的,因为系统不知道你枚举的原始值是什么类型的,这里系统没有进行类型推断,所有我们要给枚举添加原始值之前,必须指定枚举原始值的类型,如下
enum CompassPoint3 : Character {
    case north = "1";
    case south = "2";
    case east = "3";
    case west = "4";
}

let aceRawValue = ace.rawValue;
//提示
//1.如果你没有定义枚举的原始值类型,你不能通过上述方法获取原始值
//2.输入定义的是数字类型 ，原始值对应的是数字本身，
//3.如果定义的是字符串类型,但你没有給它赋值,这个时候,你获取的原始值就是你定义的名字

//高级用法
//提供值创建枚举
enum ServerResponse {
    case result(String, String);
    case failure(String);
}

let success = ServerResponse.result("6:00 am", "8:09 pm");
let failure = ServerResponse.failure("Out of cheese.");

//提示
//这个方式定义的枚举 不能使用 == 来做判断处理.我们应该使用模式匹配的方式处理,这种定义方式强调的是传值,如下
switch success {
    case let .result(sunrise, sunset)://模式匹配
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
    case let .failure(message):
    print("Failure...\(message)");
    
}

//或者
switch success{
    case .result(let sunrise, let sunset): //模式匹配
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).");
    case .failure(let message):
    print("Failure...\(message)");
}

//indirect使用方法
//使用场景:
//主要用于递归枚举,看下面例子,你应该很清楚怎么使用

//a.使用方式1
enum ArithmeticExpression {//递归枚举
    case number(Int);
    indirect case addition(ArithmeticExpression, ArithmeticExpression);
    indirect case multipliction(ArithmeticExpression,ArithmeticExpression);
}

let expression = ArithmeticExpression.addition(ArithmeticExpression.number(3), ArithmeticExpression.number(4));

//b.使用方式2
indirect enum ArithmeticExpression1 {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let expression1 =     ArithmeticExpression.addition(ArithmeticExpression.number(3), ArithmeticExpression.number(4))
//结论:
//如果你定义的枚举是递归的形式,必须有关键字indirect 修饰,不然系统会编译报错哦!

//.重新实现SWIFT标准库的可选类型(使用泛型技术)
enum OptionalValue<Wrapped> {
    case none;
    case some(Wrapped);
}
var possibleInteger : OptionalValue<Int> = .none;
possibleInteger = .some(100);

//枚举可以继承协议
protocol Skill {
    mutating func modifyMusic(name : String);
}

enum Type : String,Skill{
    case name = "123";
    mutating internal func modifyMusic(name: String) {
        self = Type(rawValue : "123")!;
    }
}

//枚举不能包含存储属性,但是可以包含静态变量和计算属性
enum SomeEnumeration : Int {
    case one = 2;
    case two = 345;
    // 静态变量
    static var storedTypeProperty = "Some value.";
    // 静态计算属性
    static var computedTypeProperty : Int {
        return 6;
    }
    // 计算属性
    var getRaw:Int{
        return self.rawValue;
    }
}

// 一般人都不知道的神级操作
enum Locale {
    case none;
    case base;
    case language(String);
}

//我们创建一个变量
let locale = Locale.language("english");

//问题:我们怎么判断它是什么类型嗯?
//if locale == Locale.base {
//
//}//错误的判断方式

//我们可以提供下面的方式进行判断
switch locale{
case Locale.base : print(locale)
case Locale.none : print(locale)
case Locale.language("english"): print(locale)
case Locale.language(let x):print(x)
}

//为了判断一个类型我们写这么一个判断是在是有点不雅,下面就体验一下关键字case 的神奇用法

enum Locale1 {
    case none;
    case base;
    case language(String);
    // 判断是否是汉语
    var isChinese: Bool {
        if case .language("chinese") = self {
            return true;
        }
        return false;
    }
    // 是否是其他语言
    var isLanguage : Bool {
        if case .language = self  {
            return true;
        }
        return false;
    }
    
    var isBase : Bool {
        if case .base = self {
            return true;
        }
        return false;
    }
    
    var isNone : Bool {
        if case .none = self  {
            return true;
        }
        return false;
    }
    
}

//我们看下下如何
let locale2 = Locale1.language("english");
print(locale2.isChinese);





