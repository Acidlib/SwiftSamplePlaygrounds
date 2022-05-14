
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

//Runtime: 119 ms, faster than 5.29% of Swift online submissions for Kth Smallest Element in a BST.
//Memory Usage: 15 MB, less than 68.99% of Swift online submissions for Kth Smallest Element in a BST.
//Runtime: 68 ms, faster than 49.52% of Swift online submissions for Kth Smallest Element in a BST.
//Memory Usage: 15.1 MB, less than 51.44% of Swift online submissions for Kth Smallest Element in a BST.
class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var list = [Int]()
        buildList(root, &list)
        print(list)
        return list[k-1]
    }
    
    func buildList(_ root: TreeNode?, _ list: inout [Int]) {
        guard let root = root else { return }
        // Note!!!: append value after left tree
        // Then the result will be a sorted array
        buildList(root.left, &list)
        list.append(root.val)
        buildList(root.right, &list)
    }
}

// FASTER, but requires additional cerebral
//https://leetcode.com/problems/kth-smallest-element-in-a-bst/discuss/1159127/swift-60ms
//Runtime: 67 ms, faster than 54.57% of Swift online submissions for Kth Smallest Element in a BST.
//Memory Usage: 15.3 MB, less than 16.11% of Swift online submissions for Kth Smallest Element in a BST.
class Solution2 {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        // search left node, keep total count, found value
        // if found -> return it
        // if not found yet -> check if total count + 1 == k -> found = root itself
        // if total count + 1 > k -> search right node
        
        var found = -1
        nodesCount(root, &found, k)
        return found
    }
    
    func nodesCount(_ root: TreeNode?, _ found: inout Int, _ k: Int) -> Int {
        // dont need to check anymore
        if found != -1 {
            return 0
        }
        
        guard let root = root else {
            return 0
        }
        
        let leftCount = nodesCount(root.left, &found, k)
        
        // Gotcha: root is the position of kth smallest
        if leftCount+1 == k {
            found = root.val
        }
        
        // check the right side, the target "k" will be k - leftCount - 1
        let rightCount = nodesCount(root.right, &found, k-leftCount-1)
    
        return leftCount + rightCount + 1
    }
}
