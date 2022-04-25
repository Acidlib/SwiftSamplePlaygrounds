//https://leetcode.com/problems/binary-tree-maximum-path-sum/
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
//Runtime: 88 ms, faster than 84.65% of Swift online submissions for Binary Tree Maximum Path Sum.
//Memory Usage: 16.2 MB, less than 42.98% of Swift online submissions for Binary Tree Maximum Path Sum.
//                                                                    Runtime: 108 ms, faster than 52.19% of Swift online submissions for Binary Tree Maximum Path Sum.
//                                                                    Memory Usage: 15.9 MB, less than 86.84% of Swift online submissions for Binary Tree Maximum Path Sum.
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

class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = Int.min
        sumNode(root, &maxSum)
        return maxSum
    }
    
    func sumNode(_ root: TreeNode?, _ maxSum: inout Int) -> Int {
        guard let root = root else { return 0 }
        // point: either leftNodeSum & righNodeSum should be > 0
        // otherwise sum is root.val
        // because adding minus numebr gives smaller sum
        let left = max(sumNode(root.left, &maxSum), 0)
        let right = max(sumNode(root.right, &maxSum), 0)
        maxSum = max(left + right + root.val, maxSum)
        return root.val + max(left, right)
    }
}

/// people's answer:
///
class Solution2 {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = Int(Int32.min)
        maxPathHelper(root, &maxSum)
        
        return maxSum
    }
    
    func maxPathHelper(_ root: TreeNode?, _ maxSum: inout Int) -> Int {
        guard let node = root else {
            return 0
        }
        
        let left = max(maxPathHelper(node.left, &maxSum), 0)
        let right = max(maxPathHelper(node.right, &maxSum), 0)
        maxSum = max(maxSum, left + right + node.val)

        return node.val + max(left, right)
    }
}
