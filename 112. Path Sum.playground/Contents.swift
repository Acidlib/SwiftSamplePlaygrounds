//https://leetcode.com/problems/path-sum/

/**
 * Definition for a binary tree node.
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

// 510 ler ler:
//Runtime: 29 ms, faster than 97.02% of Swift online submissions for Path Sum.
//Memory Usage: 14.3 MB, less than 89.79% of Swift online submissions for Path Sum.
class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        if root.left == nil && root.right == nil && root.val == targetSum {
            return true
        }
        return hasPathSum(root.left, targetSum - root.val) || hasPathSum(root.right, targetSum - root.val)
    }
}

let node = TreeNode(1, TreeNode(2), TreeNode(3))
let result1 = Solution().hasPathSum(node, 5)
print(result1)

let node1 = TreeNode(1, TreeNode(2), nil)
let result2 = Solution().hasPathSum(node1, 1)
print(result2)

let node3 = TreeNode(-2, nil, TreeNode(-3))
let result3 = Solution().hasPathSum(node3, -5)
print(result3)
