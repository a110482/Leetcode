//
//  main.swift
//  DemoCommand
//
//  Created by ElijahTan on 2024/5/10.
//

import Foundation

class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        let matrix = matrix.map({ $0.map({ $0 == "1" }) })
        var dp = Array(repeating: Array(repeating: Results(), count: matrix[0].count + 1), count: matrix.count + 1)
        var maxVal = 0
         
        for i in 0 ... matrix.count {
            for j in 0 ... matrix[0].count {
                let res: Results
                if i == 0 || j == 0 {
                    res = Results()
                } else if matrix[i-1][j-1] {
                    let addWidth = dp[i - 1][j].addWidth(with: dp[i][j - 1])
                    let addHeight = dp[i][j - 1].addHeight(with: dp[i - 1][j])
                    res = addWidth + addHeight
                } else {
                    res = Results()
                }
                dp[i][j] = res
                maxVal = max(maxVal, res.maxCross)
            }
        }
        return maxVal
    }
}

struct Results {
    var currentRes: [(w: Int, h: Int)] = []
    var maxCross: Int {
        currentRes.map(*).max() ?? 0
    }
    
    mutating func addWidth(with lastYResults: Results) -> Results {
        guard !currentRes.isEmpty else {
            return Results.one
        }
        var newResult = Results()
        currentRes = prune()
        newResult.currentRes = currentRes.map({
            let lastResultsHeight = lastYResults.currentRes.map({ $0.h }).max() ?? 0
            return ($0.w + 1, min($0.h, lastResultsHeight + 1))
        })
        
        return newResult
    }
    
    func addHeight(with lastXResults: Results) -> Results {
        guard !currentRes.isEmpty else { return Results() }
        var newResult = Results()
        newResult.currentRes = currentRes.map({
            let lastResultsWidth = lastXResults.currentRes.map({ $0.w }).max() ?? 0
            return (min($0.w, lastResultsWidth + 1), $0.h + 1)
        })
        return newResult
    }
    
    func prune() -> [(w: Int, h: Int)] {
        var newCurrentRes: [(w: Int, h: Int)] = []
        for c in currentRes.sorted(by: { $0.w < $1.w }) {
            newCurrentRes.removeAll(where: {
                $0.w <= c.w && $0.h <= c.h
            })
            newCurrentRes.append(c)
        }
        return newCurrentRes
    }
    
    static func + (lhs: Results, rhs: Results) -> Results {
        var newResult = Results()
        newResult.currentRes = lhs.currentRes + rhs.currentRes
        return newResult
    }
    
    static var one: Results {
        var r = Results()
        r.currentRes = [(1,1)]
        return r
    }
}

//let m: [[Character]] = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
let m = testCase1
print(Solution().maximalRectangle(m))

