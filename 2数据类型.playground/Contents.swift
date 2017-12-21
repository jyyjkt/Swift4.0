//: Playground - noun: a place where people can play

import UIKit

//------- 数据类型 --------

//1 常量定义
let myConstant = 42;
let myConstantInt : Int = 42   // 指定类型定义
let name = "酷走天涯"   // 类型推断定义
var red,green,blue: Double  //单行定义多个变量
let cat = "🐱";print(cat)   //如果有; 单行可以写过个语句
let binaryInteger = 0b10001  //2进制数字定义 0b表示二进制
let octalInteger = 0o21 //八进制数字定义 0o表示八进制
let hexadecimalInteger = 0x11 //16进制数组的定义 0x表示16进制
let exponentDouble = 0xC.3p0 //16进制科学技术发定义
let oneMillion = 1_000_000 //可以使用_线将数字分开,便于人知

//2 变量定义
var myVaruable = 42;

//3 类型转换
let num1 = 12;
let str = "\(num1)";
let num2 = Int(num1);
let num3 = Int(str);
let num4 = Double(str);

//4 数组的几种定义方式
let list1 = ["你好","2","3","4"];
var list2 : [String] = ["你好","2","3","4"];
var list3 : [Any] = ["你好","2","3","4",UILabel(),"2","3"];
let list5 : NSMutableArray = ["1","2","3","4"];

//4_1 清空数组
list2.removeAll() // 如果定义为var
list2 = [] // 如果定义为var
list5.removeAllObjects() // var 和 let 都可以

//4_2 取代操作
list3[4...6] = ["Bananas","Apples"] // 将数组4...6的范围用指定的数组取代

//4_3 插入操作
list3.insert("第一位", at: 0);

//5 字典
let dic1 : [String : Int] = [:];
let dic2 = [String : Int]();
let dic3 : NSDictionary = NSDictionary();
let dic4 : NSMutableDictionary = [:];

//5_1 获取数据类型的最大和最小值
let minValue = UInt8.min;
let maxValue = UInt8.max;

//5_2 给数据类型设置别名
typealias Code = Int32;// 给Int32 设置别名
var tel :Code = 376823;

//6 元祖类型
//6_1 定义
//第一种定义方法
let http404Error = (404,"Not Found") // 定义元祖类型常量
let code = http404Error.0;
let error = http404Error.1;
//第二种定义方法
let http404Error2 = (code:404, error:"Not Found") // 定义元祖类型的常量
let code2 = http404Error2.code;
let error2 = http404Error2.error;
//也可以像上面一个获取对应的数据
//第三种定义方法
let http404Error3 : (code : Int, error : String) = (404, "Not Found") //定义元祖类型的常量
let code3 = http404Error3.code;
let error3 = http404Error3.error;
//第四种定义方法
let http404Error4 : (code : Int, error : String) = (code:404,error:"Not Found") //定义元祖类型常量
let code4 = http404Error4.code;
let error4 = http404Error4.error;
//第5种定义方法
var http404Error5 : (code : Int, error : String) = (_:404,_:"Not Found");

//提示
//第四种定义的时候,等号坐标和右边的元素名称必须对应,不然系统会报错,建议不使用这种方式定义

//6_2 分解变量
let (statusCode, _) = http404Error; // 缺省不需要的值
let (statusCode1,statusMessag2) = http404Error;

//6_3 赋值
var http404Error6 : (code: Int,error : String);//定义元祖
http404Error6 = (code : 404,error : "Not Found");//部分名称缺省
http404Error6 = (404,error : "Not Found");//部分名称缺省
http404Error6 = (404,"NotFound");//全部名称缺省
http404Error6 = (_:404,"Not Found"); //可以使用_代替名称
http404Error6 = (code:404,"Not Found"); //不允许这样必须,名称必须和定义时保持一致

