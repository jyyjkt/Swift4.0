//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//函数的几种类型
//无参无返
func greet() -> Void {
    
}
//或者
//func greet(){
//
//}

//有参无返
func greet(person: String,day: String) {
    print("Hello \\\(person),today is \\\(day).");
}
greet(person: "Bob", day: "Tuesday");

//思考1:如何省略外部参数名?
//实现代码
func greet(_ person:String,_ day:String) -> String{
    return "Hello \\\(person),today is \\\(day).";
}
greet("John","Wednesday");

//有参有返
func greet(_ person: String, on day : String) -> String {
    return "Hello \\\(person), today is \\\(day).";
}

//无参有返
//func greet() -> Void {
//
//}

//中级思考
//参数和返回值
//1.参数可以是那些?
//基本类型的值,对象,数组,字典,元组,可变数量的参数,函数,闭包函数,协议,结构体,枚举值
//2.怎么定义参数
//a.单值
func calculate(a:Int){
    let b = a;
    print(b);
}
//b.多值
func calculate(a:Int...){
    for _ in a {
        
    }
}
// 调用
calculate(a: 1,2,3,4,5,6);

//c.元祖
func calculate2(a:(name:String,age:Int)){
    let name = a.name;
    let age = a.age;
    print("\(name),\(age)");
}

//d.数组
func calculate3(a:[String]){
    for student in a {
        
    }
}

//e.定义字典
func calculate4(a:[String:Int]){
    for student in a {
        print(student.key);
        print(student.value);
    }
}

//f.函数作为参数
func add3(a:Int,b:Int) -> Int{// 作为函数参数的函数
    return a+b;
}

func calculate5(a:(Int,Int) -> Int){// 定义的参数为函数的函数
    a(2,1);
}
calculate5(a: add3);//执行函数

//g.上面函数的闭包写法
let calculate7 = { (a,b) -> Int in
    return a+b;
}
//calculate8 {(a,b) in a+b }//// 省略写法(由于swift有推断能力,这样写它就能帮你推断出来上面的写法)

//h.参数为协议方法
protocol Player{ // 定义协议
    func play();
}

func playMusicWithPlayer(player:Player){
    
}

//i.参数为结构体
struct Student {
    var name :String;
    var age :Int;
}

func getStudentDescription(student:Student){
    print(student.name);
    print(student.age);
}

let student = Student(name: "小星星", age: 3);
getStudentDescription(student: student);

//j.参数为枚举类型
// 定义枚举值
enum CarType: String{
    case Lincoln = "林肯";
    case Mercury = "水星";
    case Suzuki = "铃木";
}

//参数为协议的方法
func describeCar(carType:CarType){
    print(carType.rawValue);
}

//函数的内部定义函数
//需求:创建一个接口,输入true返回两个数相加的函数,输出false返回两个数相减的函数
func generateFuncByFlag(flag:Bool) ->((Int,Int)->Int){
    //定义两数字相加的函数
    func add(a:Int,b:Int) -> Int{
        return a+b;
    }
    //定义两个数相减的函数
    func decrease(a:Int,b:Int) -> Int{
        return a-b;
    }
    //根据输入的条件返回对应的函数
    if flag {
        return add;
    }else{
        return decrease;
    }
}

// 生成对应的函数
let addFunc = generateFuncByFlag(flag: true);
// 执行返回的函数
print(addFunc(1,2));

// 设置默认参数值
func addStudent(student:(name : String,score : Double) = ("姓名",12)){
    print(student.name);
    print(student.1);
}

addStudent();
addStudent(student:("小星星",99));

//提示
//元祖类型,不能分别给参数赋值,不如像下面这样
// 这样是错误的方式
//func addStudent1(student:(name:String = "姓名", score : Double = 12)){
//    print(student.name);
//    print(student.1);
//}

//inout的使用
//需求: 创建一个函数,交换两个Int类型值
//a.如果参数为let 修饰的常量
//func swapTwoInts(a: Int, b: Int){
//    let temporaryA = a;
//    a = b;
//    b = temporaryA;
//}
//系统会报错,说常量不能更改

