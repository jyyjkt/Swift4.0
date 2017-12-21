//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//1.类的定义
//2.属性定义
//3.类的方法创建
//4.对象方法定义
//5.初始化
//6.类的释放
//7.给类添加协议
//8.继承
//9.重写

//1 如何定义一个类
class Shape {
    var numberOfSides = 0 //属性
    //对象方法
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides.";
    }
    //类方法
    class func shapeDescription() -> String {
        return "我是一个定义形状的类";
    }
}

Shape.shapeDescription();

//初始化
class NameShape {
    var numberOfSides : Int = 0;
    var name : String = ""
    //注意初始化前面没有func
    init(name : String) {
        self.name = name;
        print(self.name);
    }
}

NameShape(name: "你好");

//继承
class NameShape2 {
    var name : String;
    var numberOfSide : Int?
    init(name : String) {
        self.name = name;
    }
}

class Square : NameShape2 {
    var sideLength : Double
    init(sideLength : Double, name : String) {
        self.sideLength = sideLength;
        super.init(name: name);
        numberOfSide = 4;
    }
}

//计算属性setter 和 getter
class Circle {
    var area : Double = 0.0;
    var r : Double {
        set{
            area = newValue * newValue * 3.1415926;
        }
        get{
            return sqrt(area / 3.14158926);
        }
    }
}

//监控属性willSet和didSet,顾名思义,就是用来检测属性值的变化.
class Circle2 {
    // 监控面积的变化,修改半径
    var r: Double = 0.0;
    var area: Double = 0.0{
        
        
        willSet{
            r = sqrt(newValue / 3.1415926);
            print(r);
        }
        
        didSet{
            print(r);
        }
        
    }
    
//    var r: Double = 0.0 {
//        willSet{
//            area = newValue * newValue * 3.1415926;
//            print(area);
//        }
//    }
    
}
Circle2().area;

//运行会报错,因为循环检测了,这个编译不会出错的,所以不用在两个基本类型之间相互检测,两个对象之间是可以的


//添加协议

// 协议1
protocol LoveMusic{
    func songMusic();
}

//协议2
protocol Draw{
    func draw();
}

//给类添加协议
class Student : LoveMusic,Draw{
    var name = "小明";
    var music : String?;
    
    func addMusic(name : String) {
        music = name;
    }
    
    func draw() {
        print("会画画");
    }
    
    func songMusic() {
        print("会唱歌");
    }
}

//重写
//1.重写计算属性
//2.重写对象方法
//3.重写类方法
//4.重写初始化方法
//5.重写存储属性(只能扩展检测,不能重写值)

//定义父类
class Person {
    var name : String
    var rename : String {
        return self.name;
    }
    init(_ name : String) {
        self.name = name;
    }
    func describe() -> String {
        return self.name;
    }
    class func describeClass() -> String{
        return "这是一个描述的类";
    }
    
}

//重写父类
class Man:Person{
    var score : Double;
    // 重写计算属性
    override var  rename: String{
        set{
            self.name = newValue;
        }
        get{
            return self.name;
        }
    }
    //重写初始化
    override init(_ name: String) {
        self.score = 0.0;
        super.init(name);
    }
    //重写对象方法
    override func describe() -> String {
        return self.name + "\(self.score)";
    }
    //重写类方法
    override class func describeClass() -> String {
        return "我是描述男人的类";
    }
    
}

class Car1 {
    var name : String? = "奔驰";
    var currentSpeed : Double = 0.0;
    var descirption : Double = 0.0;
    var myName : String? = "250";
}


//重写存储属性列子,重写后,它的初始化的值依然是父类的初始化的值
class AutomaticCar : Car1 {
    override var currentSpeed: Double{
        didSet{
            descirption = Double(currentSpeed / 10.0);
        }
    }
    override var myName: String? {
        didSet{
            
        }
    }
}
//重写计算属性例子
//重写下标方法

//重写计算属性的时候,只能增加功能,不能减少功能,比如父类的计算属性为(set get) 重写的话,只能全部重写,但是如果父类只有get方法,可以给子类增加set功能
//重写监测属性,不能有初始化的值

//问题:怎么才能不让重写计算属性,下标,方法,或者不让继承.
//使用关键字final

//类型检测
//a.is的使用
class Person2 {
    
}

class Teacher : Person2 {
    var name : String
    init(name : String) {
        self.name = name;
    }
}

let teacher = Teacher(name:"酷走天涯");
var persons:[Any] = [];
persons.append(teacher);
let person = Person2();
persons.append(person);

for person in persons {
    // 检测类型
    if person is Teacher {
        print("我是Teacher");
    }
    
    if person is Person2 {
        print("我是Person");
    }
}

//b.as? 的使用
for person in persons {
    // 检测类型
    if let p = person as? Teacher {
        print("我是Teacher");
    }
    if let p = person as? Person2 {
        print("我是Person");
    }
    
}

//c.as!的使用
let teacher1 : Any = Teacher(name: "酷走天涯");
let p1 = teacher as! Person2;
print("输出\(p1)");
//注意:
//一旦teacher不是Person类型或者它的子类,系统就会报错.

//建议使用
let p = teacher as? Person2;

//d.更多应用请看下面代码
//类
class Movie {
    var name = "我的世界";
}
//闭包           前面是参数String方法返回值是String  in 后面是实现
var callBack = {(str:String)->(String) in
    return str;
};



let things : [Any] = [0,0.0,1,-1.0,1.0,3.0,"str",(1.0,3.0),Movie(),callBack];
for thing in things {
    switch thing {
    case 0 as Int://如果值等于0 请检测是不是Int
        print("zero as an Int");
    case 0 as Double://和上面类型
        print("zero as a Double");
    case let someInt as Int:// 模式匹配上面的值,检测是不是Int
        print("an integer value of \(someInt)");
    case let someDouble as Double where someDouble > 0:// 模式匹配上面的值 检测是不是double 并且判断它是不是大于0
        print("a positive double value of \(someDouble)");
    case is Double: // 检测是不是double类型
        print("some other double value that I don't want to print");
    case let someString as String: // 模式匹配是不是String类型
        print("a string value of \"\(someString)");
    case let (x,y) as (Double,Double): // 模式匹配是不是元祖类型,并且检测数据类型
        print("an (x,y) point at \(x),\(y)");
    case let movie as Movie:
        print("a movie called \(movie.name)");
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"));
        
    default:
        print("something else");
    }
}


//注意事项
//
//1.对象中的所有变量或者常量在定义时如果不初始化,在对象初始化的时候,必须初始化,这个是swift安全性考虑,可选类型没有强制性要求初始化,因为系统默认给可选类型初始化为nil
//
//2.初始化顺序
//
//1.首先在自己的初始化方法中先给自己的属性初始化
//2.然后调用父类的初始化
//3.最后修改父类的属性






