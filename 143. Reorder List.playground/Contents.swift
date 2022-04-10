//https://leetcode.com/problems/reorder-list/submissions/
//Runtime: 83 ms, faster than 56.38% of Swift online submissions for Reorder List.
//Memory Usage: 19.5 MB, less than 35.11% of Swift online submissions for Reorder List.

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reorderList(_ head: ListNode?) {
        // Step1: copy value to an array
        var array = [ListNode]()
        var current = head
        while current != nil {
            array.append(current!)
            current = current?.next
        }
        
        var start = 0
        var end = array.count - 1
        let dummy = ListNode()
        current = dummy // reuse
        // Note: start + 1 < node.count
        while start <= end, start+1 < array.count {
            
            // t???????
            let t = array[start+1]
            let s = array[start]
            let e = array[end]
            s.next = e
            
            
            // Boundary
            if s === e {
              e.next = nil
            } else {
              e.next = t
              t.next = nil
            }
                
            start += 1
            end -= 1
        }
    }
}
