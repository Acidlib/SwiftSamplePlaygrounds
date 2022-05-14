//https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
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

//Runtime: 29 ms, faster than 68.25% of Swift online submissions for Construct Binary Tree from Preorder and Inorder Traversal.
//Memory Usage: 14.7 MB, less than 92.42% of Swift online submissions for Construct Binary Tree from Preorder and Inorder Traversal.
//Runtime: 28 ms, faster than 72.04% of Swift online submissions for Construct Binary Tree from Preorder and Inorder Traversal.
//Memory Usage: 14.8 MB, less than 92.42% of Swift online submissions for Construct Binary Tree from Preorder and Inorder Traversal.

class Solution {
    var inorderMap = [Int:Int]()
    var preorderIndex = 0
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        for (index, item) in inorder.enumerated() {
            inorderMap[item] = index
        }
        return buildTreeNodes(preorder, left: 0, right: preorder.count - 1)
    }
    
    func buildTreeNodes(_ preoder: [Int], left: Int, right: Int) -> TreeNode? {
        guard left <= right else { return nil }
        let rootValue = preoder[preorderIndex]
        let inorderRootIndex = inorderMap[rootValue]!
        
        preorderIndex += 1
        let leftTree = buildTreeNodes(preoder, left: left, right: inorderRootIndex - 1)
        let rightTree = buildTreeNodes(preoder, left: inorderRootIndex + 1, right: right)
        return TreeNode(rootValue, leftTree, rightTree)
    }
}

let solution = Solution()
let answer = solution.buildTree([3,9,20,15,7], [9,3,15,20,7])
print(answer)
