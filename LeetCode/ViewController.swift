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
        print(self.numberOfLines([3,10,2,1,10,10,10,10,10,2,10,10,10,10,93,10,22,12,10,10,10,12,10,10,10,10], "asdjkajsdljfasdjjqweoiqutyzxocnmzzxcmnvsadasdlpqweoriwqweosczxkc"))
    }
    
    func numberOfLines(_ widths: [Int], _ S: String) -> [Int] {
        var lineCount = 1
        var units = 0
        for scalar in S.unicodeScalars {
            if units + widths[scalar.hashValue - 97] > 100 {
                lineCount += 1
                units = widths[scalar.hashValue - 97]
            } else {
                units += widths[scalar.hashValue - 97]
            }
        }
        return [lineCount, units]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

