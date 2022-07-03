//https://leetcode.com/problems/erect-the-fence/
//Runtime: 260 ms, faster than 50.00% of Swift online submissions for Erect the Fence.
//Memory Usage: 14.5 MB, less than 100.00% of Swift online submissions for Erect the Fence.
//Runtime: 158 ms, faster than 100.00% of Swift online submissions for Erect the Fence.
//Memory Usage: 14.8 MB, less than 100.00% of Swift online submissions for Erect the Fence.

class Solution {
    func cmp(_ p1: [Int], _ p2: [Int],_ p3: [Int]) -> Int {
        return (p3[1]-p2[1]) * (p2[0] - p1[0]) - (p2[1] - p1[1]) * (p3[0]-p2[0])
    }
    
    func outerTrees(_ trees: [[Int]]) -> [[Int]] {
        let points = trees.sorted{$0[0] != $1[0] ? $0[0] < $1[0]  : $0[1] < $1[1]}
        var upper = [[Int]]()
        var lower = [[Int]]()
        for point in points {
            while lower.count >= 2 && cmp(lower[lower.count - 2], lower[lower.count - 1], point) > 0 {
                lower.popLast()
            }
            
            while upper.count >= 2 && cmp(upper[upper.count - 2], upper[upper.count - 1], point) < 0 {
                upper.popLast()
            }
            
            lower.append(point)
            upper.append(point)
        }

        return Array(Set(lower + upper))
    }
}


let solution = Solution()
var result = solution.outerTrees([[1,1],[2,2],[2,0],[2,4],[3,3],[4,2]])
//print(result.contain)
//print(result.contains(
//    [[2,4],[1,1],[2,0],[4,2],[3,3]]))
//print(result)
