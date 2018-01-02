//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//必须知道的
//共同点
//a.定义存储属性
//b.定义函数
//c.定义下标,使用下标访问自己的值
//d.定义初始化设置自己的初始化状态
//e.扩展自己的功能
//f.实现协议提供某种特定的标准功能

//不同点(类有更多功能)
//a.类可以继承,结构体不能继承
//b.类能够在运行时检查和解释类实例的类型
//c.Deinitializers 使一个类的实例来释放任何资源分配.
//d.类有引用计数,允许对象多次引用.

//验证
//定义
//定义类
class StudentC{
    
}

// 定义结构体
struct StudentS{
    
}

/////////////////////////////
////////////共同点/////////////
//////////////////////////////

//A : 定义存储属性
//定义类
class StudentQ{
    var name : String!;
}
//定义结构体
struct StudentW{
    var name : String;
}

//提示
//在类中定义属性必须要注意,如果你定义的存储属性不是可选值类型,必须进行初始化,不然编译会报错
//但是在结构体不会报错,因为系统默认会给结构体创建初始化方法

//B: 定义函数

//定义类
class StudentE{
    static var des : String = "学生的类"; //不是可选值必须初始化
    var name : String!;//可选值
    func getName() -> String{
        return name;
    }
    
    class func describe() -> String {
        return des;
    }
    
    static func getClassDescribe() -> String {
        return des;
    }
    
}

//定义结构体
struct StudentR{
    static var des: String = "学生的结构体";
    var name : String;//不是可选值,结构体中系统默认给结构体创建初始化
    static func describe() -> String{
        return "这是一个定义学生的类";
    }
}

// 类可以使用关键字static class 修饰方法,但是结构体只能使用关键字static修饰


//C: 扩展下标
class StudentT{
    var names : [String] = ["1","2","3","4","5"];
    subscript (index : Int) -> String?{//下标
        get{
            if names.count <= index {
                return nil;
            }
            return names[index];
        }
    }
}

//定义结构体
struct StudentY{
    var names:[String] = ["1","2","3","4","5"];
    subscript (index:Int) -> String?{
        get{
            if names.count <= index{
                return nil;
            }
            return names[index];
        }
    }
}

//执行
let student1 = StudentT();
print(student1[8]);

//D :初始化
//定义类
class StudentU{
    var name : String;
    init(name : String) {
        self.name = name;
    }
}

let studentU1 = StudentU(name: "小星星");
let studentU2 = StudentU(name: "学习");

//提示
//结构体默认会有初始化方法

struct StudentO{
    var name : String;
}
let studentU3 = StudentO(name: "学习");

//E :扩展功能
//扩展类
extension StudentU{
    func describe() -> String{
        return "学生" + self.name;
    }
}
//扩展结构体
extension StudentO{
    func describe() -> String{
        return "学生" + self.name;
    }
}

//F: 实现协议

//定义一个协议
protocol Capacity{
    func draw() // 协议方法
}

//定义类
class StudentF : Capacity {
    // 实现协议方法
    internal func draw() {
        print("类实现输出绘画");
    }
    
    var name : String
    init(name : String) {
        self.name = name;
    }
}

// 定义结构体
struct StudentG : Capacity {
    //实现协议方法
    internal func draw() {
        print("结构体实现输出绘画");
    }
    var name : String;
}

/////////////////////////////
////////////不同点/////////////
//////////////////////////////

//A : 继承
// 定义基类
class PersonG{
    var name : String;
    init (name : String) {
        self.name = name;
    }
}
// 定义类
class StudentG1 : PersonG{
    var score : Float;
    init(name : String, score : Float) {
        self.score = score;
        super.init(name: name);
        print("\(super.name)");
//        self.name = "星星";
        self.name = name;//可以不写
    }
}

let studentG1 = StudentG1(name : "小星星", score : 3);
studentG1.score;
studentG1.name;

//结构体不能继承
struct PersonJ{
    var name : String;
}

//struct StudentJ : PersonG{ // 错误 不能继承
//
//}



//提示:
//结构体不能继承结构体

//.mutating 关键字的作用
//结构体和枚举都是值类型,但是默认值类型的对象方法不能修改属性值,但是要修改怎么呢?
//就必须在函数前面加mutating

//例子1
protocol Action{
    var myY : Int{
        mutating get
    }
}

struct Point{
    var x: Int;
    var y: Int;
    // 结构体或者枚举修改值必须在函数前面加mutating
    mutating func modifyX(x:Int){
        self.x = x
    }
    // 注意计算属性,mutating 要加载getter方法前面
    var myY:Int{//计算属性注意
        mutating get {
            self.y = self.y*2
            return y
        }
    }
}

// 例子2
struct PointK {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = PointK(x: x + deltaX, y: y + deltaY)
    }
}
// 例子3
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

//提示
//1.计算属性setter方法不用修改属性值不用添加mutating;
//2.计算属性setter方法中修改属性值的时候,一定要加mutating;
//检测两个对象地址是不是相同的
class StudentZ{
    var name : String;
    init(name : String) {
        self.name = name;
    }
}