//b.如果参数为var
//func swapTwoInts(var a : Int, var b : Int){
//    let temporaryA = a;
//    a = b;
//    b = tetemporaryA;
//}
//报错,不能使用var修饰参数

//c.inout修饰的参数可以修改值
func swapTwoInts(a : inout Int,b : inout Int){
    let temporaryA = a;
    a = b;
    b = temporaryA;
}

var a = 30;
var b = 40;
swapTwoInts(a: &a , b: &b);
print(a);
print(b);

// 你需要注意的
// 1.inout 的位置在: 后面,数据类型前面
// 2.inout 修饰的参数不能有默认值
// 3.inout 不能用于修饰多值(如:a:Int...)

//定义函数类型的变量

func swapTwoInts1(a : inout Int , b : inout Int){
    let temporaryA = a;
    a = b;
    b = temporaryA;
}

var swap1:( inout Int, inout Int) -> Void = swapTwoInts1;

//注意: 函数类型的变量不能用标签修饰参数

// 错误的写法 不能使用a,b标签
//var swap2:(a : inout Int, b : inout Int) -> Void = swapTwoInts1;
// 你应该像下面这样
var swap3:( _ : inout Int, _ : inout Int) -> Void = swapTwoInts1;
// 或者下面这样也可以,a,b不一定要和实际函数对应
var swap4:(_ a : inout Int, _ b : inout Int) -> Void = swapTwoInts1;
// 建议还是用下面这种
var swap5:( inout Int, inout Int) -> Void = swapTwoInts1;

//定义闭包类型数据
var customersInLine = ["Chris","Alex","Ewa","Barry", "Daniella"];
let customerProvider = {
    customersInLine.remove(at: 0);
}
print(customersInLine.count);
print("Now serving \\\(customerProvider())!");
print(customersInLine.count);
//5
//Now serving Chris!
//4]

//提示:上面那种闭包其实是无参有返的闭包形式,原形如下
let customerProvider2: () -> String = {
//    customersInLine.remove(at: 0);// 返回值同下
    return customersInLine.remove(at: 0);// 返回值

}

print(customerProvider2());


//关键字 @discardableResult
    //先看一段代码
class OSStudent{
    var name : String!;
    var score : Double!;
    
    @discardableResult //去除返回值不用的警告 //废弃结果
    func setNewScore(score:Double) -> Bool{
        if name == nil || name.isEmpty{
            return false;
        }
        self.score = score
        
        return true;
    }
}
OSStudent().setNewScore(score: 34.0);

var name1 : String!;//需要解封的可选值
if name1 == nil {
    print("name1是nil");
}
var name2 : String = "";//必须不是nil才能使用isEmpty
if  name2.isEmpty {//判断空字符串
    print("name1.isEmpty 是true");
}

//注意
//函数的setNewScore 方法有返回值,但是调用的时候,没有使用常量或者变量接受这个返回值,系统会产生警告如下图



//高级思考
//.如何获取,函数自己的名称,在那个文件中,在文件多少行
//定义一个获取函数名称,获取文件路径的函数
func getFunctionName(name: String = #function, line : Int = #line,file:String = #file){
    print(name);
    print(line);
    print(file);
}

// 比如我们要获取下面函数的信息,只需要将函数写入要获取信息函数的内部调用即可.
func getUserName(){
    getFunctionName();
}
//执行函数
getUserName();

//编译器可能没有那么智能
//定义一个父类
class Person{
    
}
//定义一个男人
class Man : Person {
    
}

//定义一个女人
class Woman : Person {
    
}

//定义三个描述人的方法

func describePerson(_ person : Person){
    print("我说人类");
}

func describePerson(_ woman:Woman){
    print("我是女人");
}

func describePerson(_ man:Man){
    print("我是男人");
}

// 定义一个描述男人的女人方法
func descripePerson(_ person:Person, _ woman:Woman){
    describePerson(person);
    describePerson(woman);
}
//执行
descripePerson(Man(), Woman());
//结果
// 我是人类
// 我是女人

//分析:

