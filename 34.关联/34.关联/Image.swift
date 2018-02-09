//
//  Image.swift
//  34.关联
//
//  Created by weifan on 2018/2/6.
//  Copyright © 2018年 xiaoguo. All rights reserved.
//

import UIKit

private var animatedImageDataKey: Void? 

extension UIImage {
    //错误 扩展可能不包含存储属性
    //因为在扩展中无法实现"实例变量",所以属性setter没办法实现
    //所以使用关联对象 AssociatedObject

//    var animatedImageData: Data?{
//        get {
//            //写死不好只能PNG
//            let data = UIImagePNGRepresentation(self);
//            return data;
//        }
//        set {
//            animatedImageData = newValue;
//        }
//
//    }
    
    //使用
    /**
     * Returns the value associated with a given object for a given key.
     *  返回与给定对象对于一个给定的键相关联的值。
     * @param object The source object for the association.该协会的源对象。
     * @param key The key for the association.关联的key。
     *
     * @return The value associated with the key \e key for \e object.
     *          返回值关联键和源对象
     * @see objc_setAssociatedObject
     */
//    @available(iOS 3.1, *)
//    public func objc_getAssociatedObject(_ object: Any, _ key: UnsafeRawPointer) -> Any?
    
    var animatedImageData : Data? {
        get {
           return objc_getAssociatedObject(self, &animatedImageDataKey) as? Data
        }
        set {
            
            objc_setAssociatedObject(self, &animatedImageDataKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    
    
}
