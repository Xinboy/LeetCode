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
    }
    
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        var resultDomains = [String: Int]()
        
        for str in cpdomains {
            let temp = str.components(separatedBy: " ")
            resultDomains[temp[1]] = Int(temp[0])
        }
        for (key, value) in resultDomains {
            for index in key.indices {
                if key[index] == "." {
                    let temp = String(key[key.index(after: index)...key.index(before: key.endIndex)])
                    if resultDomains.keys.contains(temp) {
                        let newTimes = resultDomains[temp]! + value
                        resultDomains[temp] = newTimes
                    } else {
                        resultDomains[temp] = value
                    }
                }
            }
            
        }
        var result = [String]()
        for (key, value) in resultDomains {
            result.append("\(value) \(key)")
        }
        return result
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

