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
        var nums = [0,1]
        self.moveZeroes(&nums)
    }
    func moveZeroes(_ nums: inout [Int]) {
        var end = nums.count - 1
        if nums.contains(0) {
            while end > -1 {
                if nums[end] == 0 {
                    nums.append(0)
                    nums.remove(at: end)
                }
                end -= 1
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

