//: Playground - noun: a place where people can play

import UIKit

//1 ?的用法
class Square{
    var sideLength : Float;
    var name : String;
    init(sideLength: Float, name: String) {
        self.sideLength = sideLength;
        self.name = name;
    }
}


let optionalSquare : Square? = Square(sideLength: 11.0, name: "你好");
let length = optionalSquare?.sideLength;

//什么时候定义可选值
//当你创建的变量有可能会出现nil的时候
//看第二句代码为什么那样写,如果不那样写会怎么?
//如果我们第一句代码创建的结果为nil,在获取它里面的属性sideLength的时候
//我们加了一个?系统会首先确认第一个是不是Nil,如果是nil,则直接返回一个nil给length,如果不是空值,则获取sideLength的值赋值给length

//加入我们的解封第一个对象
let lengthText = optionalSquare!.sideLength;
//如果optionSquare不是nil还好,没有任何影响,如果为nil系统直接崩溃,相当于这样let sideLength = nil , swift不允许我们使用nil赋值给一个非可选值.
