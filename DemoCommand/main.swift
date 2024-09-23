//
//  main.swift
//  DemoCommand
//
//  Created by ElijahTan on 2024/5/10.
//

import Foundation

class Solution {
    let dic: [Int: String] = [
        1: "I",
        5: "V",
        10 : "X",
        50 : "L",
        100 : "C",
        500 : "D",
        1000 : "M",
    ]
    
    func intToRoman(_ num: Int) -> String {
        var digit = String(num).count
        var result = ""
        var num = num
        while digit > 0 {
            let dightShift = Int(pow(Double(10), Double(digit - 1)))
            let processNum = num / dightShift
            let mapKeys = divide(number: processNum).map { $0 * dightShift }
            for key in mapKeys {
                result.append(dic[key] ?? "?")
            }
            num = num % dightShift
            digit -= 1
        }
        return result
    }
    
    func divide(number: Int) -> [Int] {
        if number == 4 {
            return [1, 5]
        } else if number == 9 {
            return [1, 10]
        } else if number < 5 {
            return Array(repeating: 1, count: number)
        } else if number == 5 {
            return [5]
        } else {
            return [5] + Array(repeating: 1, count: (number - 5))
        }
    }
}

let sol = Solution().intToRoman(3749)
// MCMXCIV
print(sol)
//for i in 1 ..< 10 {
//    print(Solution().divide(number: i))
//}

