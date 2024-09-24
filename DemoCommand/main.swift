//
//  main.swift
//  DemoCommand
//
//  Created by ElijahTan on 2024/5/10.
//

import Foundation


class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else { return [] }
        let nums = nums.sorted()
//        print(nums)
        var ans: Set<Array<Int>> = []
        
        for c1 in 1 ..< nums.count - 2 {
            for c2 in c1 + 1 ..< nums.count - 1 {
                var left = c1 - 1, right = c2 + 1
                
                while left >= 0, right < nums.count {
                    let sum = nums[c1] + nums[c2] + nums[left] + nums[right]
//                    print(sum, [nums[left], nums[c1], nums[c2], nums[right]])
                    if sum == target {
                        ans.insert([nums[left], nums[c1], nums[c2], nums[right]])
                        // 數值已經相同了 所以只往左或只往右沒有意義, 只會得到相同結果或是不同的結果
                        // 所以要同時左右都跨一步
                        right += 1
                        left -= 1
                    } else if sum > target {
                        left -= 1
                    } else {
                        right += 1
                    }
                }
            }
        }
        return Array(ans)
    }
}


let nums = [-1,0,1,2,-1,-4], target = -1

print(Solution().fourSum(nums, target))
