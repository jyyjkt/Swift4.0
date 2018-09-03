//
//  PublicTest.swift
//  MySDK
//
//  Created by weifan on 2018/1/26.
//  Copyright © 2018年 xiaoguo. All rights reserved.
//

import UIKit

public class PublicTest {
    
    public var string : String?;
    public init(string: String) {
        self.string = string;
    }
    
    deinit {
        print("父类");
    }
    
    public func returnStr() -> String? {
        let publicTestClass = PublicTestClass(string: "hello");
        
        return "\(string ?? "hello")-2.public:公有访问权限，类或者类的公有属性或者公有方法可以从文件或者模块的任何地方进行访问,但是Swift3.0后在其他模块不能被继承和重写.\n\(publicTestClass.returnStr()!)";
    }
    
    public func internalTest() -> String? {
        let internalTest = InternalTest(string: "hello");
        let internalTestClass = InternalTestClass(string: "hello");
        
        return "\(internalTest.returnStr()!)\n\(internalTestClass.returnStr()!)";
    }
    
    public func filePrivateTest() -> String? {
        let filePrivateTest = FilePrivateTest(string: "hello");
        return filePrivateTest.returnStr();
    }
    
    public func privateTest() -> String? {
        let privateTest = PrivateTest(string: "hello");
        return privateTest.returnStr();
    }
    
    private class PrivateTest{
        
        public var string : String?;
        public init(string: String) {
            self.string = string;
        }
        
        deinit {
            print("父类");
        }
        
        public func returnStr() -> String? {
            
            let privateTestClass = PrivateTestClass(string: "hello");
            
            return "\(string ?? "hello")-private:私有访问权限,被private修饰的类或者类的属性或方法可以在同一个物理文件中的同一个类型(包含extension)访问,继承和重写.\n\(privateTestClass.returnStr()!)";
        }
        
    }
    
    private class PrivateTestClass : PrivateTest {
        override func returnStr() -> String? {
            return "统一文件统一类中继承和重写"
        }
    }
    
    
}
//MARK: filePrivate
fileprivate class FilePrivateTest {
    
    public var string : String?;
    public init(string: String) {
        self.string = string;
    }
    
    deinit {
        print("父类");
    }
    
    public func returnStr() -> String? {
        
        let filePrivateTestClass = FilePrivateTestClass(string: "hello");
        
        return "\(string ?? "hello")-4.filePrivate:文件私有访问权限,超出该物理文件那么有着fileprivate访问权限的类, 属性和方法就不能被访问,继承和重写.\n\(filePrivateTestClass.returnStr()!)";
    }
    
}



// MARK: public:不能高于父类权限 public
public class PublicTestClass : PublicTest {
    
    deinit {
        print("子类");
    }
    
    public override func returnStr() -> String? {
        return "模块内继承和重写"
    }
}

// MARK: internal:不能高于父类权限 internal
class InternalTestClass : InternalTest {
    public override func returnStr() -> String? {
        return "模块内继承和重写"
    }
}

// MARK: filePrivate:不能高于父类权限 filePrivate
fileprivate class FilePrivateTestClass : FilePrivateTest {
    deinit {
        print("FilePrivateTestClass 子类")
    }
    public override func returnStr() -> String? {
        return "文件内继承和重写"
    }
}

