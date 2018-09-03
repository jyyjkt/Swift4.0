//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//你可以通用形式的函数和方法,以及类、枚举、结构。

//需求: 讲一个不确定的类型初始化后放入一个数组中,设计一个这样的接口
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]();
    for _ in 0..<numberOfTimes {
        result.append(item);
    }
    return result;
}


//需求: 写一个接口,判断两个数组中是否包含有相同的对象(不是地址相等,是内容相等);
func anyCommonElements<T: Sequence,U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable,T.Iterator.Element
    == U.Iterator.Element {
    
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false;
}
//认识几个东西
//Sequence: 一种协议 序列
//Equatable : 一种协议 实现了这种协议的对象 就能用 == 进行判断了
//Iterator: 提供了序列的迭代接口
//Element: 序列中的元素

//理解
//如果TU实现了Sequence协议,并且它里面的元素实现了Equatable协议 你就可以调用这个接口

//如何返回相交的数据?
func anyCommonElements1<T: Sequence,U: Sequence>(_ lhs: T,_ rhs: U) -> Array<T.Iterator.Element>
    where T.Iterator.Element: Equatable,T.Iterator.Element == U.Iterator.Element{
        
        var array:[T.Iterator.Element] = Array()
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    array.append(lhsItem)
                }
            }
        }
        return array
}

