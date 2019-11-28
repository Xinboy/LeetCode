//
//  SortSimple.swift
//  LeetCode
//
//  Created by Xinbo Hong on 2019/11/23.
//  Copyright © 2019 Xinbo. All rights reserved.
//

import UIKit

class SortSimple: NSObject {

    
    /// 快速排序
    func quickSort(a: inout[Int], low: Int, high: Int) {
           if low > high {
               return
           }
           var i = low
           var j = high
           let key = a[i]
           
           while i < j {
               // 从右边开始比较，比key大的数位置不变
               while i < j && a[j] >= key {
                   j -= 1
               }
               // 只要出现一个比key小的数，将这个数放入左边i的位置
               a[i] = a[j]
               while i < j && a[i] <= key {
                   i += 1
               }
               // 只要出现一个比key大的数，将这个数放入右边j的位置
               a[j] = a[i]
           }
           // 将key放入i的位置，则左侧数都比key小，右侧数都比key大
           a[i] = key
           print(a);
           // 左递归
           quickSort(a: &a, low: low, high: i - 1)
           // 右递归
           quickSort(a: &a, low: i + 1, high: high)
           
       }
}
