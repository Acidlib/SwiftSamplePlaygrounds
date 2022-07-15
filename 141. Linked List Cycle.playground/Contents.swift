//https://leetcode.com/problems/linked-list-cycle/submissions/
//Runtime: 90 ms, faster than 21.65% of Swift online submissions for Linked List Cycle.
//Memory Usage: 15.6 MB, less than 69.69% of Swift online submissions for Linked List Cycle.
//Runtime: 87 ms, faster than 45.25% of Swift online submissions for Linked List Cycle.
//Memory Usage: 15.5 MB, less than 87.18% of Swift online submissions for Linked List Cycle.
import CoreFoundation
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        guard let head = head, let next = head.next else { return false }
        var slow: ListNode? = head
        var fast: ListNode? = next
        while slow !== fast {
            if slow == nil || fast == nil { return false }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return true
    }
}



// ------------------------------------------------------------------------------

