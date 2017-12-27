//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//存储属性
//a.注意
//1.类和结构体中不能使用枚举
//2.不能被子类重写,但可以在子类中给它添加监测功能willSet{} didSet{}
//b.定义

struct Range { // 结构体定义存储属性
    let first : Int;
    var length : Int;
}

class Student { // 类定义存储属性
    var name : String!;
    var score : String!;
}

//计算属性

//a.能在哪里使用
//类,结构体,枚举
//b.定义
//1.结构体使用
struct Range1 {
    var first : Int;
    var length : Int;
    var myFirst:Int {//setter ,getter的计算属性
        set {
            first = newValue;
        }
        get {
            return first;
        }
    }
    
    var myLength : Int {//只有get方法计算属性
        get{
            return length;
        }
    }
}

//2.没居中使用
enum Person : String {
    case Man = "男";
    case Women = "女";
    
    //get
    var name : String {
        return self.rawValue;
    }
    
    //setter getter
    var rename : String {
        set(newName){
            self = Person(rawValue: newName)!;
        }
        get{
            return self.rawValue;
        }
    }
}

var person = Person.Man;
print(person.name);
person.rename = "女";
print(person.rawValue);

//结果:
//男
//女

//提示:
//1.如果计算属性只有getter 方法,那么这个get 可以被省略
//2.setter 可以设置新值名字,如果没有设置默认为newValue
//3.let不能修饰计算属性

//监测属性
//例子1:
class Circle{
    var area:Double = 0.0;
    var r:Double = 0.0{
        willSet{
            area = Double.pi * newValue * newValue;
        }
    }
}
let circle = Circle();
circle.r = 10.0;
print(circle.area);
//运行结果
//0.0
//314.159265358979

//例子2:
class Circle1{
    lazy var area : Double = 0.0;
    var r:Double = 0.0 {
        willSet{
            print("有新值");
            area = Double.pi*newValue*newValue;
        }
    }
}

let circle1 = Circle1();
func calcalate(r:inout Double){
    print("函数执行开始");
    r = 2.0;
    print("函数执行结束");
}
calcalate(r: &circle1.r);
//运行结果
//函数执行开始
//函数执行结束
//有新值

//提示:
//1.监测属性,其实是给存储属性上添加的一种监测功能,willSet 监测新值,didSet 监测旧值
//2.如果函数的参数是inout 修饰的,你如果将监测的属性传入这个函数的时候,此时会将属性的值拷贝一份,在函数结束的时候,将值重新付给属性,所以函数执行完毕后,会触发监测函数

//Lazy 关键字使用(只用于存储属性)
//使用时Lazy必须注意
//1.只能用于存储属性
//2.修饰的属性必须有初始化
//3.在结构体中使用Lazy修饰属性,在访问的方法前必须加mutating 修饰
//4.不能用于全局属性或者静态变量
//5.存储属性被lazy修饰,只被初始化一次,在多线程访问时,不需要使用lazy标记

//例子:
struct Animals{
    lazy var name = "动物";
    mutating func calculate(){ // 调用了lazy 必须加mutating
        let name = self.name;
    }
    
    var myName : String { //只有get方法计算属性
        mutating get{ // 调用了lazy 必须加mutating
            return name;
        }
    }
}

//static 和 class 关键字的用法
//相同点:
//1.可以修饰方法,static修饰的方法叫做静态方法,class修饰的叫做类方法
//2.都可以修饰计算属性.

//不同点
//class不能修饰存储属性
//class修饰的计算属性可以被重写,static修饰的不能被重写
//static可以修饰存储属性,static修饰的存储属性称为静态变量(常量);
//static修饰的静态方法不能被重写,class修饰的类方法可以被重写.
//class修饰的类方法被重写时,可以使用static让方法变为静态方法
//class修饰的计算属性被重写时,可以使用static让其变为静态属性,但它的子类就不能重写了
//class只能在类中使用,但是static可以在类,结构体,或者枚举中使用.
//下面是个例子:
class Person1{
    static var describe: String = "这是一个类";
    class var score : Int{
        return 0;
    }
    // class 修饰的类方法可以被子类重写,static修饰的静态方法不能被重写
    class func getScore() -> Int{
        return score;
    }
}

