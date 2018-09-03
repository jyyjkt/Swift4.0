//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//注意
//1.系统要求存储属性必须初始化
//2.可选值可以不用初始化,如果不初始化值,系统默认用nil初始化它
//3.如果非可选类型存储属性不设置默认值,则必须在初始化方法中对其进行初始化
//4.类必须自己写初始化方法,初始化没有默认值的非可选存储属性
//5.结构体系统默认会添加初始化方法,当然自己也可以自定义
//6..子类如果没有自己的初始化方法,系统默认使用父类的初始化方法,一旦有了自己的初始化方法,或者重写了父类的初始化方法,则父类的所有初始化不能被子类调用
//7.你可以给子类添加和父类相同的初始化方法,但需要加上override 修饰
//8.重写父类的convenience修饰的方便初始化方法,不需要加override 关键字

//指定初始化(Designated)
//1.可以有多个指定初始化方法
class Person{
    var name : String;
    var age : Int = 0;
    var weight : Double = 0.0;
    var height : Double = 0.0;
    init(name: String,height : Double) {
        self.name = name;
        self.height = height;
    }
    init(name:String) {
        self.name = name;
    }
}

//方便初始化
//1.在同一个类,使用convenience修饰的初始化方法必须调用一个其他初始化方法
//2.convenience 必须最终调用一个指定的初始化方法
//3.当子类继承父类时,子类的初始化方法,必须调用父类的指定初始化方法,不能调用使用convienience修饰的方便初始化方法
//4.在swift4.0 初始化中,可以自己调用自己的初始化方法,系统不会检测出来,在创建convenience方便初始化方法的时候,需要小心,千万不要相互引用了
//父类
class Person1{
    var name : String;
    var age : Int = 0;
    var weight : Double = 0.0;
    var height : Double = 0.0;
    
    init(name : String, height : Double) {
        self.name = name;
        self.height = height;
    }
    
    init(name : String) {
        self.name = name;
    }
    //1.定义一个convenience修饰的初始化方法,如果在同一个类中必须调用其他没有convenience
    //修饰的初始化方法
    convenience init(name: String, age : Int){
        self.init(name: name);
        self.age = age;
    }
    //2.如果定义两个或者多个convenience修饰的初始化,只需要调用任意一个初始化方法即可满足语法要求
    convenience init(name : String, age : Int,weight : Double){
        self.init(name: name, age: age);
        self.weight = weight;
    }
    
}

//子类
class Man : Person1 {
    var address : String = "";
    init(name : String, age : Int,weight : Double){
        //3.必须调用父类指定初始化方法,不能调用convenience修饰的方便初始化方法
        super.init(name: name);
    }
}

//类初始化的过程
//第一阶段
//1.调用指定初始化方法或者方便初始化
//2.给新的实例分配内存,但内存还没有初始化
//3.指定初始化方法确定所有存储属性都被初始化,内存这个时候被初始化.
//4.然后去调用父类的指定初始化方法,任务和调用自己指定初始化方法相同
//5.继续在类继承链中指定找父类初始化的过程,直到达到链的顶部位置.
//6.当到完成基类的初始化的时候,实例的初始化算是完成了,我们的第一阶段完成
//第二阶段
//1.可以对属性值进行修改
//2.可以调用对象方法

//重写初始化方法
//例子

//父类
class Person3{
    var name : String;
    var age : Int = 0;
    var weight : Double = 0.0;
    var height : Double = 0.0;
    init(name : String, height : Double) {
        self.name = name;
        self.height = height;
        
    }
    
    init(name : String) {
        self.name = name;
    }
    
    convenience init(name : String, age : Int, weight : Double){
        self.init(name: name);
        self.age = age;
        self.weight = weight;
    }
}

//子类
class Man3 : Person3 {
    var address : String = "";
    
    //重写父类指定初始化方法
    override init(name: String) {
        super.init(name: name);
    }
    //重写父类convenience修饰的初始化方法 不需要添加override 关键字
    init(name : String, age : Int, weight : Double) {
        super.init(name: name);
    }
    //创建自己的初始化方法
    convenience init(name: String,age: Int,weight: Double,address: String) {
        self.init(name: name);
        self.address = address;
        self.age = age;
        self.weight = weight;
    }
    
}

//1.创建新的指定初始化方法,必须调用父类的指定初始化方法 (Designated)
//2.创建新的方便初始化方法,必须调用自己的指定初始化方法,或者方便初始化方法(convenience)
//3.重写父类的指定初始化方法,在方法名前加override ,然后调用父类的指定初始化方法
//4.重写父类的方便初始化方法(convenience) 不需要加override 或者convenience 关键字,调用父类的指定初始化方法,如果加上convenice关键字,则必须调用自己的初始化方法
//5.如果子类没有初始化方法,系统会自动继承父类的初始化方法
//6.初始化调用父类初始化时,需要先初始化子类的存储属性,但是如果是convenience修饰的初始化方法,要先调用自己的其他初始化方法,然后再给自己的存储属性赋值

