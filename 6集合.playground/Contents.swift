//: Playground - noun: a place where people can play

import UIKit

//定义
var letters = Set<Character>();
var favoriteGenres: Set<String> = ["Rock","Classical","Hip hop"];
var favoriteGenres2: Set = ["Rock","Classical","Hip pop"]//类型推断

//清空
letters = [];
letters.removeAll();

//插入
letters.insert("a");

//判断集合是否为空
if favoriteGenres.isEmpty {
    
}
print(favoriteGenres);

//插入元素
favoriteGenres.insert("Jazz");
print(favoriteGenres);

//移除元素
if let removeGenre = favoriteGenres.remove("Rock") {
    print("\(removeGenre)? I'm over it.");
} else {
    print("I never much cared for that.");
}

//是否包含元素
if favoriteGenres.contains("Funk") {//包含
    print("I get up on the good foot");
}else{
    print("It's too funky in here.");
}

// 遍历集合中的元素
for genre in favoriteGenres {
    print("\(genre)");
}

//排序遍历
let favoriteGenres3 : Set = ["A","B","C","G","D"];
for genre in favoriteGenres3 {
    print("\(genre)");
}
let favoriteGenres4 : Set<String> = ["A","C","G","d","r"];
for genre in favoriteGenres4 {
    print("\(genre)");
}
//集合的运算
//交集
let intersection =  favoriteGenres3.intersection(favoriteGenres4);
print("输出交集:\(intersection)");

//补集(并集且去交集)
favoriteGenres3.symmetricDifference(favoriteGenres4);

//并集
favoriteGenres3.union(favoriteGenres4);

//favoriteGenres3 的子集
favoriteGenres3.symmetricDifference(favoriteGenres4).sorted();

//让学习成为一种习惯
let houseAnimals : Set = ["",""];
let farmAnimals : Set = ["","","",""];
let cityAnimals : Set = ["",""];

houseAnimals.isSubset(of: farmAnimals);//true//子集
farmAnimals.isSuperset(of: houseAnimals)//true//父集
farmAnimals.isDisjoint(with: cityAnimals)//不相交的



