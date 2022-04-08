//https://leetcode.com/problems/merge-k-sorted-lists/
//Runtime: 109 ms, faster than 52.89% of Swift online submissions for Merge k Sorted Lists.
//Memory Usage: 15.8 MB, less than 76.60% of Swift online submissions for Merge k Sorted Lists.

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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        // 0. boundary: lists == nil, or count == 1
        // 1. make partitions
        // 2. merge two partitions
        let listToSort = lists
        if lists.isEmpty { return nil }
        if lists.count == 1 { return lists[0]}
        return partition(listToSort, 0, lists.count - 1)
    }

    func partition(_ lists: [ListNode?], _ start: Int, _ end: Int) -> ListNode? {
        if start == end { return lists[start] }
        if start < end {
            let middle = (start + end) / 2
            let leftPartition = partition(lists, start, middle)
            let rightPartition = partition(lists, middle + 1, end) // !!!! midle + 1
            return mergeTwoLists(leftPartition, rightPartition)
        }
        return nil
    }

    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 = list1 else { return list2}
        guard let list2 = list2 else { return list1}

        var mergedNode: ListNode?

        if list1.val <= list2.val {
            mergedNode = list1
            mergedNode?.next = mergeTwoLists(list1.next, list2)
        } else {
            mergedNode = list2
            mergedNode?.next = mergeTwoLists(list1, list2.next)
        }
        return mergedNode

    }
}