let studentz1 = StudentZ(name: "小星星");
let studentz2 = studentz1;
if studentz1  === studentz2 {//=== 是判断内存是否相同
    print("地址相同");
}
//运行结果:
//地址相同
//结论:
//类是引用类型,结构体是值类型,不能使用===/!== 判断地址

//测试
// 定义结构体
struct StudentX{
    var name:String
}
let studentx1 = StudentX(name: "星星")
var studentx2 = studentx1
studentx2.name = "小星星";
print(studentx1.name)
print(studentx2.name)
//值不同 因为结构体是值类型

//.Deinitializers 使一个类的实例来释放任何资源分配
//定义类
class StudentV{
    var name : String
    init(name : String) {
        self.name = name;
    }
    deinit {
        //释放资源
        print("释放了");
    }
}

// 结构体没有deinit方法

//高级内容
// a.什么时候用结构体
// 1.该结构体的主要目的是封装几个相对简单的数据值
// 2.如果你希望你的结构在传递的时候被赋值而不是引用
// 3.希望结构在传递的时候,内部的属性也被赋值而不是引用
// 4.不需要继承属性或者方法

//主要应用场景(只包含非对象类型)

//1.定义Size
//2.定义范围Range
//3.定义坐标XYZ
//...

// b.什么时候用类
// 除了上面的场景外,其余都是用类对象.
// 官方建议:
//定义一个类,并创建该类的实例和管理以引用的方式传递。在实践中,这意味着大多数自定义数据结构应该类,而不是结构。

//用性能说话

//测试1 : 循环创建类和结构体
//a.执行100_000次 (条件好1亿次)创建

//定义类
class StudentA{
    var name : String;
    init(name : String) {
        self.name = name;
    }
}

// 统计时间
let date = Date();
for i in 0...100_000{
    let s = StudentZ(name : "小星星");
}
print(Date().timeIntervalSince(date));

//b.执行100_000次 (条件好1亿次)创建
// 定义结构体
struct StudentD{
    var name : String;
    init(name : String) {
        self.name = name;
    }
}

let date1 = Date();
for i in 0...100_000 {
    let sd = StudentD(name: "小星星");
}
print(Date().timeIntervalSince(date1));

//我们上面的属性为基本数据类型,我们将属性改为对象测试一下速度
//c.创建10_000_000个对象
let date2 = Date();
class StudentL{

}
for i in 0...100_000{
    let sl = StudentL();
}
print(Date().timeIntervalSince(date2));

let date3 = Date()
struct StudentP{
}
for i in 0...100_000{
    let sl = StudentP();
}
print(Date().timeIntervalSince(date3));

//测试2:创建1000_000个对象或者结构体放在数组中,查看内存占用率;//这个用测试工具具体测试试试
//a.循环创建1000_000个对象
class StudentH {
    var name : String
    init (name : String) {
        self.name = name;
    }
}
var studentH: [StudentH] = [];
//创建
for i in 0...1000 {
    let s = StudentH(name : "炫酷");
    studentH.append(s);
}
//b.循环创建1000_000个结构体
struct StudentJ {
    var name : String;
    init(name : String) {
        self.name = name;
    }
}

var studentJ : [StudentJ] = [];
for i in 0...1000{
    let s = StudentJ(name : "金刚");
    studentJ.append(s);
}


//照样,我们将基本属性改为对象继续测试
//c.10_000_000个对象添加到数组中,正常用1000差不多了
class StudentK {
    var date = NSDate();
}

var studentk:[StudentK] = [];
for i in 0...1000 {
    let s = StudentK();
    studentk.append(s);
}

//d.10_000_000个对象添加到数组中
var studentk1:[StudentK] = [];
for i in 0...1000{
    let s = StudentK()
    studentk1.append(s)
}
//结论应该是:具体以后测试部分讲解,创建相同属性的结构体比类更加节省内存

//对1_000_000个结构体实体和对象进行排序,测试消耗时间
//1.对1000个结构体实体进行排序

class StudentText1 {
    var name : String
    init (name : String) {
        self.name = name;
    }
}
var studentT1: [StudentText1] = [];
//创建
for i in 0...10_000 {
    let s = StudentText1(name : "\(Int(arc4random()%100)+1)");
    studentT1.append(s);
}
//b.循环创建1000_000个结构体
struct StudentText2 {
    var name : String;
    init(name : String) {
        self.name = name;
    }
}

var studentT2 : [StudentText2] = [];
for i in 0...10_000{
    let s = StudentText2(name : "\(arc4random()%100)+1)");
    studentT2.append(s);
}
//类部分
let dateA1 = Date()
studentT1.sort { (stu1, stu2) -> Bool in
    return stu1.name > stu2.name
}
print("类的部分:\(Date().timeIntervalSince(dateA1))");

//结构体部分
let dateA2 = Date();
studentT1.sort { (stu1, stu2) -> Bool in
    return stu1.name > stu2.name
}
print("结构体部分:\(Date().timeIntervalSince(dateA2))");

//结论: 在数据量比较大的排序中,结构体排序的速度比较慢,因为结构体是值类型,排序的时候,需要大量的赋值运算。而对象只需要交换地址即可。