//创建一个可能失败的初始化方法
//注意 :
//1.不能再重写的初始化方法改为可能失败的初始化方法
//2.不能使用相同的参数定义一个可能失败的初始化方法和不会失败的初始化方法
//3.可能失败的类型可以重写为不会失败的类型
//4.init?可以被重写为init!.当然可逆也是可以的.

//例子1
class Man4 : Person3 {
    var address : String = "";
    convenience init?(name : String,age : Int,weight : Double,address : String){
        if name == "" {
            return nil;
        }
        self.init(name: name);
        self.address = address;
        self.age = age;
        self.weight = weight;
    }
}

//例子2
enum TemperatureUnit{
    case kelvin, celsius, fahrenheit;
    init?(symbol : Character) {
        switch symbol {
        case "K":
            self = .kelvin;
        case "C":
            self = .celsius;
        case "F":
            self = .fahrenheit;
        default:
            return nil;
        }
    }
}
//例子2: 子类将父类可能失败的初始化方法,修改为不会失败的类型
class Animal{
    var name : String;
    init?(name : String) {
        if name.isEmpty {
            print("字符串为空");
            return nil;
        }
        self.name = name;

    }
}

//Animal(name: nil); //会出错
Animal(name: "");

//对于可能出现空值的对象或者其他类型,使用之前必须进行验证
enum TemperatureUnit1 : Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F";
}

let fahrenheitUnit1 = TemperatureUnit1(rawValue: "F");
if fahrenheitUnit1 != nil {
    print("This is a defined temperature unit, so initialization     succeeded.")
}

//需求:创建一个文件类,文件名字可以为nil,但是不能为空即""

//写法一:
class Document {
    var name : String?;
    init?(name : String?){
        if name != nil || (name?.isEmpty)! {
            print("输出\(name!)");
            return nil;
        }
        print("输出\(name!)");
        self.name = name;
    }
}

//分析这种写法
//只有一种初始化方法,也就是说,不管有没有名字,我们都需要给初始化传个参数,显然这样不合理,目标不明确
Document(name: "");

//Document(name: nil);// 不能传空

//写法二:
class Document2{
    var name : String?;
    init() {
        // 专门初始化name为nil的情况
    }
    init?(name : String) {//传入名字,肯定不为nil,只需要判断是否为空""即可
        if name.isEmpty {
            print("输出\(name)");
            return nil;
        }
        
        self.name = name;
    }
}

Document2();
Document2(name: "");
//Document2(name: nil); //报错不能为空 使用Document2();

//疑问: init! 和init? 被重写为init 的意义何在?
//基本没啥使用情况

//需要的初始化方法(required)
//注意
//1.子类必须重写父类用required修饰的方法
//2.可以和convenience组合使用
//a-1.父类 要求一个初始化方法被重写
class Person5{
    var name:String
    var age:Int = 0
    var weight:Double = 0.0
    var height:Double = 0.0
    init(name:String,height:Double) {
        self.name = name
        self.height = height
    }
    init(name:String) {
        self.name = name
    }
    // 要求子类必须重写这个方法
    required convenience init(name:String,age:Int,weight:Double){
        self.init(name:name)
        self.age = age
        self.weight = weight
    }
}

//a-2.子类重写父类要求的初始化方法

class Man5: Person5 {
    var address:String = ""
    // 重写父类要求的初始化convenience 修饰的初始化方法 不需要添加override 关键字
    required init(name:String,age:Int,weight:Double){
        super.init(name: name)
    }
}

//反初始化(deinit)
//注意:
//1.deinit在对象被释放前调用
//写法很简单
//deinit{
//
//}

//苹果文档有个例子简单讲解了一下它的重要性
//例子: 有一个赌徒在银行存了10_000 元,赌徒从银行取钱然后去赌博,当赌徒对象释放了就将钱全部存到银行
class Bank {
    static var coinsInBank = 10_000
    
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        //去存在金额和输入金额最小值
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        //减去取出金额
        coinsInBank -= numberOfCoinsToVend
        //返回取出金额
        return numberOfCoinsToVend
    }
    
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

//赌徒类
class Player {
    var coinsInPurse: Int
    init(coins: Int) {//抛出
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {//赢了
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}
//执行
var playerOne: Player? = Player(coins: 100)
playerOne!.win(coins: 2_000)
playerOne = nil








