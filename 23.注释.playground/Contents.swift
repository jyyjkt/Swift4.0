//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//第一种 单行注释
// 这是一个单行注释

//第二种 多行注释
/* 这是一个注释多行 */

//第三种 有头和尾的多行注释
/* 注释的开头
 /*注释的内部部分 */
 注释的结尾 */

//第四种 标记函数
//MARK: - 标记在函数前面

//第五种Java风格注释
/*
 * @func  定义一个查询学生成绩的接口
 * @param name 学生姓名
 * @param nums 序号
 * @return 返回查询到的成绩
 */

//第六种 苹果官方使用///注释属性
/// The interval between 00:00:00 UTC on 1 January 2001 and the current date and time.
//public static var timeIntervalSinceReferenceDate: TimeInterval { get }

//第七种 苹果官方注释方法

/// 定义一个查询学生成绩的接口
///
/// - Parameters:
///   - name: 学生姓名
///   - nums: 学号
/// - Returns: 返回学生成绩
func getScoreStudentName(name: String,nums: String) -> Double {
    return 0.0;
}

//好处:
//按住option + 鼠标的左键查看方法说明
let score = getScoreStudentName(name: "小明", nums: "12");


//第八种 和上面差不多
/**
 定义一个查询学生成绩的接口
 
 let score =  getScoreStudentName(name: "酷走天涯", nums: "111111111")
 
 - Parameters:
 - name:  学生姓名
 - nums:  学号
 - Returns: 返回学生成绩
 */

//提示 最好使用苹果官方提供的操作简单 option + command + /

//其他特别查找标注
// MARK: 粗体标签
// WARNING: 警告提示
// TODO: 提示未完成的地方
// FIXME: 提示需要修改的地方 


