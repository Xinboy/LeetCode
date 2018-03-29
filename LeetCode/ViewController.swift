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
        print(self.findTheDifference("abcde", "cbased"))
    }
    
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var result = 0
        for sEn in s.unicodeScalars {
            result ^= sEn.hashValue
        }
        for tEn in t.unicodeScalars {
            result ^= tEn.hashValue
        }
        return Character(UnicodeScalar(result)!)
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

