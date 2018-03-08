
//
//  Solution.swift
//  LeetCode
//
//  Created by Xinbo Hong on 2018/3/6.
//  Copyright © 2018年 Xinbo. All rights reserved.
//

import UIKit

class Solution: NSObject {
    func twoSum_0(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            for j in (i + 1)..<nums.count {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }
        return [0,0]
    }
    
    func numJewelsInStones_771(_ J: String, _ S: String) -> Int {
        var sum = 0
        for c in J {
            let index = S.index(of: c)
            if index != nil {
                let temp = S.replacingOccurrences(of: c.description, with: "")
                sum += S.count - temp.count
            }
        }
        return sum
    }
    func hammingDistance_461(_ x: Int, _ y: Int) -> Int {
        var result = dec2bin(x^y)
        result = result.replacingOccurrences(of: "0", with: "")
        return result.count
    }
    
    func judgeCircle_657(_ moves: String) -> Bool {
        var resultLR = 0
        var resultUD = 0
        for c in moves {
            switch(c) {
            case "L":
                resultLR = resultLR + 1
                break
            case "R":
                resultLR = resultLR - 1
                break
            case "U":
                resultUD = resultUD + 1
                break
            case "D":
                resultUD = resultUD - 1
                break
            default:
                break
            }
        }
        
        if resultLR == 0  && resultUD == 0 {
            return true
        } else {
            return false
        }
        
    }
    
    func selfDividingNumbers_728(_ left: Int, _ right: Int) -> [Int] {
        var index = 1
        var numbers: [Int] = []
        for i in left...right {
            var num = i
            index = 1
            while(num > 0) {
                let indexInt = num % 10
                if indexInt == 0 {
                    break
                }
                if i % indexInt == 0 {
                    num = num / 10
                    index = index * 10
                    if num == 0 {
                        numbers.append(i)
                    }
                } else {
                    break
                }
            }
        }
        return numbers
    }
    
    func arrayPairSum_561(_ nums: [Int]) -> Int {
        let t = nums.sorted { (s1, s2) -> Bool in
            return s1 < s2
        }
        var sum = 0
        for i in 0..<nums.count {
            if i % 2 == 0 {
                sum = sum + t[i]
            }
        }
        return sum
    }
    
    func findComplement_476(_ num: Int) -> Int {
        let binStr = dec2bin(num)
        var binArray =  Array(binStr)
        for i in 0..<binArray.count {
            switch binArray[i]{
            case "0":
                binArray[i] = "1"
                break
            case "1":
                binArray[i] = "0"
                break
            default:
                break
            }
        }
        return self.binTodec(number: String(binArray))
        
    }
    
    func reverseString_344(_ s: String) -> String {
        var varS = ""
        for i in s{
            varS.insert(i, at: s.startIndex)
        }
        return varS
    }
    
    func reverseWords_557(_ s: String) -> String {
        var strArray = s.components(separatedBy: " ")
        for i in 0...strArray.count - 1 {
            strArray[i] = self.reverseString_344(strArray[i])
        }
        return strArray.joined(separator: " ")
    }
    
    let keyboardList = [["q","w","e","r","t","y","u","i","o","p"],
                        ["a","s","d","f","g","h","j","k","l"],
                        ["z","x","c","v","b","n","m"]]
    
    func findWords(_ words: [String]) -> [String] {
        var outArray: [String] = []
        for word in words {
            for list in keyboardList {
                for index in word.indices {
                    if list.contains(String(word[index]).lowercased()) {
                        if index.encodedOffset == word.endIndex.encodedOffset - 1 {
                            outArray.append(word)
                            break
                        }
                        continue
                    } else {
                        break
                    }
                }
            }
        }
        return outArray
    }
    
    //MARK:- 私有方法
    func dec2bin(_ number:Int) -> String {
        var number = number
        var str = ""
        while number > 0 {
            str = "\(number % 2)" + str
            number /= 2
        }
        return str
    }
    
    func binTodec(number num: String) -> Int {
        var sum: Int = 0
        for c in num {
            let str = String(c)
            sum = sum * 2 + Int(str)!
        }
        return sum
    }
    
    func logCal(root: Int, val: Int) -> Int {
        return Int(log(Double(val)) / log(Double(root)))
    }
    
}









