
//
//  Solution.swift
//  LeetCode
//
//  Created by Xinbo Hong on 2018/3/6.
//  Copyright © 2018年 Xinbo. All rights reserved.
//

import UIKit

class Solution: NSObject {
    // MARK: - 1. Two Sum
    func twoSum_1(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            for j in (i + 1)..<nums.count {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }
        return [0,0]
    }
    
    // MARK: - 771. Jewels and Stones
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
    // MARK: - 461. Hamming Distance
    func hammingDistance_461(_ x: Int, _ y: Int) -> Int {
        var result = dec2bin(x^y)
        result = result.replacingOccurrences(of: "0", with: "")
        return result.count
    }
    
    // MARK: - 657. Judge Route Circle
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
        
        if resultLR == 0 && resultUD == 0 {
            return true
        } else {
            return false
        }
        
    }
    
    // MARK: - 728. Self Dividing Numbers
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
    
    // MARK: - 561. Array Partition I
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
    
    // MARK: - 476. Number Complement
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
    
    // MARK: - 344. Reverse String
    func reverseString_344(_ s: String) -> String {
        var varS = ""
        for i in s{
            varS.insert(i, at: s.startIndex)
        }
        return varS
    }
    
    // MARK: - 557. Reverse Words in a String III
    func reverseWords_557(_ s: String) -> String {
        var strArray = s.components(separatedBy: " ")
        for i in 0...strArray.count - 1 {
            strArray[i] = self.reverseString_344(strArray[i])
        }
        return strArray.joined(separator: " ")
    }
    
    // MARK: - 500. Keyboard Row
    let keyboardList = [["q","w","e","r","t","y","u","i","o","p"],
                        ["a","s","d","f","g","h","j","k","l"],
                        ["z","x","c","v","b","n","m"]]
    
    func findWords_500(_ words: [String]) -> [String] {
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
    
    // MARK: - 412. Fizz Buzz
    func fizzBuzz_412(_ n: Int) -> [String] {
        var stringArr: [String] = []
        for i in 1...n {
            var str = ""
            if i % 3 == 0 {
                str.append("Fizz")
            }
            if i % 5 == 0 {
                str.append("Buzz")
            }
            if str.isEmpty {
                str.append(String(i))
            }
            stringArr.append(str)
        }
        return stringArr
    }
    
    // MARK: - 575. Distribute Candies
    func distributeCandies_575(_ candies: [Int]) -> Int {
        var kinds = Set<Int>()
        for i in candies {
            kinds.insert(i)
        }
        return kinds.count > candies.count / 2 ? candies.count / 2 : kinds.count
    }
    
    // MARK: - 682. Baseball Game
    func calPoints_682(_ ops: [String]) -> Int {
        var musOps: [Int] = []
        var sum = 0
        
        for i in 0..<ops.count {
            switch ops[i] {
            case "C":
                musOps.removeLast()
                break
            case "D":
                musOps.append(musOps.last! * 2)
                break
            case "+":
                musOps.append(musOps.last! + musOps[musOps.count - 2])
                break
            default:
                musOps.append(Int(ops[i])!)
                break
            }
        }
        for num in musOps {
            sum = sum + num
        }
        return sum
        
    }
    
    // MARK: - 566. Reshape the Matrix
    func matrixReshape_566(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        if r * c > nums.first!.count * nums.count {
            return nums
        }
        //返回数据
        var newNums: [[Int]] = []
        var temp: [Int] = []
        for numArray in nums {
            for index in numArray {
                temp.append(index)
                if temp.count == c {
                    newNums.append(temp)
                    temp.removeAll()
                }
            }
        }
        return newNums
    }
    
    // MARK: - 796. Rotate String
    func rotateString_796(_ A: String, _ B: String) -> Bool {
        var tempA = A
        for _ in 0..<A.count {
            if tempA == B {
                return true
            } else {
                tempA.append(tempA[tempA.startIndex])
                tempA.remove(at: tempA.startIndex)
            }
            
        }
        return false
    }
    
    // MARK: - 496. Next Greater Element I
    func nextGreaterElement_496(_ findNums: [Int], _ nums: [Int]) -> [Int] {
        var tempFind = findNums
        
        for i in 0..<findNums.count {
            tempFind[i] = nextGreater(num: findNums[i], index: nums.index(of: findNums[i])!, nums: nums)
        }
        return tempFind
    }
    
    func nextGreater(num: Int, index: Int, nums: [Int]) -> Int{
        if index + 1 == nums.count {
            return -1
        }
        if num < nums[index + 1] {
            return nums[index + 1]
        }
        return nextGreater(num: num, index: index + 1, nums: nums)
    }
    
    // MARK: - 693. Binary Number with Alternating Bits
    func hasAlternatingBits_693(_ n: Int) -> Bool {
        if n == 1{
            return false
        }
        let bits = dec2bin(n)
        for index in bits.indices {
            if index == bits.startIndex {
                continue
            }
            if bits[index] != bits[bits.index(index, offsetBy: -1)] {
                if index == bits.index(before: bits.endIndex) {
                    return true
                } else {
                    continue
                }
                
            } else {
                return false
            }
        }
        return false
    }
    
    // MARK: - 697. Degree of an Array
    
    struct Degree: Hashable {
        var hashValue: Int {
            return min + max + cnt
        }
        
        var min: Int = 49999
        var max: Int = 0
        var cnt: Int = 0
        var degree: Int = 0
        
        static func == (lhs: Degree, rhs: Degree) -> Bool {
            return lhs.min == rhs.min
                && lhs.max == rhs.max
                && lhs.cnt == rhs.cnt
                && lhs.degree == rhs.degree
        }
        
    }
    
    var tempNums_697 = [Degree].init(repeating:Degree.init(), count: 50000)
    func findShortestSubArray(_ nums: [Int]) -> Int {
        var index = 0
        for i in nums {
            tempNums_697[i].min = index < tempNums_697[i].min ? index : tempNums_697[i].min
            tempNums_697[i].max = index > tempNums_697[i].max ? index : tempNums_697[i].max
            tempNums_697[i].cnt = tempNums_697[i].cnt + 1
            tempNums_697[i].degree = tempNums_697[i].max - tempNums_697[i].min + 1
            index = index + 1
        }
        
        let tempSet = Set(tempNums_697)
        var cnt = 0
        var result = 49999
        for numIndex in tempSet {
            if numIndex.cnt == 0 {
                continue
            }
            if cnt <= numIndex.cnt &&
                numIndex.min <= numIndex.max {
                
                if cnt == numIndex.cnt {
                    result = result < numIndex.degree ? result : numIndex.degree
                } else {
                    result = numIndex.degree
                }
                cnt = numIndex.cnt
            }
        }
        return result
    }
    // MARK: - 521. Longest Uncommon Subsequence I
    func findLUSlength_521(_ a: String, _ b: String) -> Int {
        if a == b {
            return -1
        }
        return a.count > b.count ? a.count : b.count
    }
    
    // MARK: - 136. Single Number

    func singleNumber_136_best(_ nums: [Int]) -> Int {
        
        var value = 0
        for item in nums {
            value ^= item
        }
        return value
    }
    
    func singleNumber_136_mine(_ nums: [Int]) -> Int {
        var result = 0
        let temp = nums.sorted { (s1, s2) -> Bool in
            return s1 < s2
        }
        for i in stride(from: 0, to: temp.count, by: 2) {
            if i == temp.count - 1 {
                result = temp[i]
                break
            } else if temp[i] != temp[i + 1] {
                result = temp[i]
                break
            }
        }
        return result
    }
    // MARK: - 762. Prime Number of Set Bits in Binary Representation
    func countPrimeSetBits_762(_ L: Int, _ R: Int) -> Int {
        var count = 0
        for i in L...R {
            
            var oneCount = 0, tempIndex = i
            while (tempIndex > 0) {
                if tempIndex & 1 == 1 {
                    oneCount = oneCount + 1
                }
                tempIndex >>= 1
            }
            if self.isPrime(oneCount) {
                count = count + 1
            }
        }
        return count
    }
    
    func isPrime(_ n: Int) -> Bool {
        if n < 2 {
            return false
        }
        if n < 4 {
            return true
        }
        for i in 2...Int(sqrt(Double(n))) {
            if n % i == 0 {
                return false
            }
        }
        return true
    }
    
    // MARK: - 485. Max Consecutive Ones
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var result = 0
        var count = 0
        
        for num in nums {
            if num == 1 {
                count = count + 1
            } else {
                if result < count {
                    result = count
                }
                count = 0
            }
        }
        if result < count {
            result = count
        }
        
        return result
    }
    // MARK: - 520. Detect Capital
    
    func detectCapitalUse_520_best(_ word: String) -> Bool {
        return word[word.index(word.startIndex, offsetBy: 1)...].lowercased() == word[word.index(word.startIndex, offsetBy: 1)...] || word.uppercased() == word
    }
    
    
    let capital = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    func detectCapitalUse_520_mine(_ word: String) -> Bool {
        let str = self.pregReplace(str: word, pattern: "[a-z]", with: "")
        if capital.contains(word[word.startIndex]) {
            if str.count == 1 || str.count == word.count {
                return true
            }
        } else {
            if str.count == 0 {
                return true
            }
        }
        return false
    }
    
    func pregReplace(str: String ,pattern: String, with: String,
                     options: NSRegularExpression.Options = []) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: options)
        return regex.stringByReplacingMatches(in: str, options: [],
                                              range: NSMakeRange(0, str.count),
                                              withTemplate: with)
    }
    
    // MARK: - 258. Add Digits
    func addDigits_258_mine(_ num: Int) -> Int {
        
        var munum = num
        var sum = 0
        while (munum > 0) {
            sum = sum + munum % 10
            munum = munum / 10
        }
        if sum < 10 {
            return sum
        }
        return addDigits_258_mine(_: sum)
    }
    
    func addDigits_258_best(_ num: Int) -> Int {
        return 1 + (num - 1) % 9
    }
    
    // MARK: - 283. Move Zeroes
    func moveZeroes_283(_ nums: inout [Int]) {
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
    
    // MARK: - 804. Unique Morse Code Words
    let encoding = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
    func uniqueMorseRepresentations_804(_ words: [String]) -> Int {
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
    
    // MARK: - 806. Number of Lines To Write String
    func numberOfLines_806(_ widths: [Int], _ S: String) -> [Int] {
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
    // MARK: - 389. Find the Difference
    func findTheDifference_389(_ s: String, _ t: String) -> Character {
        var result = 0
        for sEn in s.unicodeScalars {
            result ^= sEn.hashValue
        }
        for tEn in t.unicodeScalars {
            result ^= tEn.hashValue
        }
        return Character(UnicodeScalar(result)!)
    }
    // MARK: - 448. Find All Numbers Disappeared in an Array
    func findDisappearedNumbers_448_mine(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result: [Int] = []
        let numsSet = Set(nums)
        var i = 1
        while i <= n {
            if !numsSet.contains(i) {
                result.append(i)
            }
            i += 1
            if result.count == nums.count - numsSet.count {
                break
            }
        }
        return result
    }
    
    func findDisappearedNumbers_448_best(_ nums: [Int]) -> [Int] {
        var res = [Int]()
        var nums = nums
        for i in 0..<nums.count{
            var val = abs(nums[i]) - 1
            if nums[val] > 0{
                nums[val] = -nums[val]
            }
        }
        
        for i in 0..<nums.count{
            if nums[i]>0{
                res.append(i+1)
            }
        }
        return res
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









