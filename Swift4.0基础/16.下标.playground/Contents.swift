//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//定义下标写法
//subscript(index : Int) -> Int {
//    get{
//
//    }
//    set(newValue){
//
//    }
//}

//应用
//a.需求:获取字符串第2个字符
//一般写法:
func getCharacterByIndex(n: Int,str: String) -> Character? {
    let index = str.index(str.startIndex, offsetBy: n);
    return str[index];
}
let c = getCharacterByIndex(n: 1, str: "你好吗");


//扩展下标写法(好东西,写共有方法,经常用)
extension String {
    subscript(n : Int) -> Character {
        let index = self.index(self.startIndex , offsetBy: n);
        return self[index];
    }
}
let string = "你好,我是酷走天涯"
let bbbstr = string[2];

//b.需求:.截取范围内的字符串
extension String{
    subscript(begin:Int,end:Int) -> String{
        //判断begin小于end
        let start = self.index(startIndex, offsetBy: begin)
        let end = self.index(startIndex, offsetBy: end);
        let str = self[start ... end];
        return String(str);
    }
}
// 调用
let subString = string[2,4]

//更优雅的写法
extension String{
    subscript(range:ClosedRange<Int>)->String{
        let range = self.index(startIndex, offsetBy: range.lowerBound )...self.index(startIndex, offsetBy: range.upperBound)
        return String(self[range]);
    }
}
let subString1 = string[1...5];
//1.下标的参数不能是inout 修饰的类型
//2.类或者结构体可以提供任意多个下标实现
//3.下标也是可以在枚举中使用的

