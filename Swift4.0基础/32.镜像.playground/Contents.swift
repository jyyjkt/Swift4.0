//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//输出对象的内容到控制台
struct Person {
    var name : String;
    var age : Int;
    var weight : Double;
}

let person : Any = Person(name : "13",age: 12,weight: 99);
dump(person);
//结果
//__lldb_expr_195.Person
//    - name: "13"
//- age: 12
//- weight: 99.0

//镜像的使用
//做一个简单的对象转字典应用
func anyobjectConvertDic(any:Any)->[String:Any]?{
    var dic:[String:Any] = [:]
    for childer in Mirror(reflecting: any).children {//镜像
        dic[childer.label!] = childer.value
    }
    return dic
}

//运行下面代码:
print(anyobjectConvertDic(any: person));
//结果
//Optional(["name": "13", "age": 12, "weight": 99.0])










