//https://leetcode.com/problems/merge-two-sorted-lists/submissions/
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

//Runtime: 11 ms, faster than 78.76% of Swift online submissions for Merge Two Sorted Lists.
//Memory Usage: 14.3 MB, less than 5.74% of Swift online submissions for Merge Two Sorted Lists.

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var n1 = l1
        var n2 = l2
        var dummy: ListNode? = ListNode()
        var current = dummy
        while n1 != nil || n2 != nil {
            if let value1 = n1?.val, let value2 = n2?.val {
                if value1 > value2 {
                    current?.next = ListNode(value2)
                    current = current?.next
                    n2 = n2?.next
                } else {
                    current?.next = ListNode(value1)
                    current = current?.next
                    n1 = n1?.next
                }
            } else if let value1 = n1?.val {
                current?.next = ListNode(value1)
                current = current?.next
                n1 = n1?.next
            } else if let value2 = n2?.val {
                current?.next = ListNode(value2)
                current = current?.next
                n2 = n2?.next
            }
        }
        return dummy?.next
    }
}
