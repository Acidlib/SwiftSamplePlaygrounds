//https://leetcode.com/problems/maximum-depth-of-binary-tree/
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

//Runtime: 22 ms, faster than 88.70% of Swift online submissions for Maximum Depth of Binary Tree.
//Memory Usage: 14.7 MB, less than 51.15% of Swift online submissions for Maximum Depth of Binary Tree.
class Solution1 {
    func maxDepth(_ root: TreeNode?) -> Int {
        return getDepth(root, 0)
    }
    
    func getDepth(_ root: TreeNode?, _ depth: Int) -> Int {
        guard let node = root else { return depth }
        return max(getDepth(node.left, depth + 1), getDepth(node.right, depth + 1))
    }
}

//Runtime: 25 ms, faster than 73.88% of Swift online submissions for Maximum Depth of Binary Tree.
//Memory Usage: 14.5 MB, less than 66.95% of Swift online submissions for Maximum Depth of Binary Tree.
//Runtime: 42 ms, faster than 18.10% of Swift online submissions for Maximum Depth of Binary Tree.
//Memory Usage: 14.5 MB, less than 82.02% of Swift online submissions for Maximum Depth of Binary Tree.
class Solution2 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
}
