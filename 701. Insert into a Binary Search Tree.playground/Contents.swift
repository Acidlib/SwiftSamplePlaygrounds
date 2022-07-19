//https://leetcode.com/problems/insert-into-a-binary-search-tree/

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
// wuwu: 2022
//Runtime: 359 ms, faster than 10.42% of Swift online submissions for Insert into a Binary Search Tree.
//Memory Usage: 14.8 MB, less than 100.00% of Swift online submissions for Insert into a Binary Search Tree.
//Runtime: 317 ms, faster than 29.17% of Swift online submissions for Insert into a Binary Search Tree.
//Memory Usage: 15.3 MB, less than 46.88% of Swift online submissions for Insert into a Binary Search Tree.
class Solution1 {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let node = root else { return TreeNode(val) }
        dfs(node, val)
        return node
    }
    func dfs(_ root: TreeNode?, _ val:Int) -> TreeNode? {
        guard let root = root else { return nil }
        if root.val > val {
            if root.left == nil {
                root.left = TreeNode(val)
                return root
            } else {
                return dfs(root.left, val)
            }
        } else {
            if root.right == nil {
                root.right = TreeNode(val)
                return root
            } else {
                return dfs(root.right, val)
            }
        }
    }
}

// modification from answer of 2021
// it used to be 216 ms
// now Runtime: 310 ms, faster than 31.25% of Swift online submissions for Insert into a Binary Search Tree.
// Memory Usage: 15.4 MB, less than 46.88% of Swift online submissions for Insert into a Binary Search Tree.
class Solution {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return TreeNode(val) }
        if root.val < val {
            root.right = insertIntoBST(root.right, val)
            return root
        } else {
            root.left = insertIntoBST(root.left, val)
            return root
        }
    }
}

