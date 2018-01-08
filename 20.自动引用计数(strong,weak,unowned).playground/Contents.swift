//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//自动引用计数的原理

//1 栈区（stack）*先进后出* 由编译器自动分配并释放，一般存放函数的参数值，局部变量等
//2 堆区(heap) *先进先出* 由程序员分配和释放，如果程序员不释放，程序结束时，可能会由操作系统回收
//3 寄存器区：用来保存栈顶指针和指令指针
//4 全局区(静态区)全局变量和静态变量的存储是放在一起的，初始化的全局变量和静态变量存放在一块区域，未初始化的全局变量和静态变量在相邻的另一块区域，程序结束由系统释放。
//5 文字常量区：存放常量字符，横须结束后由系统释放
//6 程序代码区:存放函数的二进制代码


//1.每次创建一个类的新实例时，都会分配一个内存块来存储有关该实例的信息。此内存保存实例的类型的信息，以及与该实例关联的任何存储属性的值
//2.当一个实例不再需要时，ARC释放由该实例使用的内存，以便内存可以用于其他用途
//3.ARC 释放对象后,它将不能再继续访问对象的属性,或者调用对象方法,如果你依然继续访问对象,App将会崩溃
//4.为了确保对象使用时, 不被释放,ARC 跟踪属性,变量和常量,只要有一个对象引用存在,在对象不会被释放
//5.当您将一个类实例分配给属性、常量或变量时，属性、常量或变量对实例会有一个强引用,确保对象不会被释放

//深讨Strong,weak和unowned的区别
//我们先创建一个对象
class Person {
    var name : String;
    init(name : String) {
        self.name = name;
    }
    deinit {
        print("对象释放了,name的值为:\(name)")
    }
}

//强引用
//创建一个person实例对象,然后对其进行强引用
var reference1 : Person? = Person(name: "求星星");

//我们不在引用对象
reference1 = nil;
//结果
//对象释放了,name的值为:酷走天涯

//弱引用
//我们使用weak引用对象
weak var reference2 : Person? = Person(name: "求星星");
//结果
//对象释放了,name的值为:酷走天涯

//我们写成不可选
//weak var reference3 : Person = Person(name: "求星星");
//结果报错
//should have optional type 'Person?'
//weak var reference3 : Person = Person(name: "求星星");
//原因
//weak 修饰的变量或者常量必须为可选值 ? 或者 ！

//使用unowned引用对象
//unowned var reference4 : Person? = Person(name: "求星星");
//报错
//error: 20.自动引用计数(strong,weak,unowned).playground:54:13: error: 'unowned' may only be applied to class and class-bound protocol types, not 'Person!'

//unowned var reference5 : Person! = Person(name: "求星星");
//报错
//error: 20.自动引用计数(strong,weak,unowned).playground:54:13: error: 'unowned' may only be applied to class and class-bound protocol types, not 'Person!'
//unowned var reference5 : Person! = Person(name: "求星星");

//unowned var reference7 : Person = Person(name: "酷走天涯")
//不知道为何错误 正常是对的

//原因
//不能修饰可选类型

//总结
//1.强引用的对象,不会被释放
//2.weak 或者unowned 引用的对象,当没有强引用的时候,会被立即释放
//3.weak 修饰的变量和常量必须为可选类型,但是unowned刚好和其相反必须为非可选类型

//验证结论

class School {
    var name : String;
    init(name : String) {
        self.name = name;
    }
    
    deinit {
        print("学校对象释放了,name的值为:\(name)");
    }
}

//例子1
var text1 : School = School(name: "北京");//非可选对象
weak var text2  = text1;
unowned var text3 = text1;
print(text2);
print(text3);
//结果
//Optional(__lldb_expr_1.School) //转成可选对象了
//__lldb_expr_1.School//非可选对象

//例子2
var bText1 : School = School(name: "上海");//非可选值对象
weak var bText2 = bText1; //这时候已经是可选对象
//unowned var bText3 = bText2;//错误了
//错误原因
//weak 修饰的变量bText2 虽然没有指明变量类型,但是swift会推断出来它的类型为School?,
//这个时候我们把一个School? 的类型付给unowned修饰的变量,系统出现错误

//例子3
var cText1 : School = School(name: "广州");//非可选值对象
weak var cText2 = cText1;
unowned var cText3 = cText2!;


//为什么要使用weak和unowned
//定义两个类Student和School1,Student有一个属性school,school也有一个属性student,我们让其互相引用
//学生类
class Student {
    var school : School1?;
    deinit {
        print("学生是释放了");
    }
}

