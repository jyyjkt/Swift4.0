//: Playground - noun: a place where people can play

import UIKit

//1.基本
//定义
let list1 = ["你好","2","3","4"];
let list2:[String] = ["你好","2","3","4"];
let list3:[Any] = ["你好","2","3",3,UILabel()];
let lsit4:NSArray = ["你好","2","3","4",UILabel()];//OC
let lsit5:NSMutableArray = ["1","2","3","4"];//OC

//清空数组
let listText1 : [Any] = ["你好","2","3","4",1];
var listText2 : [Any] = ["你好","2","2","4",3];
listText2.removeAll() // 如果定义为var
listText2 = [] // 如果定义为var

//取代操作
var listA1 : [Any] = ["1","2","3","4","5","6","7","8"];
listA1[2...6] = ["Bananas","Apples"]// 将数组4...6的范围用指定的数组取代
print(listA1);
//插入移除操作
var listA2 : [Any] = ["1","2","3","4","5"];
listA2.insert("maple Syrup", at: 0);
print(listA2);
let mapleSyrup = listA2.remove(at: 2);
print(listA2);

let apples = listA2.removeLast();

print(listA2);

//遍历数组

var listA3 : [Any] = ["1","2","3","4","5",1,2,3,4,5];
for item in listA3 {
    print(item);
}

for (index,value) in listA3.enumerated() {
    print("Item \(index + 1):\(value)")
}

//高级
//认识 map
//看一下它的定义
//func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]
//解释:
//T为泛型
//transform: 闭包函数 我们需要给它传入一个有参数返回值的闭包函数
//[T]函数会返回给我们一个T类型的数组
//应用:我们有这样一个需求,给一组数据中大于20的数组乘以3

//1.定义一个数组
var numbers = [21,19,7,12];
//2.创建一个有一个参数一个返回值的闭包函数
var closure = {(number : Int) -> Int in
    var result = number;
    if number > 20 {
        result *= 3;
    }
    return result;
}
//3.调用map函数
print(numbers.map(closure))
//由于swift有类型推断的功能,我们可以这样写
let mappedNumbers = numbers.map({number -> Int in
    if number > 20{
        return 3 * number;
    }
    return number;
})

//如果没有逻辑判断,给所有值统一乘以3,我们甚至可以这样写
let mappedNumbers1 = numbers.map { (number) -> Int in
    return number * 3;
}
//在简洁点
let mappedNumbers2 = numbers.map { (number) -> Int in
    number * 3;
}

//如果你要将数组中的值全部替换为0 你可以这样写
let mappedNumbers3 = numbers.map { _ in
    return 0;
}


//测试使用时间 for ... in 和 map
//for ... in
var numbersArray = Array.init(repeating: 3, count: 10000);
print(numbersArray);
var date1 = NSDate();//记录时间
for i in 0..<numbersArray.count {
    numbersArray[i] = 0;
}

print(NSDate().timeIntervalSince(date1 as Date));//使用时间0.5764

//map
var numbersArray1 = Array.init(repeating: 3, count: 10000);
var date2 = NSDate();
var newNumbersArray1 = numbersArray1.map { _ in
    return 0;
}
print(NSDate().timeIntervalSince(date2 as Date));//0.433
//结论
//在执行速度上还是for...in比较快
//问题一:map的优势在哪里呢?
//sort排序
//public func sorted(by areInIncreasingOrder:(Element, Element) -> Bool)) -> Element
//areInIncreasingOrder 两个参数一个返回值得闭包

//测试冒泡排序法时间
var numbersArray3 : [Int] = [1,24,5,2,5,2,4,5,6,9,87];
var date3 = NSDate();
numbersArray3.sort(by: {$0 > $1});
print(numbersArray3);
print(NSDate().timeIntervalSince(date3 as Date))//0.002631

var date4 = NSDate();
for i in 0..<numbersArray3.count {
    var num3 = numbersArray3[i];
    for j in i..<numbersArray3.count {
        if num3 < numbersArray3[j] {
            (num3,numbers[j]) = (numbers[j],num3)//交换位置
        }
    }
    
}
//print(numbersArray3);
print(NSDate().timeIntervalSince(date4 as Date))//0.0008280







