//https://leetcode.com/problems/merge-k-sorted-lists/

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

//Runtime: 109 ms, faster than 52.89% of Swift online submissions for Merge k Sorted Lists.
//Memory Usage: 15.8 MB, less than 76.60% of Swift online submissions for Merge k Sorted Lists.
//Runtime: 73 ms, faster than 78.53% of Swift online submissions for Merge k Sorted Lists.
//Memory Usage: 16 MB, less than 66.30% of Swift online submissions for Merge k Sorted Lists.
//Runtime: 119 ms, faster than 39.13% of Swift online submissions for Merge k Sorted Lists.
//Memory Usage: 15.9 MB, less than 77.99% of Swift online submissions for Merge k Sorted Lists.
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

///==================== O(n log(k))  [3] ==================================
///
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

//Runtime: 81 ms, faster than 65.61% of Swift online submissions for Merge k Sorted Lists.
//Memory Usage: 15.9 MB, less than 66.93% of Swift online submissions for Merge k Sorted Lists.
//Runtime: 72 ms, faster than 80.16% of Swift online submissions for Merge k Sorted Lists.
//Memory Usage: 15.8 MB, less than 77.99% of Swift online submissions for Merge k Sorted Lists.

class Solution2 {
    // - Complexity:
    //   - time: O(n log(k)),
    //     n is the total number of nodes in two linked lists
    //     k is the number of linked lists.
    //   - space: O(k), where k is the number of linked l43q   QAists.
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else { return nil }
        let n = lists.count
        var lists = lists
        var interval = 1
        
        while interval < n {
            var i = 0
            while i + interval < n {
                lists[i] = mergeTwoLists(lists[i], lists[i + interval])
                i += interval * 2
            }
            interval *= 2
        }
        
        //    interval: 1 i:0 [0, 1] => i:2
        //    interval: 1 i:2 [2, 3] => i:4
        //    interval: 2 i:0 [0, 2] => i:4
        //    interval: 4 i:0 [0, 4] => i:8
        
        return lists[0]
    }
    
    
    private func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        var cur: ListNode? = dummy
        var l1 = l1
        var l2 = l2
        
        while l1 != nil || l2 != nil {
            if let l1Val = l1?.val, let l2Val = l2?.val {
                if l1Val < l2Val {
                    cur?.next = l1
                    l1 = l1?.next
                } else {
                    cur?.next = l2
                    l2 = l2?.next
                }
                
            } else if l1 != nil {
                cur?.next = l1
                l1 = l1?.next
            } else if l2 != nil {
                cur?.next = l2
                l2 = l2?.next
            }
            cur = cur?.next
        }
        
        return dummy.next
    }

}



///==================== HEAP [3] ==================================
///

//Runtime: 129 ms, faster than 36.41% of Swift online submissions for Merge k Sorted Lists.
//Memory Usage: 16.4 MB, less than 24.73% of Swift online submissions for Merge k Sorted Lists.

class Solution3 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
       guard !lists.isEmpty else { return nil }
        
        let mergedLists = ListNode(0)
        var current = mergedLists
        var minHeap = Heap<ListNode>{ $0.val < $1.val  }
        
        for root in lists where root != nil {
            minHeap.insert(root!)
        }
        
        while !minHeap.isEmpty {
            let topNode = minHeap.remove()!
            current.next = ListNode(topNode.val)
            current = current.next!
            
            if let next = topNode.next {
                minHeap.insert(next)
            }
        }
        
        return mergedLists.next
        
    }
}

/// Extension for HEAP

public struct Heap<T> {
    
    /** The array that stores the heap's nodes. */
    var nodes = [T]()
    
    /**
     * Determines how to compare two nodes in the heap.
     * Use '>' for a max-heap or '<' for a min-heap,
     * or provide a comparing method if the heap is made
     * of custom elements, for example tuples.
     */
    private var orderCriteria: (T, T) -> Bool
    
    /**
     * Creates an empty heap.
     * The sort function determines whether this is a min-heap or max-heap.
     * For comparable data types, > makes a max-heap, < makes a min-heap.
     */
    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    /**
     * Creates a heap from an array. The order of the array does not matter;
     * the elements are inserted into the heap in the order determined by the
     * sort function. For comparable data types, '>' makes a max-heap,
     * '<' makes a min-heap.
     */
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }
    
    /**
     * Configures the max-heap or min-heap from an array, in a bottom-up manner.
     * Performance: This runs pretty much in O(n).
     */
    private mutating func configureHeap(from array: [T]) {
        nodes = array
        for i in stride(from: (nodes.count/2-1), through: 0, by: -1) {
            shiftDown(i)
        }
    }
    
    public var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    public var count: Int {
        return nodes.count
    }
    
    /**
     * Returns the index of the parent of the element at index i.
     * The element at index 0 is the root of the tree and has no parent.
     */
    @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }
    
    /**
     * Returns the index of the left child of the element at index i.
     * Note that this index can be greater than the heap size, in which case
     * there is no left child.
     */
    @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 1
    }
    
    /**
     * Returns the index of the right child of the element at index i.
     * Note that this index can be greater than the heap size, in which case
     * there is no right child.
     */
    @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 2
    }
    
    /**
     * Returns the maximum value in the heap (for a max-heap) or the minimum
     * value (for a min-heap).
     */
    public func peek() -> T? {
        return nodes.first
    }
    
    /**
     * Adds a new value to the heap. This reorders the heap so that the max-heap
     * or min-heap property still holds. Performance: O(log n).
     */
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    /**
     * Adds a sequence of values to the heap. This reorders the heap so that
     * the max-heap or min-heap property still holds. Performance: O(log n).
     */
    public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
        for value in sequence {
            insert(value)
        }
    }
    
    /**
     * Allows you to change an element. This reorders the heap so that
     * the max-heap or min-heap property still holds.
     */
    public mutating func replace(index i: Int, value: T) {
        guard i < nodes.count else { return }
        
        remove(at: i)
        insert(value)
    }
    
    /**
     * Removes the root node from the heap. For a max-heap, this is the maximum
     * value; for a min-heap it is the minimum value. Performance: O(log n).
     */
    @discardableResult public mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            // Use the last node to replace the first one, then fix the heap by
            // shifting this new first node into its proper position.
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }
    
    /**
     * Removes an arbitrary node from the heap. Performance: O(log n).
     * Note that you need to know the node's index.
     */
    @discardableResult public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }
        
        let size = nodes.count - 1
        if index != size {
            nodes.swapAt(index, size)
            shiftDown(from: index, until: size)
            shiftUp(index)
        }
        return nodes.removeLast()
    }
    
//   public mutating func removeValue(_ value: T) -> T? {
//        var targetIndex = -1
//        for (index, node) in nodes.enumerated() {
//            if node == value {
//                targetIndex = index
//                break
//            }
//        }
//
//        if targetIndex == -1 { return nil }
//
//        return remove(at: targetIndex)
//    }
    /**
     * Takes a child node and looks at its parents; if a parent is not larger
     * (max-heap) or not smaller (min-heap) than the child, we exchange them.
     */
    internal mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(ofIndex: childIndex)
        
        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        
        nodes[childIndex] = child
    }
    
    /**
     * Looks at a parent node and makes sure it is still larger (max-heap) or
     * smaller (min-heap) than its childeren.
     */
    internal mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1
        
        // Figure out which comes first if we order them by the sort function:
        // the parent, the left child, or the right child. If the parent comes
        // first, we're done. If not, that element is out-of-place and we make
        // it "float down" the tree until the heap property is restored.
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index { return }
        
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
    
    internal mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
    
}