//学校类
class School1 {
    var student : Student? // 强引用
    deinit {
        print("学校释放了");
    }
}

var school : School1? = School1();//创建实例对象School1 属性student(可选)属性为nil
var student : Student? = Student();//创建实例对象Student 属性school(可选)属性为nil
//互相持有
school?.student = student;
student?.school = school;

//在都设置为nil
school = nil;
student = nil;

//结果
//结果都没有释放

//原因分析:
//school 要释放必须先释放它的属性Student ,系统就去释放Student的内存空间,发现他有一个属性叫school 然后又去释放school,就这样构成死循环,谁都无法释放

//遇到这类问题,原因就是*相互强引用*了,接下来,我们使用将student的属性school 使用weak修饰
// 学生类
class Student2 {
    weak var school : School2?
    deinit {
        print("学生对象释放了");
    }
}

//学校类
class School2 {
    var student : Student2?;
    deinit {
        print("学校对象释放了");
    }
}
var school2 : School2? = School2();//创建实例对象School1 属性student(可选)属性为nil
var student2 : Student2? = Student2();//创建实例对象Student 属性school(可选)属
//互相持有
school2?.student = student2;
student2?.school = school2;

//在都设置为nil
school2 = nil;
//结果学校释放了
student2 = nil;
//结果学生释放了

//原理:就是找到按顺序类进属性 属性对应的类的属性弱引用释放 ,具体自己理解😀

//选择unowned和weak问题
//例子
//使用unowned

//学生类
class Student3 {
    unowned var school : School3;
    init(school : School3) {
        self.school = school;
    }
    deinit {
        print("text3学生对象释放");
    }
    func describe() {
        print("学生在\(school.describe())")
    }
}

//学校类
class School3 {
    var student : Student3? // 强引用
    deinit {
        print("text3学校对象释放了");
    }
    func describe() -> String {
        return "学校";
    }
}

var school3 : School3? = School3()
var student3 : Student3? = Student3(school:school3!)
school3!.student = student3
// 学校不用了,把学校释放掉
school3 = nil
//student3?.describe()//崩溃

//运行:
//崩溃

//原因:
//释放掉school对象,然后在student的方法中调用了school的方法,方法已经不存在了,所以崩溃了
//print("学生在\(school.describe())")这个就是school方法

//使用weak
//学生类
class Student4 {
    weak var school : School4?;
    deinit {
        print("text4学生对象释放");
    }
    
    func describe() {
        if let school = self.school{
            print("学生在\(school.describe())上学");
        }
    }
}
//学校类
class School4 {
    var student : Student4? // 强引用
    deinit {
        print("text4学校对象释放了");
    }
    func describe() -> String {
        return "上海学校";
    }
}
//互相持有
var school4 : School4? = School4()
var student4 : Student4? = Student4()
school4!.student = student4
student4!.school = school4

//运行下面的代码
school4 = nil;
print(student4?.describe());

//结果
//学校对象释放了

//分析:
//由于school4被弱引用,计数器减一,school4对象就被释放了,
//所以我们在调用的时候进行检测,如果对象存在再去执行方法,这样就避免了此类错误

//总结
//使用unowned 修饰属性时,必须保证自己的实体独享要比引用的对象先释放
//如果循环引用中,弱引用的对象必须为非可选类型,这个时候,就可以考虑使用unowned

//实例分析
class HTMLElement {
    let name : String;
    let text : String?;
//    lazy var asHTML : () -> String = { //这里注意,如果要在存储属性的闭包中访问自己的属性,必须加Lazy
//        if let text = self.text {
//            return "<\(self.name)>\(text)</\(self.name)>";
//        } else {
//            return "<\(self.name) />"
//        }
//    }
    //修改部分代码如下
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name : String,text : String? = nil) {
        self.name = name;
        self.text = text;
    }
    
    deinit {
        print("\(name) is being deinitialized");
    }
}

var x:HTMLElement? = HTMLElement(name: "title");
x = nil;
//分析:
//眨眼一看,释放了,
//为什么被释放了,因为我们使用lazy关键字,asHTML 闭包没有被创建,
//这里注意,如果要在存储属性的闭包中访问自己的属性,必须加Lazy

var x1:HTMLElement? = HTMLElement(name: "title");
print(x1?.asHTML());
x1 = nil;//没有释放

//分析原因:
//释放对象,首先释放属性,释放name发现name被闭包引用了,然后去释放闭包,发现释放self.name ,构成了死循环

//分析:
//释放name的时候, 是被弱引用的,引用计数没有加1,不用考虑,直接释放自己，释放asHTML 时发现,name 已经被释放了,


