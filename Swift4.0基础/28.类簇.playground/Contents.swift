//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//类簇
//使用一个统一的接口单一的对象
class Drinking : NSObject{
    class func drink(name : String) -> Drinking? {
        var drink : Drinking?
        
        switch name  {
        case "Coke":
            drink = Coke(name : name);
        case "Beer":
            drink = Beer(name : name);
        default:
            break;
        }
        return drink;
    }
}

class Coke : Drinking {
    var name : String;
    init(name : String) {
        self.name = name;
    }
}

class Beer : Drinking {
    var name:String;
    init(name: String) {
        self.name = name;
    }
}

let coke = Drinking.drink(name: "Coke") as! Coke;
print(coke.name);

//运行结果
//Coke
