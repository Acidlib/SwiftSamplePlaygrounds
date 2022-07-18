//https://leetcode.com/problems/binary-tree-inorder-traversal/

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
//510 ler ler
//Runtime: 4 ms, faster than 66.53% of Swift online submissions for Binary Tree Inorder Traversal.
//Memory Usage: 14.3 MB, less than 5.24% of Swift online submissions for Binary Tree Inorder Traversal.
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        return helper(root, &result)
    }
    func helper(_ root: TreeNode?, _ result: inout [Int]) -> [Int] {
        guard let root = root else { return result }
        helper(root.left, &result)
        result.append(root.val)
        helper(root.right, &result)
        return result
        
    }
}


//input: [1,31,32,33, 32,null,2,3, 5, 4, null, 3, 11]
//out put: [3,33,5,31,4,32,1,32,3,2,11]
