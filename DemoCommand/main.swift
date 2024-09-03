//
//  main.swift
//  DemoCommand
//
//  Created by ElijahTan on 2024/5/10.
//

import Foundation

class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        // 嘗試把每個元素, 放進對應 index 的位置 (nums[i] = i + 1)
        // index = 0 時 val = 1
        // index = 1 時 val = 2
        var (nums, n) = (nums, nums.count)
        
        for i in 0..<n {
            while nums[i] > 0 && nums[i] <= n && nums[nums[i] - 1] != nums[i] {
                print(i, "  >>  ", nums)
                (nums[nums[i] - 1], nums[i]) = (nums[i], nums[nums[i] - 1])
                print(nums)
            }
        }
        
        for (i, num) in nums.enumerated() {
            if num != i + 1 {
                return i + 1
            }
        }
        
        return n + 1
    }
}

let nums = [3,4,-1,1]

print(Solution().firstMissingPositive(nums))

