//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//基本写法

//写法1

if #available(iOS 10 ,*){
    print("支持10")
}else{
    print("不支持10,支持10之前的版本")
}

//写法2

if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}

