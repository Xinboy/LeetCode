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
        print(self.uniqueMorseRepresentations(["g", "zasadadasdasdaen", "gig", "msg"]))
    }
    let encoding = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]

    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        var encodingSet = Set<String>()
        for word in words {
            var string = ""
            for scalar in word.unicodeScalars {
                string.append(encoding[scalar.hashValue - 97])
            }
            encodingSet.insert(string)
        }
        return encodingSet.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

