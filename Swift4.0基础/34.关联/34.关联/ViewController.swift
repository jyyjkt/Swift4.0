//
//  ViewController.swift
//  34.关联
//
//  Created by weifan on 2018/2/6.
//  Copyright © 2018年 xiaoguo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func AssociationImplementAction(_ sender: Any) {
        
        animatedImageData()
        
    }
    
    func animatedImageData() -> Void {
        let image = UIImage(named: "4.png")
        let data = UIImagePNGRepresentation(image!);
        image?.animatedImageData = data;
        print(image?.animatedImageData);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

