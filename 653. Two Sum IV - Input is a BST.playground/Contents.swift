//https://leetcode.com/problems/two-sum-iv-input-is-a-bst/
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

// wuwu lerler
//Runtime: 237 ms, faster than 22.22% of Swift online submissions for Two Sum IV - Input is a BST.
//Memory Usage: 15.8 MB, less than 34.57% of Swift online submissions for Two Sum IV - Input is a BST.
class Solution {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var memo = [Int]()
        return createMemoArray(root, k, &memo)
    }
    
    func createMemoArray(_ root: TreeNode?, _ k: Int, _ memo: inout [Int]) -> Bool {
        guard let root = root else { return false }
        if memo.contains(root.val) { return true }
        memo.append(k - root.val)
        return createMemoArray(root.left, k, &memo) || createMemoArray(root.right, k, &memo)
    }
}
