/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
//ref: https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/discuss/1787213/Swift-faster-than-99.6
//Runtime: 184 ms, faster than 12.90% of Swift online submissions for Lowest Common Ancestor of a Binary Search Tree.
//Memory Usage: 15.1 MB, less than 39.52% of Swift online submissions for Lowest Common Ancestor of a Binary Search Tree.
//Runtime: 118 ms, faster than 68.82% of Swift online submissions for Lowest Common Ancestor of a Binary Search Tree.
//Memory Usage: 15.2 MB, less than 20.16% of Swift online submissions for Lowest Common Ancestor of a Binary Search Tree.
class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let parent = root, let p = p, let q = q else { return nil }
        
        let parentVal = parent.val
        let pVal = p.val
        let qVal = q.val
        
        if parentVal < pVal && parentVal < qVal {
            return lowestCommonAncestor(root?.right, p, q)
        } else if parentVal > pVal && parentVal > qVal {
            return lowestCommonAncestor(root?.left, p, q)
        } else {
            return root
        }
    }
}
