//https://leetcode.com/problems/remove-linked-list-elements/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

//Runtime: 70 ms, faster than 55.23% of Swift online submissions for Remove Linked List Elements.
//Memory Usage: 15.5 MB, less than 98.33% of Swift online submissions for Remove Linked List Elements.
class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head?.val == val {
            let newHead = removeElements(head?.next, val)
            return newHead
        } else {
            head?.next = removeElements(head?.next, val)
            return head
        }
    }
}

