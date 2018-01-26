//: Playground - noun: a place where people can play

import UIKit

//1 if...else
if true {
    //code
}else{
    //code
}

let (x,y) = (1,2);
//if x = y {//这是一个错误用法
//
//}

//判断的条件必须为true或者false不能是1,2或者存在对象,不然系统会编译错误,这点是和OC是有区别的.


//2.三目运算符(?)
let contentHeight = 40;
let hasHeader = true;
let rowHeight = contentHeight + (hasHeader ? 50 : 20);

//3.?? 的使用
//先看下面的例子
let textA : Int? = nil;
let textB = 4;
//如果a不为nil则对a进行解包,赋值将b的值付给c
let textC = textA != nil ? textA! : textB ;
print(textA);
print(textB);
print(textC);

let textD = textA ?? textB // 如果a为nil则使用b的值替换a的值,如果a不为nil,则对a解包然后将值付给a
print(textA);
print(textB);
print(textD);


//我们在看一个例子
let textA1 : Int??? = 3;
let textA2 = 4;
let textA3 = textA1 ?? textA2;
print(textA1);
print(textA3);

//答案: Optional(Optional(Optional(3)))  Optional(Optional(3))
//首先a,有三个包Optional(Optional(Optional(3))),当我们解掉第一次包后,发现值为nil,此时,我们需要将b的值替换给a,Optional(Optional(3))

//4.范围操作符 ... ..<
for index in 1..<5 {
    print("\(index) times 5 is \(index * 5)");
}

//多种逻辑操作符的结合
let enterCode = true;
let passedCode = true;
let hasDoorKey = true;
if enterCode && passedCode || hasDoorKey {
    print("Welcome!");
} else {
    print("ACCESS DENIED");
}

//for ... in
//遍历数组
let names = ["Anna","Alex","Brian","Jack"];
for name in names {
    print("Hello, \(name)!");
}

//遍历字典
let numberOfLegs = ["spider": 8, "ant": 6,"cat": 4];
for (animalName,legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs");
}

//while
var i = 100;
while i > 0 {
    i -= 1;
}

//repeat ... while
var j = 10;
repeat {
    j -= 1;
    print(j);
} while j >= 0;

//switch
//需求1:根据输入的成绩判断学生是否及格
//a.间隔法
enum TextResult{
    case Pass;
    case NoPass;
}
//b.条件判断法
func inputStudentScore(score:Float) -> TextResult {
    switch score {
    case 0 ..< 59 :
        return .NoPass;

    default:
        return .Pass;
    }
}
//需求二: 输入一个顶点判断是否在x轴上,或者y轴上,或则既不在x轴,也不再y轴上
//c.元祖法
func inputPoint(point : (Float,Float)){
    switch point {
    case (_,0):
        print("在x轴上");
    case (0,_):
        print("在y轴上");
    case (_,_):
        print("既不在x轴,也不在y轴上");

    }
}

//d.值绑定法
func inputPoint2(point : (Float,Float)) {
    switch point {
    case (let x, 0):
        print("在x轴上\(x)");
    case (0, let y):
        print("在x轴上\(y)");
    case let(x,y):
        print("即不再x轴,也不在y轴上\(x),\(y)");
    }
}
//需求:判断顶点是否在x,y轴上

//e.混合法
func inputPoint3(point : (Float,Float)) {
    switch point {
    case (let x , 0),(0, let x):// 注意必须每种模式类型相同
        print("在x轴或者y轴上\(x)");
    case let (x,y):
        print("即不在x轴,也不再y轴上\(x),\(y)");
    }
}
//控制转移声明
//a.continue
    let puzzleInput = "great minds think alike";
    var puzzleOutput = "";
    for character in puzzleInput {
        switch character {
        case "a","e","i","o","u"," ":
            continue;
        default:
            puzzleOutput.append(character);
        }
}
//b. break //跳出
let numberSymbol : Character = "三" // Chinese symbol for the number 3;
var possibleIntegerValue : Int?
switch numberSymbol {
case "1","一":
    possibleIntegerValue = 1;
case "2","二":
    possibleIntegerValue = 2;
case "3","三":
    possibleIntegerValue = 3;
case "4","四":
    possibleIntegerValue = 4;
default:
    break;
}
//c. fallthrough //穿透
let integerToDescribe = 5;
var description = "The number \(integerToDescribe)"
switch integerToDescribe {
case 2,3,5,7,11,13,17,19:
    description += " a prime number, and also";
    fallthrough;//打穿继续向下执行
default:
    description += " an integer.";
}
print(description);

