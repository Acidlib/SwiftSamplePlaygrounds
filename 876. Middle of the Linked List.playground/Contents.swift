//https://leetcode.com/problems/middle-of-the-linked-list/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

//510
//Runtime: 15 ms, faster than 5.35% of Swift online submissions for Middle of the Linked List.
//Memory Usage: 13.9 MB, less than 65.98% of Swift online submissions for Middle of the Linked List.
//Runtime: 6 ms, faster than 49.05% of Swift online submissions for Middle of the Linked List.
//Memory Usage: 13.9 MB, less than 65.98% of Swift online submissions for Middle of the Linked List.
//Runtime: 3 ms, faster than 79.27% of Swift online submissions for Middle of the Linked List.
//Memory Usage: 13.9 MB, less than 80.83% of Swift online submissions for Middle of the Linked List.
class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var nodes = [ListNode]()
        var node = head
        while node != nil {
            nodes.append(node!)
            node = node?.next
        }
        return nodes[nodes.count/2]
    }
}
