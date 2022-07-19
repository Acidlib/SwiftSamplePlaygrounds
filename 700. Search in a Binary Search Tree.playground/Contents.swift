//https://leetcode.com/problems/search-in-a-binary-search-tree/

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

// wrong at [4.2,7,1,3], 5
class SolutionWrong {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root?.val == val { return root }
        if let left = searchBST(root?.left, val) { return left }
        if let right = searchBST(root?.right, val) { return right}
        return nil
    }
}
//test case:
//[4,2,7,1,3]
//2

//Runtime: 212 ms, faster than 56.59% of Swift online submissions for Search in a Binary Search Tree.
//Memory Usage: 14.7 MB, less than 78.02% of Swift online submissions for Search in a Binary Search Tree.
class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }
        return val == root.val ? root : searchBST(val < root.val ? root.left : root.right, val)
    }
}

