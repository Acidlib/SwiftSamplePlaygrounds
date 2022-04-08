//https://leetcode.com/problems/reverse-linked-list/submissions/
//Runtime: 12 ms, faster than 84.15% of Swift online submissions for Reverse Linked List.
//Memory Usage: 15.1 MB, less than 25.52% of Swift online submissions for Reverse Linked List.
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
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return head }
        return linkReverseList(head.next, ListNode(head.val))
    }
    
    func linkReverseList(_ head: ListNode?, _ result: ListNode?) -> ListNode? {
        guard let head = head else { return result }
        let newNode: ListNode = ListNode(head.val, result)
        return linkReverseList(head.next, newNode as ListNode)
    }
}

// ------------------------------------------------------------------------------

