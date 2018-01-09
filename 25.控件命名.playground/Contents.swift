//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//为什么要使用空间命名
//如果你不想给类型加前缀,然后又想避免出现类名冲突,这个时候,就可以使用它了

//代码实例
struct MyClassContrainer1{
    class Student {
        func getName() -> String {
            return "name";
        }
    }
}

struct MyClassContrainer2{
    class Student {
        func getName() -> String {
            return "name";
        }
    }
}

let student1 = MyClassContrainer1.Student();
let student2 = MyClassContrainer2.Student();

//应用场景1:
//我们想通知中心发送一条消息

class NotificationText{
    
    @objc func SocketConnectFailure(notification: Notification) -> Void {
        print("我接到通知只能是失败的");
    }
    
    func addNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(SocketConnectFailure(notification:)), name: Notification.Name("SocketConnectFailure"), object: nil);
    }
    
    func postNotification() {
        NotificationCenter.default.post(name: Notification.Name("SocketConnectFailure"), object: ["errorCode":000]);
        
    }
    
}

let notificationText = NotificationText();
notificationText.addNotification();
notificationText.postNotification();

//思考: 我们如果能够更加直观的知道SocketConnectFailure 是哪一类消息呢？

//命名空间优雅的写法

extension Notification.Name {
    /// 使用命名空间的方式
    public struct SocketTask {
        public static let connectFailure = Notification.Name(rawValue: "SocketConnectFailure")
        public static let connectSuccess = Notification.Name(rawValue: "SocketConnectSuccess")
    }
}

class Notification2 {
    
    @objc func SocketConnectTask(notification: Notification) -> Void{
    
        print("我接到通知只能是失败的");
    }
    
    func addNotification() -> Void {
        NotificationCenter.default.addObserver(self, selector: #selector(SocketConnectTask(notification:)), name: Notification.Name.SocketTask.connectFailure, object: ["errorCode":000])
    }
    
    func postNotification() -> Void {
        NotificationCenter.default.post(name: Notification.Name.SocketTask.connectFailure, object: nil);
    }
    
}

let notificationText2 = Notification2();
notificationText2.addNotification();
notificationText2.postNotification();



