//
//  ViewController.swift
//  LeetCode
//
//  Created by Xinbo Hong on 2018/3/6.
//  Copyright © 2018年 Xinbo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        self.getSum(3, 1)
        
        
    }
    func getSum(_ a: Int, _ b: Int) -> Int {
        let c = a & b
        let r = a ^ b
        return c == 0 ? r :(self.getSum(r, c << 1))
    }
    
    func getSum(_ a: Int, _ b: Int) -> Int {
        if a == 0 {
            return b
        }
        
        if b == 0{
            return a
        }
        var sum = a ^ b
        var carry = (a & b) << 1
        
        return getSum(sum,carry)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

