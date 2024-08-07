//
//  main.swift
//  DemoCommand
//
//  Created by ElijahTan on 2024/5/10.
//

import Foundation

/*
算法步驟：
從右端開始找第一個「峰谷」：
從序列的右端開始，找到第一個位置 j，使得該位置的數字比其右邊的數字小。這表示在位置 j 及其右邊的數字目前是以遞減順序排列的，也就是所謂的「峰谷」位置。

例如，對於序列 [1, 2, 3, 6, 5, 4]，從右到左找出第一個位置 j = 2，因為 3 < 6。
找到 j 右邊的最小更大值 k：
在 j 位置右邊的所有數字中，找出一個比 Pj 大的最小數字，這個數字的位置記為 k。

在 [1, 2, 3, 6, 5, 4] 中，j = 2 對應的數字是 3，在其右邊找到最小的大於 3 的數字是 4，對應的位置 k = 5。
交換位置 j 和 k 的數字：
交換 Pj 和 Pk，這一步使得序列變得稍微大一點。

交換後的序列是 [1, 2, 4, 6, 5, 3]。
反轉 j 位置右邊的數字：
將位置 j 右邊的數字進行反轉，以便將該部分變成最小的升序排列。

反轉 [6, 5, 3]，得到 [1, 2, 4, 3, 5, 6]。
這樣的步驟保證了生成的序列是比當前序列大一點的下一個排列。

算法正確性證明：
這個算法的正確性來自於以下事實：

單調性： 在找到 j 之後，右邊的部分是遞減的，這意味著當前的序列已經是右半部分的最大排列，為了找下一個排列，我們需要改變 j 位置的數字。
局部最優： 在 j 右邊找到大於 Pj 的最小數字進行交換，確保變化最小，使得生成的序列比當前的稍微大一點。
反轉： 反轉右邊的數字是因為這部分是最大排列，反轉後變成最小排列，從而保證新生成的序列是字典序中緊跟當前排列之後的。
這樣的設計使得字典序法可以從任意一個排列生成其字典序中的下一個排列，從而可以依次生成所有的排列。
*/

// [1,2,3], [1,3,2], [2, 1, 3], [2, 3, 1], [3,1,2], [3,2,1]
class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        // find lowestIndex
        var lowestIndex = 0
        let len = nums.count
        for index in stride(from: len - 1, through: 1, by: -1) {
            if nums[index] > nums[index - 1] {
                lowestIndex = index - 1
                break
            }
        }
        
        // replace
        var grateThenLowestIndex: Int?
        for index in stride(from: len - 1, through: lowestIndex, by: -1) {
            if nums[index] > nums[lowestIndex], grateThenLowestIndex == nil {
                grateThenLowestIndex = index
            } else if nums[index] > nums[lowestIndex] , nums[index] < nums[grateThenLowestIndex!] {
                grateThenLowestIndex = index
            }
        }
        
        guard let grateThenLowestIndex else {
            nums.reverse()
            return
        }
        let grateThenLowest = nums[grateThenLowestIndex]
        nums[grateThenLowestIndex] = nums[lowestIndex]
        nums[lowestIndex] = grateThenLowest
        
        // reverse rest
        let subArray = Array(nums[lowestIndex + 1 ..< len].reversed())
        for i in 0 ..< subArray.count {
            nums[lowestIndex + 1 + i] = subArray[i]
        }
    }
}

var nums = [1, 2, 3, 4]


for _ in 0 ..< 15 {
    Solution().nextPermutation(&nums)
    print(nums)
}