//7 字符串和字符
let string = "hello,"+"word" // Swift中终于可以这么方便处理字符串的拼接了
var nameText = "swift";
nameText.append("你好");//也可以这样拼接 name必须为var
var anotherEmptyString = String() // 定义空字符串
// 判断字符串是否为空
if anotherEmptyString.isEmpty {
    print("Nothing to see here");
}
//获取字符串中每个字符
for character in "Dog!🐶123456".characters {
    //弃用
    print(character)
}
//新版使用
for character in "Dog!🐶123456" {
    print(character);
}

for index in "Dog!🐶123456".characters.indices {
    //弃用
    print("\("Dog!🐶123456"[index])", terminator: "////")
}
//新版使用
for index in "Dog!🐶123456".indices {
    print("\("Dog!🐶123456"[index])", terminator: "////");
}

//定义字符
let exclamationMark : Character = "!";
//定义字符串数组
let catCharacters : [Character] = ["C","A","T","!","🐱"];
//字符数组转字符串
let catString = String(catCharacters);
//Unicode编码
let precomposed : Character = "\u{D55C}";
let regionalIndicatorForUS : Character = "\u{1F1FA}\u{1F1F8}"

var dogName = "🐶a我";
print(dogName.count);// 3 一个不管是什么都算一个字符
//截取字符串
let greeting = "Guten Tag!";
//截取单个
greeting[greeting.startIndex];
//截取一段
greeting[greeting.index(greeting.startIndex, offsetBy: 2)..<greeting.index(greeting.endIndex, offsetBy: -3)];
//在指定位置插入字符串
var welcome = "welcome swift"
welcome.insert("!",at:welcome.endIndex);
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex));
//在移除字符串
welcome.remove(at: welcome.index(before: welcome.endIndex));
let range = welcome.index(welcome.endIndex, offsetBy: -4)..<welcome.endIndex;//取得范围
print(range);
welcome.removeSubrange(range);
// 前缀和后缀

var scene = "开开心心hahahahh";
if scene.hasPrefix("开开") {//前缀
    print("输出内容");
}//后缀 hasSuffix

//获取对应的编码数据
var dogString = "狗狗说话"
for codeUnit in dogString.utf16 {
    print("\(codeUnit)",terminator:"");
}

//8 深入
extension Int {
    func description() -> String {
        return "我是一个Int类型的数字\(self)"
    }
}
print(3.description());
//协议扩展的好处1
//定义个协议
protocol NumberProtocol{
    func numberDescription()->String
}
//扩展实现协议
extension Int:NumberProtocol{
    func numberDescription()->String{
        return "我是一个Int类型的数字\(self)";
    }
}
extension Double:NumberProtocol{
    func numberDescription() -> String {
        return "我是一个Double类型的数字\(self)";
    }
}

// 定义一个协议类型
var numberProtocol : NumberProtocol = 3;
numberProtocol.numberDescription();
numberProtocol = 3.4;
numberProtocol.numberDescription();
//通过这种方法,我们可以给同一个变量,赋值不同类型的值了,其实这个符合Swift的语法要求,只是我们利用它的灵活性,达到了我们目的.



//协议的好处2
//需求
//给Int 类型和Double 类型增加一个方法,判断它的数据类型
//定义一个协议
protocol TextNumberProtocol{

}

//扩展实现协议
extension Int:TextNumberProtocol{
    
}

extension Double:TextNumberProtocol{
    
}

//给协议扩展方法
extension TextNumberProtocol {
    func description() -> String {
        if self is Int {
            return "我是一个Int类型的数字\(self)";
        }
        if self is Double {
            return "我是一个Double类型的数字\(self)";
        }
        return "我既不是Int也不是Double类型数字\(self)";
    }
}

print(3.44.description());
print(3.description());
//Self的好处
//专门用于不确定数据类型
// 需求: 给所有数字类型,扩展一个平方的函数,返回自己的操作.
//定义个协议
protocol TextOneNumberProtocol {
    
}

//扩展实现协议
extension Int : TextOneNumberProtocol {
    
}

