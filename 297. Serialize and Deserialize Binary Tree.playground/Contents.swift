/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

//ref: https://leetcode.com/problems/serialize-and-deserialize-binary-tree/discuss/797737/Swift
//Runtime: 52 ms, faster than 94.44% of Swift online submissions for Serialize and Deserialize Binary Tree.
//Memory Usage: 16.2 MB, less than 78.70% of Swift online submissions for Serialize and Deserialize Binary Tree.

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var nodes = [String]()

        func helper(_ node: TreeNode?) {
            guard let node = node else {
                nodes.append("nil")
                return
            }

            nodes.append(String(node.val))
            helper(node.left)
            helper(node.right)
        }

        helper(root)
        return nodes.joined(separator: ",")
    }

    func deserialize(_ data: String) -> TreeNode? {
        let nodes = data.split(separator: ",").map { Int(String($0)) }
        var idx = 0

        func helper() -> TreeNode? {
            guard let val = nodes[idx] else {
                // important! to go further
                idx += 1
                return nil
            }

            idx += 1
            let node = TreeNode(val)
            node.left = helper()
            node.right = helper()
            return node
        }

        return helper()
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))
