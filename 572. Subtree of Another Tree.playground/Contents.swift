//https://leetcode.com/problems/subtree-of-another-tree/submissions/
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

//Runtime: 112 ms, faster than 61.61% of Swift online submissions for Subtree of Another Tree.
//Memory Usage: 14.4 MB, less than 43.13% of Swift online submissions for Subtree of Another Tree.
class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard let root = root, let subRoot = subRoot else { return false }
        if root.val == subRoot.val {
            if isSameTree(root, subRoot) {
                return true
            }
        }
        return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot)
    }
    
    func isSameTree(_ s: TreeNode?, _ c: TreeNode?) -> Bool {
        if s == nil && c == nil { return true }
        guard let s = s, let c = c else { return false }

        if s.val != c.val { return false }
        return isSameTree(s.left, c.left) && isSameTree(s.right, c.right)
    }
}

// not faster, but simpler
//Time: O(mn), Space: O(n) where m is the number of nodes in t, n is the number of nodes in s
//Runtime: 176 ms, faster than 16.11% of Swift online submissions for Subtree of Another Tree.
//Memory Usage: 13.9 MB, less than 99.53% of Swift online submissions for Subtree of Another Tree.
class Solution2 {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard let root = root else { return false }
        if isSame(root, subRoot) { return true }
        return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot)
    }
    
    func isSame(_ s: TreeNode?, _ c: TreeNode?) -> Bool {
        if s == nil && c == nil { return true }
        guard let s = s, let c = c else { return false }
    
        return s.val == c.val && isSame(s.left, c.left) && isSame(s.right, c.right)
    }
}

// alternative way: using stack to organize layers
//Runtime: 107 ms, faster than 72.51% of Swift online submissions for Subtree of Another Tree.
//Memory Usage: 14.3 MB, less than 62.56% of Swift online submissions for Subtree of Another Tree.
class Solution3 {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard let root = root, let subRoot = subRoot else {
            return false
        }
        var stack: [TreeNode] = [root]
        while !stack.isEmpty {
            let node = stack.popLast()!
            if isSameTree(node, subRoot) {
                return true
            }
            if let left = node.left {
                stack.append(left)
            }
            if let right = node.right {
                stack.append(right)
            }
        }
        return false
    }
    
    func isSameTree(_ first: TreeNode?, _ second: TreeNode?) -> Bool {
        if first == nil && second == nil {
            return true
        }
        guard let first = first, let second = second,
              first.val == second.val else {
                  return false
              }
        return isSameTree(first.left, second.left) && isSameTree(first.right, second.right)
    }
}
