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

class Solution {
    public func toArray(node: TreeNode?, result: inout [Int]) -> [Int] {
        guard let node = node else { return result }
        if let left = node.left?.val { result.append(left)}
        if let right = node.right?.val {result.append(right)}
        toArray(node: node.left, result: &result)
        toArray(node: node.right, result: &result)
        return result
    }

    //    [[20,15,1],[20,17,0],[50,20,1],[50,80,0],[80,19,1]]
    func createBinaryTree(_ descriptions: [[Int]]) -> TreeNode? {
        guard descriptions.count > 0 else { return TreeNode() }
        
        var node = TreeNode(descriptions.first![0])
        let dummy = node
        
        var index = 0
        
        func insertNode(_ new: TreeNode, isLeft: Bool) {
            if isLeft {
                node.left = new
            }
        }
        
        while index < descriptions.count {
            let rootValue = descriptions[index][0]
            let isLeft = descriptions[index][2] == 1
            let value = descriptions[index][1]

            if rootValue == node.val {
                insertNode(TreeNode(value), isLeft: isLeft)
            } else if rootValue == node.left?.val {
                node = node.left
                
            }
        }
        
        for item in descriptions {
            if item[0] == node.left?.val {
                node = node.left!
            } else if item[0] == node.right?.val {
                node = node.right!
            }
            if item[2] == 1 {
                
                node.left = TreeNode(item[1])
            } else {
                node.right = TreeNode(item[1])
            }
        }
        var result = [Int]()
        print(toArray(node: dummy, result: &result))
        return dummy
    }
}
let solution = Solution()
var answer = solution.createBinaryTree([[20,15,1],[20,17,0],[50,20,1],[50,80,0],[80,19,1]])
//print(answer == [50,20,80,15,17,19])

answer = solution.createBinaryTree([[1,2,1],[2,3,0],[3,4,1]])

