//
//  ViewController.swift
//  LeetCode
//
//  Created by Xinbo Hong on 2018/3/6.
//  Copyright © 2018年 Xinbo. All rights reserved.
//

import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        print(minCostClimbingStairs([10, 15, 20]))
        
        
        return
        
        
        let result1 = multoZhi(nums: 100)
        
        print(result1)
        
        
        //124
        let l1 = ListNode.init(1);
        let l11 = ListNode.init(4);
        let l111 = ListNode.init(7);
        l1.next = l11
        l11.next = l111
//        l111.next = l1111
        print("1-")
        print(Unmanaged.passUnretained(l1).toOpaque())
        print(Unmanaged.passUnretained(l11).toOpaque())
        print(Unmanaged.passUnretained(l111).toOpaque())
        //135
        let l2 = ListNode.init(1);
        let l22 = ListNode.init(3);
        let l222 = ListNode.init(6);
        l2.next = l22
        l22.next = l222
        print("2-")
        print(Unmanaged.passUnretained(l2).toOpaque())
        print(Unmanaged.passUnretained(l22).toOpaque())
        print(Unmanaged.passUnretained(l222).toOpaque())
        
        let result = self.mergeTwoLists(l1, l2)
        
        
        var resultArray: [Int] = []
        var temp = result
        while temp != nil {
            resultArray.append(temp!.val)
            temp = temp!.next
        }
        

    }
    
    // MARK: - 746. 爬楼梯
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        
        if cost.count < 2 {
            return 0
        }
        if cost.count == 2 {
            return min(cost[0], cost[1])
        }
        
        // 第一步判断是哪个台阶
        var i = cost[0] < cost[1] ? 0 : 1
        
        var result = min(cost[0], cost[1])
        while i < cost.count {
//            if min
        }
        
        
    
        return result

        
    }
    
    
    // MARK: - 6. Z 字形变换
    func convert(_ s: String, _ numRows: Int) -> String {
        var result = [[String.Index]]()
        
        let dis = numRows - 2
        let sec = s.count / (numRows + dis)
        let last = s.count % (numRows + dis)
        
        for i in 0...sec {
            let diss = 0
            while diss < dis + 1 {
                if diss == 0 {
                    for j in 0..<numRows {
                        result[i][j] = s.index(s.startIndex, offsetBy: i + j)
                    }
                } else {
                    result[diss][numRows - diss] = s.index(s.startIndex, offsetBy: numRows * sec + diss)
                }
            }
        }
        return String()
        
        
    }
    
    
    
    
    

    
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
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
    
    
    
    // MARK: - 创母体面试题
    // 1到100数，求质数
    // 1、乘法
    func multoZhi(nums: Int) -> Array<Int> {
        var result = [1, 2, 3]

        for num in 4...nums {
            var isZhi = true
            for i in 2...num {
                for j in 2...num {
                    if i * j == num {
                        isZhi = false
                    }
                }
            }
            if isZhi {
                result.append(num)
            }
        }
        
        return result
    }
   
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
}

