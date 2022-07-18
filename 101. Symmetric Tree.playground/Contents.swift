//https://leetcode.com/problems/symmetric-tree/

import Darwin

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
// 510 lerler
//Runtime: 14 ms, faster than 64.53% of Swift online submissions for Symmetric Tree.
//Memory Usage: 14.2 MB, less than 28.08% of Swift online submissions for Symmetric Tree.
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        let left = root.left, right = root.right
        return isMirror(left, right)
    }
    
    func isMirror(_ left: TreeNode?,_ right: TreeNode?) -> Bool {
        if left == nil && right == nil { return true }
        if left?.val != right?.val { return false }
        return isMirror(left?.left, right?.right) && isMirror(left?.right, right?.left)
    }
}


//input: [1,2,2,null,3,3, null]
//output: true
