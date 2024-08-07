//
//  main.swift
//  DemoCommand
//
//  Created by ElijahTan on 2024/5/10.
//

import Foundation



public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let head, let sec = head.next else {
            return head
        }
        let third = sec.next
        sec.next = head
        head.next = swapPairs(third)
        return sec
    }
}