extension Double : TextOneNumberProtocol {
    
}

//给协议扩展方法
extension TextOneNumberProtocol {
    // 我们不确定返回的self 到底是什么类型
    func squareValue() -> Self {
        if self is Int {
            let n = self as! Int;
            return n * n as! Self;
        }
        if self is Double {
            let n = self as! Double;
            return n * n as! Self;
        }
        return 0 as! Self;
    }
   
}
print(2.44.squareValue());//平方根
print(3.squareValue());//平方根
//我只想说这个用法只是Self的冰山一角更多神奇的东西,等待我们去探索。

//你需要注意的
//1.如果指出变量类型,赋值的值必须是和他类型相同的值,不然编译不通过.
var num : Int = Int(43.0) //(编译错误)
//2.浮点数类型推断出来的默认为Double类型
let numDouble = 30.0 //Double
//3.Float 类型的值 赋值给Double类型也必须转换
let numFloat : Float = 30.0;
let explicitDouble : Double = Double(numFloat);
//4.数字之间的转换结果为非可选值,数字转字符串也是非可选值,但是字符串转数字就是可选值(因为它有可能转换失败)
let number1 = 7;
let strText1 = "测试";
let strPut1 = "\(number1)";
let strPut2 = String(number1);
let numPut2 = Int(num1);
let numPut3 = Int(strText1);
let numPut4 = Double(strText1);

//字符串33.0转Int类型只会是nil
//不会是33因为字符串33.0不是Int类型转换失败,但是浮点数33.0可以转换为33
//5.不能推断出下面的了类型
//let listText1 = ["你好","2","3","3",3]//不能这样写,Swift 推断不出来
//应该:
let listText2 = ["你好","2","3",3] as! [Any];
let listText3 : Any = ["你好","2","3",3];
let listText4:NSArray = ["你好","3","2",3];
let listText5:NSMutableArray = ["你好","3","2",3];
//6.使用Dictionary定义字典必须指定数据类型
//let dicText1 : Dictionary = [:]//错误
let dicText2 : Dictionary = [String : Int]()//正确
//无聊的测试
//类型推断对性能的影响5000000
for i in 0...50 {
    
}
//类型推断对性能没有影响
//Array和NSArray,NSMutableArray的区别
//1.测试类型
var listA1:Array =  ["你好","2","3","4"];
let listA2 = listA1;
listA1[1] = "哈哈"
print(listA1);
print(listA2);

var listB1:NSMutableArray = ["你好","2","3","4"];
let listB2 = listB1;
listB1[1] = "哈哈";
print(listB1);
print(listB2);

//2.测试内存占用
func add(){
    var array : [Any] = [3];
    for _ in 0...1000 {//正常电脑好多写点
        array.append(3);//看内存变化
    }
}

//执行代码前 3.5M 执行代码后 3.8 M 内存占用最高 308.6M

func add1() {
    let array : NSMutableArray = NSMutableArray();
    for i in 0...100000 {
        if i == 1000000 {
            //结束时执行内存
        }
    }
}

//执行代码前3.5 M ,代码执行完毕后 17.3M,内存占用最高为 422.3
//3.我们使用Array放对象
func add2(){
    var array: [Any] = [];
    for _ in 0...100 {//多了内存变化
        array.append([UILabel()]);
    }
}
//运行圈3.5运行后10.5最高占内存21.5,发现内存没有释放完毕.
autoreleasepool {
    var array:[Any] = [];
    for i in 0...100 {
        array.append([UILabel()])
    }
}
//Swift 中新增的Array 存放非对象类型,内存清理的更及时,更彻底!

//4.数据的上溢或者下溢系统都会报错
//Int8.min - 1
//Int8.max + 1
//arithmetic operation '127 + 1' (on type 'Int8') results in an overflow
//error: arithmetic operation '-128 - 1' (on type 'Int8') results in an overflow

//5.浮点数取余运算
let z = CGFloat(23.4).truncatingRemainder(dividingBy: 20)




















