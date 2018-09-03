//: Playground - noun: a place where people can play

import UIKit

//1.基本
//1_1创建
var namesOfIntegers = [Int: String]();
var airportsDic : [String : String] = ["YYZ":"Toronto","DUB":"Dublin"];
var airPortsDic1 = ["YYZ":"Toronto Pearson","DUB":"Bublin"];
//1_2 赋值,修改值
namesOfIntegers = [16:"shiliu",15:"shiwu"];
namesOfIntegers[16] = "sixteen";
print(namesOfIntegers);
airportsDic["YYZ"] = "London Heathrow";

// 更新值返回久的值,值可能为nil
if let oldValue = airportsDic.updateValue("Dublin Airport", forKey: "YYZ"){
    print("The old value for DUB was \(oldValue).");
}
if let x = namesOfIntegers[1] {
    print(x);
}
//清空
namesOfIntegers = [:];
//检测是否为空
if namesOfIntegers.isEmpty {
    print("字典是空的");
}
namesOfIntegers[1] = "one";
namesOfIntegers[2] = "two";
print(namesOfIntegers);
//移除值
namesOfIntegers[1] = nil;
namesOfIntegers.removeValue(forKey: 2);
print(namesOfIntegers);
//遍历值
for (airPortsDicCode, airPortsDicName) in airportsDic {//字典item
    print("\(airPortsDicCode):\(airPortsDicName)");
}

for airportsDicCode in airportsDic.keys {//字典的key
    print("Airport code: \(airportsDicCode)");
}

for airportsDicName in airportsDic.values {//字典的值
    print("Airport name: \(airportsDicName)");
}

//中级
//字典存储方是乱序的
var dicA1 = [1:"23",3:"3"];
dicA1.remove(at: dicA1.index(dicA1.startIndex, offsetBy: 1));
print(dicA1);
//怎么将字典的keys或者Values放入数组中
let keys = [Int](dicA1.keys);
let values = [String](dicA1.values);
//let keys = dic.keys 获取的不是数组,但是可以通过for...in遍历它里面的元素