class Man : Person1 {
    //重新计算属性  可以使用static 来重写,但static重写后,就不能被它的子类再次重写了
    class override var score : Int {
        return 1;
    }
    
    //重写类方法时可以使用static 让其变成静态方法
    static override func getScore() -> Int {
        return score;
    }
    
    
}
//下面是个例子:
class Person3{
    static var descibe:String = " 这是一个人类";
    class var score : Int {
        return 0;
    }
    //class 修饰的类方法可以被子类重写,static修饰的静态方法不能被重写
    class func getScore() -> Int{
        return score;
    }
}

class Man3 : Person3 {
    //class 修饰的类方法可以被子类重写,static修饰的静态方法不能被重写
    class override var score : Int {
        return 1;
    }
    
    //重写类方法时可以使用static让其变成静态方法
    static override func getScore() -> Int {
        return score;
    }
}

//了解这些东西
//1.参数是闭包执行的结果和参数是闭包
class Person4{
    var name : String;
    var score : Int;
    init(name: String,score : Int) {
        self.name = name;
        self.score = score;
    }
    let descirbe: String = {
        print("闭包已经执行");
        return "我在这个时间\(getTime())被创建了";
    }()
    
}
//获取时间
func getTime() -> Date {
    return Date();
}

let p = Person4(name:"小星星",score:3);

//运行结果:
//闭包已经执行
//Program ended with exit code: 0


//分析:
//属性describe 是一个String 类型 ,获取闭包函数执行的结果
//其实和下面的代码是一个意思

class Person6{
    var name : String;
    var score : Int;
    init(name : String,score : Int) {
        self.name = name;
        self.score = score;
    }
    
    let descirbe : String = myDescibe1();
    
}

// 获取时间
func getTime1() -> Date{
    return Date();
}

func myDescibe1() -> String{
    return "我在\(getTime1())被创建了";
}

let p1 = Person6(name:"小星星", score: 3);

//注意:
//
//属性 = 号后面的函数不能定义在类内,因为初始化未完成之前是不能调用对象方法的

//接下来我们看参数是闭包
class Person7{
    var name : String;
    var score : Int;
    init(name : String,score : Int) {
        self.name = name;
        self.score = score;
    }
    //注意和上面的区别
    let descibe: () -> String = {
        print("闭包执行了");
        return "我在\(getTime2())被创建了";
    }
}

//获取时间
func getTime2() -> Date {
    return Date();
}

func myDescribe() -> String {
    return "我在\(getTime2())被创建了";

}

let p7 = Person7(name:"小星星",score:3);
//啥都没有过
//属性describe 是一个()->String 类型,后面跟的是他的值,它的值刚好是一个闭包类型 ,但是没有执行,我们让它执行一下
let pd = p7.descibe();
//运行结果
//闭包执行了
//其实我们还可以使用下面的等价代码
class Person8 {
    var name : String;
    var score : Int;
    init(name : String, score : Int) {
        self.name = name;
        self.score = score;
    }
    let describe: ()->String = myDescribe3;//赋值个闭包
}

//获取时间
func getTime4() -> Date{
    return Date();
}

func myDescribe3() -> String{
    return "我在\(getTime())被创建了";
}
let p8 = Person8(name: "小星星",score:3);
let pd8 = p.descirbe;

//搞清楚上面两者的区别

//需求: 有个自定义类,类中有一个数组,数组中包含20位斐波那契数列
//F(0)=0，F(1)=1, F(n)=F(n-1)+F(n-2)（
class Calculate2 {
    var fibo : [Int] = {
        //定义一个数组
        var nums : [Int] = [];
        func Func(n:Int) -> Int{
            if n < 2{
                return n;
            }else{
                return Func(n: n-1) + Func(n: n-2);
            }
        }
        
        for i in 0..<20{
            nums.append(Func(n: i));
        }
        return nums;
    }();
}

let c = Calculate2();
print(c.fibo);







