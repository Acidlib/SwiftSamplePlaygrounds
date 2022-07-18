//https://leetcode.com/problems/binary-tree-preorder-traversal/

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

//Runtime: 5 ms, faster than 52.25% of Swift online submissions for Binary Tree Preorder Traversal.
//Memory Usage: 14 MB, less than 72.97% of Swift online submissions for Binary Tree Preorder Traversal.
class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        return helper(root, &result)
    }
    func helper(_ root: TreeNode?, _ result: inout [Int]) -> [Int] {
        guard let root = root else { return result }
        result.append(root.val)
        helper(root.left, &result)
        helper(root.right, &result)
        return result
    }
}

let node1 = TreeNode(1, nil, TreeNode(2, TreeNode(3), nil))
let case1 = Solution().preorderTraversal(node1)
print(case1 == [1,2,3])

let case2 = Solution().preorderTraversal(TreeNode())
print(case2 == [])

let case3 = Solution().preorderTraversal(TreeNode(1))
print(case2 == [1])
