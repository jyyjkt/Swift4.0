//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//怎么获取类的标识
class Student {
    
}

let x = Student();
let y = x;
print(ObjectIdentifier(x));
print(ObjectIdentifier(x));
print(ObjectIdentifier(x) == ObjectIdentifier(x));//标识
print(x);

print(x === y);
let z = Student();
print(ObjectIdentifier(z));
print(ObjectIdentifier(x) == ObjectIdentifier(z));
print(z);
print(x === z);

if x is Student && y is Student {
    print("是同一类");
}

//创建对象的时候,会给对象分配一个独一无二的标识
