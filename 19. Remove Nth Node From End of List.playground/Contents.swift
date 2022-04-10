//https://leetcode.com/problems/remove-nth-node-from-end-of-list/submissions/
//Runtime: 11 ms, faster than 31.31% of Swift online submissions for Remove Nth Node From End of List.
//Memory Usage: 14.3 MB, less than 15.59% of Swift online submissions for Remove Nth Node From End of List.
                                                                    
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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var current: ListNode? = head
        var array = [Int]()
        // step1: copy the value to an array
        while current != nil {
            array.append(current!.val)
            current = current?.next
        }
        // step2: remove the item
        array.remove(at: array.count - n)
        if array.count == 0 { return nil }
        
        // setp3: build the node again
        let dummy = ListNode(array.first!)
        current = dummy
        for i in 1 ..< array.count {
            current!.next = ListNode(array[i])
            current = current?.next
        }
        return dummy
    }
}


/// Solution Two:
//Runtime: 4 ms, faster than 90.62% of Swift online submissions for Remove Nth Node From End of List.
//Memory Usage: 14.1 MB, less than 48.69% of Swift online submissions for Remove Nth Node From End of List.
//https://leetcode.com/problems/remove-nth-node-from-end-of-list/discuss/1170339/Swift-DFS-Solution
class Solution2 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        if head == nil || head?.next == nil { return nil }
        
        var newList = head
        var listLength: Int = 0
        
        DFS(&newList, &listLength, n)
        
        return newList
        
    }

    private func DFS(_ node: inout ListNode?, _ length: inout Int, _ n: Int) {
        // print("[1]len:\(length); val:\(node?.val)")
        if node!.next != nil {
            DFS(&node!.next, &length, n)
        }
        // print("[2]len:\(length); val:\(node?.val)")
        
        length += 1
        
        if length == n {
            node = node!.next
        }
        
    }
}


