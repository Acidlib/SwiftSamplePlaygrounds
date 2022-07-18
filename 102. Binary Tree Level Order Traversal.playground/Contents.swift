//https://leetcode.com/problems/binary-tree-level-order-traversal/
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

//ref: https://leetcode.com/problems/binary-tree-level-order-traversal/discuss/33508/Swift-solution-BFS(Queue)-DFS(recursive)
//Runtime: 16 ms, faster than 37.72% of Swift online submissions for Binary Tree Level Order Traversal.
//Memory Usage: 14.5 MB, less than 27.31% of Swift online submissions for Binary Tree Level Order Traversal.
//Time complexity N*level count
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var queue = [TreeNode]()
        var result = [[Int]]()
        queue.append(root)
        while !queue.isEmpty {
            let levelCount = queue.count
            var tempArray = [Int]()
            
            for _ in 0..<levelCount {
                let node = queue.removeFirst()
                
                // append queue to next layer
                if let left = node.left {
                    queue.append(left)
                }

                if let right = node.right {
                    queue.append(right)
                }
                tempArray.append(node.val)
            }
            result.append(tempArray)
        }
        return result
    }
}
// count 11 / input 13


// https://leetcode.com/problems/binary-tree-level-order-traversal/discuss/1926236/100-Fastest-Swift-Solution
//Runtime: 7 ms, faster than 97.05% of Swift online submissions for Binary Tree Level Order Traversal.
//Memory Usage: 14.4 MB, less than 27.31% of Swift online submissions for Binary Tree Level Order Traversal.
// >>>>> Faster, but I don't understand
//Runtime: 21 ms, faster than 12.57% of Swift online submissions for Binary Tree Level Order Traversal.
//Memory Usage: 14.3 MB, less than 45.38% of Swift online submissions for Binary Tree Level Order Traversal.
// >>>>> ohhh, not necessary faster...

//Runtime: 12 ms, faster than 78.78% of Swift online submissions for Binary Tree Level Order Traversal.
//Memory Usage: 14.3 MB, less than 40.73% of Swift online submissions for Binary Tree Level Order Traversal.
//time complexity = (N)
class Solution2 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res: [[Int]] = []
        var queue: [TreeNode?] = root != nil ? [root] : []
        var parentСount = root != nil ? 1 : 0
        var childСount = 0
        var temp: [Int] = []
        var index = 0
        
        while parentСount > 0 {
            if let node = queue[index] {
                if node.left != nil {
                    queue.append(node.left)
                    childСount += 1
                }
                
                if node.right != nil {
                    queue.append(node.right)
                    childСount += 1
                }
                
                temp.append(node.val)
                if temp.count == parentСount {
                    res.append(temp)
                    temp = []
                    parentСount = childСount
                    childСount = 0
                }
                
                index += 1
            }
        }
        
        return res
    }
    
}
