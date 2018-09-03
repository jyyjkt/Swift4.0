//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//1. 基本数据类型
//1_1 使用let定义常量
let myConstant = 42;
//1_2 使用var定义变量
var myVariable = 42;
myVariable = 50;
//1_3 有初始化你可以指定变量类型或者让系统自己去推断
let implicitInteger = 70;
let implicitDouble = 70.0;
let explicitDouble : Double = 70;
//1_4 没有初始化,你要必须指定变量类型
var numb : Double;
//1_5 在swift中字符串是基本类型
let label = "The width is";
let width = 94;
//1_6 如何实现数据之间的相互转换
let width_a = 94;
let widthLabel : String = String(width_a);

//1_7 使用最简单的方式将其他数据类型编程字符串
let apples = 3;
let oranges = 5;
let fruitSummary = "I have \(apples + oranges) pieces of fruit";
//1_8 数组也是基本类型,不再是OC中引用类型
var shoppingList = ["catfish","water","tulips","blue paint"];
shoppingList[1] = "bottle of water";
//1_9 如何定义一个空数组
let emptyArray = [String]();
let emptyArray_1 : [String] = [];
//1_10 字典也是基本类型
var occupations = ["Malcolm":"Captain","Kaylee":"Mechanic"];
//1_11 将数组清空
var shoppingList1 = ["1","2"];
shoppingList1 = [] //如果你这个类型,是系统可以推断的类型,你可以这样清空数组或者初始化
//1_12 定义一个空字典
let emptyDictionary = [String:Float]();
let emptyDictionary_1 : [String:Float] = [:];
//1_13 清空字典
var dictionary = [1:"2"];
dictionary = [:];
//2 可选值
let nickName : String? = nil;
//"?" 这个简单意思,你的变量可能为nil，或者你可能将nil赋值给它,需要给变量定义的时候加上"?",否则一旦你将nil赋值给没有加"?"的变量,编译就会报错
//举个例子理解一下,我们假如有一个盒子,盒子是一个存在的物体,swift不允许有空值出现,那我们怎么办呢？就需要把空值装到一个盒子里面,系统检查的时候,发现有一个盒子,哦,好的,检测通过,但是如果你把盒子打开系统就会报错
let nickName_1 : String? = "酷走天涯";
print(nickName_1)
//发现有个Optional 就说明这个变量被包着,那么怎么才能不让它包裹着呢? 很简单, 给变量加一个"!"
print(nickName_1!)
//我们还有一种解包的方式
let nName : String? = nil;
let fullName : String = "XUJIE";
let informalGreeting = "Hi \(nickName ?? fullName)";//如果第一个解包值发现为nil,则使用第二值
print(informalGreeting);

//3 控制流
//3_1 for...in循环
//遍历数组
let individualScores = [75,43,103,87,12];
var teamScore = 0;
for score in individualScores {
    if score > 50 {
        teamScore += 3;
    }else{
        teamScore += 1;
    }
}
print(teamScore);

//遍历 字典
let interestingNumbers = ["Prime":[2,3,5,7,11,13],
                          "Fibonacci":[1,1,2,3,5,8],
                          "Square":[1,4,8,16,25]]
var largest = 0
for (kind,numbers) in interestingNumbers {
    for number in numbers {
        largest = number;
        print(largest);
    }
}
//还可以这样使用循环
var total = 0;
for i in 0...4 {
    total += i;
}
print(total);
//3_2 Switch
let vegetable = "red pepper";
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.");
case "cucumber","watercress":
    print("That would make a good tea sandwich.");
case let z where z.hasSuffix("pepper"):
    print("Is it a spicy \(z)?");
default:
    print("Everything tastes good in soup.");
}
//注意 z 什么 随便写个变量名就可以了

//3_3 while循环
var n = 2;
while n < 100 {
    n = n * 2;
}
print(n);

//3_4 repeat...while
var m = 2;
repeat {
    m = m * 2;
} while m < 100
print(m);

//4 函数和闭包
//4_1 定义函数
func greet(person: String, day: String) -> String{
    return "Hello \(person),today is \(day)";
}
greet(person: "John", day: "Wednesday");
//4_2 缺省参数名
func greet_1(_ person: String,_ day: String) -> String{
    return "Hello \(person),today is \(day).";
}
greet_1("John", "Wednesday");
//4_3 返回值可以是元祖类型
func calculateStatistics(scores: [Int]) -> (min : Int, max : Int, sum : Int){
    var min = scores[0];
    var max = scores[0];
    var sum = 0;
    for score in scores {
        if score > max {
            max = score;
        }else if score < min {
            
        }
        sum += score;
    }
    return (min,max,sum);
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9]);
print(statistics.sum);
print(statistics.2);

//4_4 定义多个类型相同的参数
func sumOf(numbers: Int...) -> Int {
    var sum = 0;
    for number in numbers {
        sum += number;
    }
    return sum;
}
sumOf();
sumOf(numbers: 42,597,12);

//4_5 函数嵌套使用
func returnFifteen() -> Int {
    var y = 10;
    func add() {
        y += 5;
    }
    //方法内部定义方法,声明周期为方法
    add()
    return y;
}

let count = returnFifteen()

//4_6 函数当返回值
func makeIncrementer() -> ((Int) -> Int){
    func addOne(number: Int) -> Int {
        return 1 + number;
    }
    return addOne;
}
var increment = makeIncrementer();//increment是(Int) -> Int
increment(7)

