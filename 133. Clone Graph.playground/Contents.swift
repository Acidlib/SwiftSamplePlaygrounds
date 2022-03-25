//https://leetcode.com/problems/clone-graph/
//Runtime: 15 ms, faster than 49.02% of Swift online submissions for Clone Graph.
//Memory Usage: 14.4 MB, less than 52.95% of Swift online submissions for Clone Graph.
//Not really sure where to start
//Where to loop
public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}


class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        var result: [Int: Node?] = [:]
        return dfs(node: node, result: &result)
    }
    
    func dfs(node: Node?, result: inout [Int: Node?]) -> Node? {
        guard let node = node else { return nil }
        let new = Node(node.val)
        result[new.val] = new
        for n in node.neighbors {
            guard let newNeighbor = result[n!.val] ?? dfs(node: n, result: &result) else { break }
            // append to "new"
            new.neighbors.append(newNeighbor)
        }
        return new
    }
}


// ------------------------------------------------------------------------------

//let solution = Solution()
//var answer = solution.cloneGraph([[2,4],[1,3],[2,4],[1,3]])
//print(answer == [[2,4],[1,3],[2,4],[1,3]])
//
//answer = solution.cloneGraph([[]])
//print(answer == [[]])
//
//answer = solution.cloneGraph([])
//print(answer == [])

