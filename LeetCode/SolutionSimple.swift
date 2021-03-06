
//
//  Solution.swift
//  LeetCode
//
//  Created by Xinbo Hong on 2018/3/6.
//  Copyright © 2018年 Xinbo. All rights reserved.
//

import UIKit

class SolutionSimple: NSObject {
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
    
    // MARK: - 2. Two Sum
    func addTwoNumbers_2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var resultNode: ListNode?, curNode1: ListNode? ,curNode2: ListNode?
        curNode1 = l1
        curNode2 = l2
        resultNode = ListNode.init(0)
        let dummy = resultNode
        
        var carry = 0
        while curNode1 != nil || curNode2 != nil {
            let var1 = curNode1?.val ?? 0
            let var2 = curNode2?.val ?? 0
            let sum = var1 + var2 + carry
            carry = sum / 10
            
            resultNode?.next = ListNode.init(sum % 10)
            
            resultNode = resultNode?.next
            curNode1 = curNode1?.next
            curNode2 = curNode2?.next
        }
        if carry > 0 {
            resultNode?.next = ListNode.init(carry)
        }
        return dummy?.next
    }
    
    // MARK: - 7. 反转整数
    func reverse_7(_ x: Int) -> Int {
        var result = 0
        var x1 = x
        while x1 != 0 {
            let b = x1 % 10
            result = result * 10 + b
            x1 = x1 / 10
        }
        if result > Int32.max || result < Int32.min {
            return 0
        } else {
            return result
        }
    }
    
    // MARK: -  9. 回文数
    func isPalindrome_9(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        var result = 0
        var x1 = x
        while x1 != 0 {
            let b = x1 % 10
            result = result * 10 + b
            x1 = x1 / 10
        }
        if result == x {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - 14. 最长公共前缀
    func longestCommonPrefix_14_mine(_ strs: [String]) -> String {
        var result = ""
        if strs.count == 1 {
            return strs.first!
        } else if strs.count == 0 {
            return ""
        } else {
            let firsts = strs.first!
            var index = 0
            
            while index < firsts.count {
                let mid = firsts.index(firsts.startIndex, offsetBy: index)
                let a = firsts[...mid]
                
                for i in 1..<strs.count {
                    let string = strs[i]
                    if mid == string.endIndex {
                        return result
                    } else {
                        let b = string[...mid]
                        if a == b {
                            if i != strs.count - 1 {
                                continue
                            } else {
                                result = String(a)
                            }
                        } else {
                            return result
                        }
                    }
                }
                index = index + 1
            }
            return result
        }
    }
    
    func longestCommonPrefix_14_best(_ strs: [String]) -> String {
        let count = strs.count
        
        if count == 0 {
            return ""
        }
        if count == 1 {
            return strs.first!
        }
        
        var result = strs.first!
        for i in 1..<count {
            while !strs[i].hasPrefix(result) {
                result = String(result.prefix(result.count - 1))
                if result.count == 0 {
                    return ""
                }
            }
        }
        return result
    }
    
    // MARK: - 20. 有效的括号
    
    func isValid_20(_ s: String) -> Bool {
        if s.count % 2 != 0 {
            return false
        }
        if s.count == 0 {
            return true
        }
        var list = [Character]()
        for index in s.indices {
            let char = s[index]
            if char == "{" || char == "(" || char == "[" {
                list.append(char)
            } else {
                switch char {
                case "}":
                    if list.last == "{" {
                        list.removeLast()
                    } else {
                        return false
                    }
                    break
                case ")":
                    if list.last == "(" {
                        list.removeLast()
                    } else {
                        return false
                    }
                    break
                case "]":
                    if list.last == "[" {
                        list.removeLast()
                    } else {
                        return false
                    }
                    break
                default:
                    break
                }
            }
        }
        if list.count > 0 {
            return false
        } else {
            return true
        }
    }
    
    // MARK: - 21. 合并两个有序链表
    func mergeTwoLists_21(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var curNode1 = l1
        var curNode2 = l2
        var resultNode = ListNode.init(0)
        let dummy = resultNode
        
        while curNode1 != nil || curNode2 != nil {
            
            let var1 = curNode1?.val ?? Int.max
            let var2 = curNode2?.val ?? Int.max
            var result = 0
            if var1 > var2 {
                result = (curNode2?.val)!
                curNode2 = curNode2?.next
            } else {
                result = (curNode1?.val)!
                curNode1 = curNode1?.next
            }
            
            resultNode.next = ListNode.init(result)
            resultNode = resultNode.next!
        }
        if curNode1 == nil {
            resultNode.next = curNode2
        } else if curNode2 == nil {
            resultNode.next = curNode1
        }
        
        return dummy.next
    }
    
    // MARK: - 26. 删除排序数组中的重复项
    func removeDuplicates_26(_ nums: inout [Int]) -> Int {
        let ss = Set(nums)
        nums = Array(ss)
        nums.sort { (a, b) -> Bool in
            a < b
        }
        return ss.count
    }
    
    // MARK: - 27. 移除元素
    func removeElement_27(_ nums: inout [Int], _ val: Int) -> Int {
        nums = nums.filter { (num) -> Bool in
            num != val
        }
        return nums.count
    }
    
    // MARK: - 28. 实现strStr()
    func strStr_28_mine(_ haystack: String, _ needle: String) -> Int {
        if needle == "" {
            return 0
        }
        let index = haystack.range(of: needle)
        if index != nil {
            return haystack.distance(from: haystack.startIndex, to: (index?.lowerBound)!)
        } else {
            return -1
        }
    }
    
    func strStr_28_best(_ haystack: String, _ needle: String) -> Int {
        //1.判断数据为空
        if haystack.count == 0 && needle.count > 0 {
            return -1
        }
        
        if haystack.count < needle.count {
            return -1
        }
        
        if  needle.count == 0 {
            return 0
        }
        let hChars = Array(haystack.suffix(haystack.count))
        let nChars = Array(needle.suffix(needle.count))
        
        let hLen = hChars.count
        let nLen = nChars.count
        
        //遍历数组
        for i in 0...hLen-nLen {
            //判断数组中字符与needle的首字符是否相等
            if hChars[i] == nChars[0] {
                for j in 0..<nLen {
                    //如果不等，直接退出
                    if hChars[i + j] != nChars[j] {
                        break
                    }
                    //如果j已经遍历到最后一位，就完全匹配，退出当前i的值
                    if j + 1 == nLen {
                        return i
                    }
                }
            }
        }
        
        return -1
    }
    
    // MARK: - 35. 搜索插入位置
    func searchInsert_35(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 || target == 0 {
            return 0
        }
        if target > nums.last!  {
            return nums.count
        }
        var index = 0
        for i in 0..<nums.count {
            if target <= nums[i] {
                index = i
                break
            }
        }
        return index
    }
    
    // MARK: - 38. 报数
    func countAndSay_38(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }
        if n == 2 {
            return "11"
        }
        var finalResult = "11"
        for _ in 3...n {
            finalResult = next(s: finalResult)
        }
        return finalResult
    }
    
    func next(s: String) -> String{
        var result = ""
        var i = 0
        while i < s.count {
            if i == s.count - 1 {
                result.append("1\(s[s.index(before: s.endIndex)])")
                break
            }
            if s[s.index(s.startIndex, offsetBy: i)] == s[s.index(s.startIndex, offsetBy: i + 1)] {
                if i == s.count - 2 {
                    result.append("2\(s[s.index(s.startIndex, offsetBy: i)])")
                    i = i + 2
                } else {
                    if s[s.index(s.startIndex, offsetBy: i + 1)] == s[s.index(s.startIndex, offsetBy: i + 2)] {
                        result.append("3\(s[s.index(s.startIndex, offsetBy: i)])")
                        i = i + 3
                    } else {
                        result.append("2\(s[s.index(s.startIndex, offsetBy: i)])")
                        i = i + 2
                    }
                }
            } else {
                result.append("1\(s[s.index(s.startIndex, offsetBy: i)])")
                i = i + 1
            }
        }
        return result
    }
    // MARK: - 58. 最后一个单词的长度
    func lengthOfLastWord_58(_ s: String) -> Int {
        let tempArray = s.components(separatedBy: " ")
        var string: String = ""
        for i in (0..<tempArray.count).reversed() {
            
            if tempArray[i] != "" {
                string = tempArray[i]
                break
            }
        }
        return string.count
    }
    
    func lengthOfLastWord_58_best(_ s: String) -> Int {
        return s.split(separator: " ").last?.count ?? 0
    }
    
    
    // MARK: - 66. 加一
    func plusOne_68(_ digits: [Int]) -> [Int] {
        var result = digits
        if result.last! + 1 > 9 {
            result[result.count - 1] = 0
            
            for i in (0..<result.count - 1).reversed() {
                if result[i] + 1 > 9 {
                    result[i] = 0
                    if i == 0 {
                        result.insert(1, at: 0)
                    }
                } else {
                    result[i] = result[i] + 1
                    break
                }
            }
            if result.count == 1{
                result.insert(1, at: 0)
            }
            return result
        } else {
            result[result.count - 1] = result[result.count - 1] + 1
            return result
        }
    }
    
    func plusOne_66_best(_ digits:[Int]) -> [Int] {
        guard digits.count != 0 else {
            return digits
        }
        
        let count = digits.count
        var cur = count - 1
        var result = digits
        
        while cur >= 0 {
            //高位需要进位
            if result[cur] == 9 {
                result[cur] = 0
            }else { //高位不需要进位
                result[cur] += 1
                return result
            }
            cur -= 1
        }
        //数组的首位是否为0
        if result[0] == 0 {
            result.insert(1, at:0)
        }
        
        return result
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
            let val = abs(nums[i]) - 1
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
    
    // MARK: - 371. Sum of Two Integers
    func getSum_371_mine(_ a: Int, _ b: Int) -> Int {
        let c = a & b
        let r = a ^ b
        return c == 0 ? r :(getSum_371_mine(r, c << 1))
    }
    
    func getSum_371_best(_ a: Int, _ b: Int) -> Int {
        if a == 0 {
            return b
        }
        
        if b == 0{
            return a
        }
        let sum = a ^ b
        let carry = (a & b) << 1
        
        return getSum_371_best(sum,carry)
    }
    
    // MARK: - 788. Rotated Digits
    func rotatedDigits_788_mine(_ N: Int) -> Int {
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
    
    func good_788_best( n:Int, flag:Bool)->Bool{
        if (n == 0) {return flag}
        
        let d = n % 10
        if (d == 3 || d == 4 || d == 7) {return false}
        if (d == 0 || d == 1 || d == 8) {return good_788_best(n: n/10, flag: flag)}
        return good_788_best(n: n/10, flag: true)//good(n / 10, true)
    }
    
    func rotatedDigits_788_best(_ N: Int) -> Int {
        var goodNumCount = 0
        for n in 1...N{
            if good_788_best(n: n, flag: false){
                goodNumCount += 1
            }
        }
        return goodNumCount
    }
    
    // MARK: - 171. Excel Sheet Column Number
    let columnDict = ["A":1,"B":2,"C":3,
                      "D":4,"E":5,"F":6,
                      "G":7,"H":8,"I":9,
                      "J":10,"K":11,"L":12,
                      "M":13,"N":14,"O":15,
                      "P":16,"Q":17,"R":18,
                      "S":19,"T":20,"U":21,
                      "V":22,"W":23,"X":24,
                      "Y":25,"Z":26]
    
    func titleToNumber_171_mine(_ s: String) -> Int {
        if s.count == 1 {
            return columnDict[s]!
        } else {
            var result = columnDict[String(s[s.startIndex])]!
            for index in s.indices {
                if index == s.index(s.endIndex, offsetBy: -1) {
                    return result
                } else {
                    result = result * 26 + columnDict[String(s[s.index(index, offsetBy: 1)])]!
                }
            }
            return result
        }
    }
    
    func titleToNumber_171_best(_ s: String) -> Int {
        var sum = 0
        for char in s.unicodeScalars  {
            sum *= 26
            sum += (Int(char.value) - 64)
        }
        return sum
    }
    
    // MARK: - 349. Intersection of Two Arrays
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let num1Set = Set(nums1)
        let num2Set = Set(nums2)
        var result = [Int]()
        
        for i in num2Set {
            if num1Set.contains(i) {
                result.append(i)
            }
        }
        return result
    }
    
    // MARK: - 598. Range Addition II
    func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {
        var min1 = m, min2 = n
        for op in ops {
            min1 = min(op.first!, min1)
            min2 = min(op.last!, min2)
        }
        return min1 * min2
    }
    
    // MARK: - 13. Roman to Integer
    let romanDict = ["I": 1, "V": 5, "X": 10, "C": 100, "M": 1000, "L": 50, "D": 500]
    func romanToInt_13_mine(_ s: String) -> Int {
        var result = 0
        var i = 0
        for index in s.indices {
            if i >= s.count - 1 || romanDict[String(s[s.index(after: index)])]! <= romanDict[String(s[index])]! {
                result += romanDict[String(s[index])]!
            } else {
                result -= romanDict[String(s[index])]!
            }
            i += 1
        }
        return result
    }
    

    func charToNum(_ c: Character) -> Int {
        switch(c) {
        case "M":
            return 1000
        case "D":
            return 500
        case "C":
            return 100
        case "L":
            return 50
        case "X":
            return 10
        case "V":
            return 5
        case "I":
            return 1
        default:
            return 0
        }
    }
    func romanToInt_13_best(_ s: String) -> Int {
        var prev = 0
        var ret = 0
        
        for c in s.reversed() {
            let val = charToNum(c)
            
            if val < prev {
                ret -= val
            } else {
                ret += val
                prev = val
            }
            
        }
        
        return ret
    }
    
    // MARK: - 453. Minimum Moves to Equal Array Elements
    func minMoves_453(_ nums: [Int]) -> Int {
        var sum = 0
        for i in nums {
            sum += i
        }
        return sum - nums.min()! * nums.count
    }
    
    // MARK: - 70. 爬楼梯
    func climbStairs_70_mine(_ n: Int) -> Int {
        if n < 0 {
            return 0
        }
        if n < 3 {
            return n
        }
        
        var array: Array<Int> = Array.init(repeating: 0, count: n)
        array[0] = 1
        array[1] = 2
        for i in 2..<n {
            array[i] = array[i - 1] + array[i - 2]
        }
        
        return array[n-1]
        
    }
    
    func climbStairs_70_best(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        if n < 3 {
            return n
        }
        
        var pre = 1
        var next = 2
        var result = pre + next
        for _ in 3...n {
            result = pre + next
            pre = next
            next = result
        }
        
        return result
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