//d.return
//需求: 在一个数组中查找是否存在一个整数,如果找到返回true没有返回false;
let nums = [1,2,3,4,5,6,7,9,10];
func findNum(num : Int) -> Bool{
    for number in nums {
        if num == number {
            return true;
        }
    }
    return false;
}

//e. throw
//需求:让一个a数字从0开始,每次增加一个随机数,直到数字a=1000结束循环,如果大于1000则继续从0开始循环增加
var start : Int = 0;
var final = 1000;
whileLabel : while start != final {
    start += Int(arc4random_uniform(100)) // 随机增加一个数字
    switch start {
    case 1000:
        break whileLabel;
    case let x where x > 1000:
        start = 0;
        continue whileLabel;
    default:
        break;
    }
}

//guard ...else

//需求输入学生姓名,查询学生成绩
//a.原始写法(if);
let studentScoreDic = ["小明":30.0,"小摩纳哥":99.0];
func getScoreByName(name : String!) -> Double {//先检测姓名是否为空
    if let n = name {
        if let score = studentScoreDic[n] {
            return score;
        }
    }
    return 0.0;
}

//b. guard...else
let studentScoreDic2 = ["小明":30.0,"小摩纳哥":99.0];
func getScoreByName2(name : String!) -> Double{
    //检测姓名是否为空
    guard let n = name else{
        return 0.0;
    }
    //检测学生是否存在
    guard let score = studentScoreDic2[n] else {
        return 0.0;
    }
    return score;
}
print(getScoreByName2(name: "小明"));

//c.使用??简化写法
let studentScoreDic3 = ["小明":30.0,"小摩纳哥":99.0];
func getScoreByName3(name:String!) -> Double{
    guard let n = name  else {
        return 0.0;
    }
    return studentScoreDic3[n] ?? 0.0;
}
print(getScoreByName3(name: "小明"));

//d.多条件简化法-guard版
let studentScoreDic4 = ["小明":30.0,"小摩纳哥":99.0];
func getScoreByName4(name:String!) -> Double {
    guard let n = name , let score = studentScoreDic4[n] else {
        return 0.0;
    }
    return score;
}
getScoreByName3(name: "小明");

//e.多条件简化法-if版
let studentScoreDic5 = ["小明":30.0,"小摩纳哥":99.0];
func getScoreByName5(name : String!) -> Double{
    if let str = name , let score = studentScoreDic5[str]{
        return score;
    }
    return 0.0;
}
print(getScoreByName5(name: "小明"));

//中级
//多条件判断
//需求: 输入两个数字,如果两个数字都小于100并且第一个数字小于第二个数字,按照循序输出他们
//方式一:
func inputFirstNum(num1:String,num2:String){
    if let n1 = Int(num1){
        if let n2 = Int(num2) {
            if n1 < n2  && n2 < 100{
                print("按顺序输出\(n1)<\(n2)<\(100)");
            }
        }
    }

}
//方式二:
func inputFirstNum2(num1:String,num2:String){
    if let n1 = Int(num1), let n2 = Int(num2), n1 < n2 && n2 < 100 {
        print("\(n1)<\(n2)<\(100)");
    }
}
//元祖判断
if (1,"zebra") < (2, "apple"){
    print("结果为true");
}

// 你必须注意的几点
//1.转换出现可选值
//if let n = Int(3.3){
//
//}//编译错误

if let n = Int("3.3") {
    print(n)
}//编译通过

//问题:为什么第一个if会报错?
//答:Swift编译器要求我们右边必须为可选值类型Int(3.3)产生的结果不是可选值,我在swift3.0-数据类型中讲过数据类型之间转换不可能出现可选值,但是字符串转数字结果为可选值,所以第二个if是正确的.

//我们修改上面的代码
if let n:Int = Int(3.3) {
    print(n);
}// 编译通过

if let n:Int = Int("3.3") {
    print(n);
}// 编译通过

if let n:Int? = Int(3.3) {
    print(n);
}// 编译警告-说总是成功的

//if let n:Int! = Int(3.3) {
//    print(n);
//}// 编译报错 - 非可选值不能解包

//if let n :Int! = Int("3.3"){
//    print(n)
//} // 编译报错-解包的时机不对

//2.注意可选值的判断逻辑
let name1 : String! = "酷走天涯"// 定义一个需要解封的可选值
let name2 : String? = "酷走天涯"// 定义可选值
let name3 : String = "酷走天涯"// 定义非可选值

if name1 != nil {
    
}//编译成功

if let myName = name1 {
    print(name1);
    print(myName);
}//编译成功

if name2 != nil {
    
}//编译成功

if let myName = name2 {
    print(name2);
    print(myName);
}//编译正确

if name3 != nil {
    
}// 编译警告 - 总是成功

//if let myName = name3 {
//
//}//编译错误 - name3 不是可选值