//4_7 函数当参数
func hasAnyMatches(list: [Int], condition:(Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true;
        }
    }
    return false;
}

func lessThanTen(number: Int) -> Bool{
    return number < 10;
}
var numbers = [20, 19, 17, 12];
hasAnyMatches(list: numbers, condition: lessThanTen);


//5 对象和类
//5_1 定义一个类
class Shape {
    var numberOfSides = 0;
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides.";
    }
}

//5_2 初始化方法,和对象方法
class NamedShape {
    var numberOfSides: Int = 0;
    var name : String
    //初始化方法
    init(name:String) {
        self.name = name;
    }
    //成员方法定义
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides.";
    }
}

//5_3 继承
class Square: NamedShape {
    var sideLength : Double // 如果不是可选类型 必须在初始化方法中初始化
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength;
        super.init(name: name) //调用父类的初始化方法
    
        numberOfSides = 4 // 给父类的属性赋值之前必须先调用父类的初始化方法
    }
    
    func area() -> Double {
        return sideLength * sideLength;
    }
    
    // 重写父类的方法
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)";
    }
    
}

//5_4 setter 和 getter
class EquilateralTriangle : NamedShape {
    var sideLength : Double = 0.0; // 定一个属性
    init(sideLength: Double, name: String) {
        super.init(name: name);
        self.sideLength = sideLength;
        numberOfSides = 3;
        
    }
    //这个是setter 和 getter方法的定义
    var perimeter : Double {
        get{
            return 3.0 * sideLength;
        }
        set{
            sideLength = newValue / 3.0;
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)";
    }
    
}

//观察属性
class TriangleAndSquare {
    // 定一个三角形对象
    var triangle: EquilateralTriangle {
        willSet{
            //triangle的新值赋值给square的值
            square.sideLength = newValue.sideLength;
        }
    }
    //定义一个正方形对象
    var square: Square {
        willSet{
            triangle.sideLength = newValue.sideLength;
        }
    }
    //通过检测属性,我们让两个对象的边保持一样长
    init(size: Double, name:String) {
        square = Square(sideLength: size, name: name);
        triangle = EquilateralTriangle(sideLength: size, name: name);
    }
    
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

//6 枚举类型
//1_1 定义
enum Rank : Int { // Int 设置枚举类型
    //定义枚举值设置值
    case ace = 1;
    //可以case后面一次定义多个枚举值
    case two,three,four,five,six,seven,eight,nine,ten
    case jack,queen,king
    
    // 定义函数 如果多人合作的时候,可以使用这个让别人更加了解你定义的属性的含义
    func simpleDescription() -> String {
        switch self {// self 就是这个枚举本身
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue);
        }
    }
    
}

// 使用
let ace = Rank.king;
let aceRawValue = ace.rawValue;


enum Suit : String {
    case normal = "look";
    case change
    case end
    
    func simpleDescription() -> String {
        switch self {// self 就是这个枚举本身
        case .normal:
            return "look"
        case .change:
            return "change"
        default:
            return String(self.rawValue);
        }
    }
    
}


//7 结构体
//定义
struct Card{
    //定义结构体
    var rank: Rank;
    var suit: Suit;
    //结构体内可以定义方法
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

//使用
let threeOfSpades = Card(rank: .three, suit: .normal)
let threeOfSpadesDescription = threeOfSpades.simpleDescription();


//8 协议
//定义
protocol ExampleProtocol {
    var simpleDescription: String {
        get
    }
    mutating func adjust()
}

//给类添加协议
class SimpleClass : ExampleProtocol {
    var simpleDescription: String = "A very simple class.";
    var anotherProperty: Int = 69105;
    func adjust(){
        simpleDescription += " Now 100% adjusted";
        print("输出内容:\(simpleDescription)");
    }
}
let simpleClass = SimpleClass();
simpleClass.simpleDescription;
simpleClass.adjust();
simpleClass.simpleDescription;

//给结构体添加协议
struct SimpleStructure : ExampleProtocol {
    var simpleDescription: String = "A simple structure";
    mutating func adjust() {
         simpleDescription += "(adjusted)"
         print("输出内容:\(simpleDescription)");
    }
}
var simpleStructure = SimpleStructure();
simpleStructure.simpleDescription;
simpleStructure.adjust();
simpleStructure.simpleDescription;

//9 扩展
//例子:给int添加一个协议
extension Int: ExampleProtocol{
    
    mutating func adjust() {//协议实现并且重写
        self += 42;
        print("输出Int:\(self)");
    }
    
    var simpleDescription : String {
        return "The number \(self)";
    }
    
}
print(7.simpleDescription);

//10 错误操作
//10_1 定义一个错误枚举
enum PrinterError : Error {
    case outOfPaper;
    case noToner;
    case onFire;
}
//10_2 定义一个有异常处理能力的函数

func send(job: Int, toPrinter printerName: String) throws -> String {
    
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner;
    }
    
    if printerName == "Gutenberg" {
        throw PrinterError.onFire;
    }
    
    return "Job sent";
    
}

//捕捉异常
do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner");//使用函数判断
    print(printerResponse);
    
} catch {
    print(error);//输出error
}

//异常分类处理
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg");
    print(printerResponse);
    
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.");
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).");
} catch {
    print(error);
}







