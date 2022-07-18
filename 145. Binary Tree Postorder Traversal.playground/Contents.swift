//https://leetcode.com/problems/binary-tree-postorder-traversal/

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
// wuwu lerler
//Runtime: 5 ms, faster than 56.14% of Swift online submissions for Binary Tree Postorder Traversal.
//Memory Usage: 14.4 MB, less than 6.14% of Swift online submissions for Binary Tree Postorder Traversal.
class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        return helper(root, &result)
    }
    func helper(_ root: TreeNode?, _ result: inout [Int]) -> [Int] {
        guard let root = root else { return result }
        helper(root.left, &result)
        helper(root.right, &result)
        result.append(root.val)
        return result
        
    }
}

//input: [1,31,32,33, 32,null,2,3, 5, 4, null, 3, 11]
//out put: [3,5,33,4,32,31,3,11,2,32,1]