//参数man 在值没有传入之前,被默认为Person 进行编译了,所以不管我们传入男人或者女人都之调用人类描述的方法。

//那么我们应该怎样处理这个问题呢?

func descripePerson2(_ person : Person , _ woman : Woman) {
    if person is Woman {
        describePerson(person as! Woman);
    }else{
        describePerson(person as! Man);
    }
    
    describePerson(woman);
    
}

descripePerson2(Man(), Woman());

// 运行结果
// 我是男人
// 我是女人

//下面这种写法也是可以的
func descripePerson3(_ person:Person,_ woman:Woman){
    if let woman = person as? Woman {
        describePerson(woman);
    }else{
        describePerson(person as! Man);
    }
    
    describePerson(woman);
}

//泛型
//需求:设计一个接口,交换两个元素(数字,字符,对象)的值
func swap<T>(a : inout T,b : inout T){
    (a,b) = (b,a);
}
//测试一
var texta = "你好";
var textb = "小星星";
print("交换前---------");
print(texta);
print(textb);

swap(&texta, &textb);
print("交换后---------");
print(texta);
print(textb);

//运行结果:
//
//交换前---------------------
//你好
//酷走天涯
//交换后----------------------
//酷走天涯
//你好

//测试二
class Woman1{
    var name = "女人";
    init(name:String) {
        self.name = name;
    }
}
let texta1 = Woman1(name: "小星星");
let textb1 = Woman1(name: "小月月");
print("交换前--------------");
print(texta1.name);
print(textb1.name);

swap(&texta1.name, &textb1.name);//交换
print("交换后--------------");
print(texta1.name);
print(textb1.name);

//运行
//交换前---------------------
//小红
//小白
//交换后----------------------
//小白
//小红

//提示
//交换的必须是相同的对象

//@escaping 用法
var downloadComplate: ((Bool) ->())!;
func downloadResource(url : String,complate:@escaping (Bool) -> ()){//溢出
    // 异步下载,下载完成调用
    downloadComplate = complate;

    // 下载失败
    downloadComplate(false);

}

//没有@escaping 出错

//@escaping 作用
//我们经常在下载等异步操作完成时,才调用闭包函数,我们有可能暂时不要把这个闭包存放在数组中,或者使用属性去引用它,那么这个时候就需要使用这个关键了

//修改代码
var downloadComplate1 : ((Bool) -> ())!;// 加? 也可以,但是在调用时,要进行解包
func downLoadResourceA(url: String, complate: @escaping (Bool) -> ()){//异步执行
    
    downloadComplate1 = complate;
    //异步下载,下载完成调动
    downloadComplate1(true);
    //下载失败
    downloadComplate1(false);
}

//报错提示 downloadComplate 使用之前必须初始化

//调用
downLoadResourceA(url: "www.baidu.com") { (flag : Bool) in
    print(flag);
}

// 如果我们不需要引用完全可以不使用@escaping
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    print("运行2");
    closure()
}

someFunctionWithNonescapingClosure {
    
}

//关键字@autoclosure 的用法
//a.不加自动闭包的关键字@autoclosure
func serve(customer customerProvider: () -> String) {
    print(customerProvider());
}
serve { () -> String in
    return "没加@autoclosure";
}

//运行结果:
//没加@autoclosure

//b.添加@autoclosure
func serve1(customer customerProvider: @autoclosure () -> String) {
    print(customerProvider());
}

serve1(customer: "加了@autoclosure");//自动闭包直接输入返回值

//c. @autoclosure 和 @escaping 组合使用方法
func serve2(customer customerProvider: @autoclosure @escaping() -> String) {
  
    print (customerProvider());
}
serve2(customer: "加了@autoclosure 和 @escaping");

//提示:
//其实自动闭包给人可能造成一种表意不清的感觉,建议使用的时候,一定要注释说明,或者不要使用。

//d. @noescape

//func calculate11(fun :@noescape ()->()){
//
//}
//错误error: @noescape is the default and has been removed
//所以得去掉

//提示:

//1.系统默认为@onescape 的类型
//2.不能被引用
//3.不能在异步执行






