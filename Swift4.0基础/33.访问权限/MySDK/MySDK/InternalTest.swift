//
//  InternalTest.swift
//  MySDK
//
//  Created by weifan on 2018/1/26.
//  Copyright © 2018年 xiaoguo. All rights reserved.
//

import UIKit

class InternalTest{
    var string : String?;
    init(string: String) {
        self.string = string;
    }
    
    func returnStr() -> String? {
        return "\(string ?? "hello")-3.internal:默认访问级别,在整个模块内可以被访问,继承和重写.";
    }
}
