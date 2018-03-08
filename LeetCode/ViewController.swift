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
    
    let keyboardList = [["q","w","e","r","t","y","u","i","o","p"],
                        ["a","s","d","f","g","h","j","k","l"],
                        ["z","x","c","v","b","n","m"]]
    
    func findWords(_ words: [String]) -> [String] {
        
        /*
         1. 获取单词组的单词
         2. for: 获取单词的字符
         3. for: 获取键盘组的列表
         4. 判断字符是否存在列表中
         
         5. 如果字符不存在，获取下一个列表
         
         
         */
        
        var outArray: [String] = words
        for word in words {
            var isOut = true
            for c in word {
                if isOut {
                    for list in keyboardList {
                        if list.contains(String(c)) {
                            isOut = true
                            break
                        } else {
                            continue
                        }
                    }
                } else {
                    //不对的单词
                    
                    break
                }
            }
        }
        return outArray
    }
    
    func test(_ words: String) {
        var isOut = true
        for list in keyboardList {
            for c in words {
                if list.contains(String(c)) {
                    continue
                } else {
                    break
                }
            }
        }
        
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

