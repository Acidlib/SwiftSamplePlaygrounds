//https://leetcode.com/problems/remove-duplicates-from-sorted-list/

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
// 510: Runtime: 46 ms, faster than 14.29% of Swift online submissions for Remove Duplicates from Sorted List.
//Memory Usage: 14 MB, less than 82.33% of Swift online submissions for Remove Duplicates from Sorted List.
//Runtime: 38 ms, faster than 36.09% of Swift online submissions for Remove Duplicates from Sorted List.
//Memory Usage: 14.2 MB, less than 49.25% of Swift online submissions for Remove Duplicates from Sorted List.
class Solution1 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy = head
        removeNext(head)
        return dummy
    }
    
    func removeNext(_ current: ListNode?) {
        guard let current = current else { return }
        guard let next = current.next else { return }
        if current.val == next.val {
            current.next = next.next
            removeNext(current)
        } else {
            removeNext(current.next)
        }
        return
    }
}
//Runtime: 21 ms, faster than 93.61% of Swift online submissions for Remove Duplicates from Sorted List.
//Memory Usage: 13.8 MB, less than 90.60% of Swift online submissions for Remove Duplicates from Sorted List.
class Solution1_1{
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy = head
        removeNext(head)
        return dummy
    }
    
    func removeNext(_ current: ListNode?) {
        guard let current = current else { return }
        if current.val == current.next?.val {
            current.next = current.next?.next
            removeNext(current)
        } else {
            removeNext(current.next)
        }

    }
}
//Runtime: 29 ms, faster than 64.29% of Swift online submissions for Remove Duplicates from Sorted List.
//Memory Usage: 14.2 MB, less than 25.56% of Swift online submissions for Remove Duplicates from Sorted List.
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var node = head
        while let next = node?.next {
            node!.val == next.val ? (node!.next = next.next) : (node = next)
        }
        return head
    }
}


//Runtime: 40 ms, faster than 29.32% of Swift online submissions for Remove Duplicates from Sorted List.
//Memory Usage: 14.4 MB, less than 11.28% of Swift online submissions for Remove Duplicates from Sorted List.
class Solution2 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var node = head
        while let next = node?.next {
            node!.val == next.val ? (node!.next = next.next) : (node = next)
        }
        return head
    }
}
