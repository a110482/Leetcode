//
//  main.swift
//  DemoCommand
//
//  Created by ElijahTan on 2024/5/10.
//

import Foundation

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        print(nums)
        var ans = 1000000
        var left = 0
        var right = 0
        
        for center in 1 ..< nums.count - 1 {
            left = center - 1
            right = center + 1
            while right > left && right < nums.count && left >= 0 {
                let sum = nums[center] + nums[left] + nums[right]
                if sum == target {
                    return target
                } else if abs(target - sum) < abs(target - ans) {
                    ans = sum
                    // print("ind", left, center, right, "=", ans, "diff = \(abs(target - ans))")
                }
                
                if sum > target {
                    left -= 1
                } else {
                    right += 1
                }
            }
        }
        
        return ans
    }
}

let nums = [1,1,1,1]
let tar = -100
print(Solution().threeSumClosest(nums, tar))




