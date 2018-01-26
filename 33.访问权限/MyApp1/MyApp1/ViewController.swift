//
//  ViewController.swift
//  MyApp1
//
//  Created by weifan on 2018/1/26.
//  Copyright © 2018年 xiaoguo. All rights reserved.
//

import UIKit
import MySDK

class ViewController: UIViewController {
    @IBAction func buttonAction(_ sender: Any) {
        
        let label = UILabel();
        self.view.addSubview(label);
        label.frame = CGRect(x: 10, y: UIScreen.main.bounds.height - 200, width: UIScreen.main.bounds.width - 20, height: 200);
        label.backgroundColor = UIColor.yellow;
        label.textAlignment = .center;
        label.numberOfLines = 0;
        //测试
//        let welCome = WelComeTest.init();
//        welCome.sayHello();
//        label.text = welCome.sayHello();
        //访问权限:Open
//        let openTest = OpenTest(string: "hello");
//        let openTestClass = OpenTestClass(string: "hello");
//
//        label.text = "\(openTest.returnStr()!)\n  \(openTestClass.returnStr()!)";
        
        //访问权限:Public
//        let publicTest = PublicTest(string: "hello");
//        label.text = publicTest.returnStr();
        
        //访问权限:InternalTest由PublicTest调用
//        let publicTest = PublicTest(string: "hello");
//        label.text = publicTest.internalTest();
        
        //访问权限:FilePrivate
//        let publicTest = PublicTest(string: "hello");
//        label.text = publicTest.filePrivateTest()
        //访问权限:Private
        let publicTest = PublicTest(string: "hello");
        label.text = publicTest.privateTest();

    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//MARK: open 测试重写
class OpenTestClass: OpenTest {
    
    override func returnStr() -> String? {
        return "继承并重写"
    }
    
}


