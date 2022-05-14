//https://leetcode.com/problems/validate-binary-search-tree/
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

//Runtime: 86 ms, faster than 5.03% of Swift online submissions for Validate Binary Search Tree.
//Memory Usage: 14.8 MB, less than 71.99% of Swift online submissions for Validate Binary Search Tree.
//Runtime: 72 ms, faster than 13.64% of Swift online submissions for Validate Binary Search Tree.
//Memory Usage: 14.8 MB, less than 71.99% of Swift online submissions for Validate Binary Search Tree.
//Runtime: 48 ms, faster than 49.55% of Swift online submissions for Validate Binary Search Tree.
//Memory Usage: 14.9 MB, less than 37.70% of Swift online submissions for Validate Binary Search Tree.
class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return isBst(root, min: Int.min, max: Int.max)
    }
    
    func isBst(_ root: TreeNode?, min: Int, max: Int) -> Bool {
        guard let root = root else { return true }
        if root.val <= min || root.val >= max { return false }
        return isBst(root.left, min: min, max: root.val) && isBst(root.right, min: root.val, max: max)
    }
}

//ref: https://leetcode.com/problems/validate-binary-search-tree/discuss/1112851/Swift-solution-beats-98
//Runtime: 38 ms, faster than 85.10% of Swift online submissions for Validate Binary Search Tree.
//Memory Usage: 14.9 MB, less than 54.94% of Swift online submissions for Validate Binary Search Tree.
class Solution2 {
    func validate(_ node: TreeNode?, _ min: Int, _ max: Int) -> Bool {
        let value = node?.val ?? 0
        if value <= min || value >= max {return false}
        return (node?.left != nil ? validate(node?.left, min, value) : true) &&
                (node?.right != nil ? validate(node?.right, value, max) : true)
    }
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let node = root else {return true}
        return validate(node, Int.min, Int.max)
    }
}
