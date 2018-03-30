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
        print(self.rotatedDigits(30))
        
        
    }
    func rotatedDigits(_ N: Int) -> Int {
        var count = 0
        for num in 1..<N+1 {
            let numStr = String(num)
            if (!numStr.contains("3") && !numStr.contains("4") && !numStr.contains("7")) {
                if (numStr.contains("2") || numStr.contains("5") || numStr.contains("6") || numStr.contains("9")) {
                    count += 1
                }
            }
        }
        return count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

