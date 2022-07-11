//https://leetcode.com/problems/reshape-the-matrix/
import Foundation
//Solution:510
//Runtime: 144 ms, faster than 29.73% of Swift online submissions for Reshape the Matrix.
//Memory Usage: 14 MB, less than 95.95% of Swift online submissions for Reshape the Matrix.
//Runtime: 150 ms, faster than 20.27% of Swift online submissions for Reshape the Matrix.
//Memory Usage: 14.2 MB, less than 72.97% of Swift online submissions for Reshape the Matrix.
class Solution1 {
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        let flat = mat.flatMap {$0}
        if r*c != flat.count { return mat}

        var temp = [Int]()
        var result = [[Int]]()
        for i in 0 ..< flat.count {
            temp.append(flat[i])
            if temp.count == c {
                result.append(temp)
                temp = []
            }
        }
        return result
    }
}

//ref: https://leetcode.com/problems/reshape-the-matrix/discuss/1317151/C%2B%2B-One-Loop-Easy-Solution-or-Column-first-and-Row-first-Approaches
//Runtime: 149 ms, faster than 20.94% of Swift online submissions for Reshape the Matrix.
//Memory Usage: 14.4 MB, less than 36.49% of Swift online submissions for Reshape the Matrix.
//Runtime: 164 ms, faster than 10.81% of Swift online submissions for Reshape the Matrix.
//Memory Usage: 14 MB, less than 98.65% of Swift online submissions for Reshape the Matrix.
//Time Complexity : O(r*c)
//Space Complexity : O(1), ignoring output space complexity
class Solution {
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        let m = mat.count, n = mat[0].count
        guard m*n == r*c else { return mat }
        var result = Array(repeating: Array(repeating: 0, count: c), count: r)
        for i in 0 ..< m*n {
            result[i/c][i%c] = mat[i/n][i%n]
        }
        return result
    }
}

let solution = Solution()
var result = solution.matrixReshape([[1,2],[3,4]], 2, 4)
print(result == [[1,2],[3,4]])

result = solution.matrixReshape([[1,2],[3,4]], 1, 4)
print(result == [[1,2,3,4]])

result = solution.matrixReshape([[1,2],[3,4]], 4, 1)
print(result == [[1],[2],[3],[4]])
