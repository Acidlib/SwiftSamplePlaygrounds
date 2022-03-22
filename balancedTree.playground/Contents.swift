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

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        let result = helper(root)
        return result.1
    }
    // return (1) max leftCount / rightCount (2)
    func helper(_ node: TreeNode?) -> (Int, Bool) {
        guard let node = node else { return (0, true) }
        let l = helper(node.left)
        let r = helper(node.right)
        return (1 + max(l.0, r.0), l.1 && r.1 && abs(l.0 - r.0) <= 1)
    }
}



