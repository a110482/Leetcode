//
//  main.swift
//  DemoCommand
//
//  Created by ElijahTan on 2024/5/10.
//

import Foundation


class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        guard s1.count + s2.count == s3.count else { return false }
        var dp = Array(repeating: Array(repeating: false, count: s1.count + 1), count: s2.count + 1)
        let s1 = Array(s1)
        let s2 = Array(s2)
        let s3 = Array(s3)
        
        func show() {
            for d in dp {
                print(d)
            }
            print("======")
        }
        
        for i in 0 ... s2.count {
            for j in 0 ... s1.count {
//                show()
//                print(i, j)
                // 1. 两个字符串都为空
                if i == 0, j == 0 {
                    dp[i][j] = true
                    continue
                }
                
                if j > 0,
                   s1[j - 1] == s3[i + j - 1],
                   dp[i][j - 1] {
                    dp[i][j] = true
                }
                
                if i > 0,
                   s2[i - 1] == s3[i + j - 1],
                   dp[i - 1][j] {
                    dp[i][j] = true
                }
            }
        }
        
        return dp[s2.count][s1.count]
    }
}


let s1 = "abc"
let s2 = "123"
let s3 = "ab12c3"

//let s1 = "aabcc"
//let s2 = "dbbca"
//let s3 = "aadbbcbcac"

print(Solution().isInterleave(s1, s2, s3))
