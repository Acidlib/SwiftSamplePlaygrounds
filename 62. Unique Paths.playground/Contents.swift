//https://leetcode.com/problems/unique-paths/
//Runtime: 3 ms, faster than 60.58% of Swift online submissions for Unique Paths.
//Memory Usage: 13.5 MB, less than 84.65% of Swift online submissions for Unique Paths.
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        // C(M+N, N)
        // M and N = m-1 n-1
        let mm = max(m - 1, n - 1)
        let nn = min(m - 1, n - 1)
        
        var deno: Double = 1
        var nume: Double = 1
        for i in 0 ..< nn {
            deno *= Double(mm + nn - i)
            nume *= Double(i + 1)
        }
        return Int(deno/nume)
    }
}

//Runtime: 0 ms, faster than 100.00% of Swift online submissions for Unique Paths.
//Memory Usage: 13.3 MB, less than 98.34% of Swift online submissions for Unique Paths.
//class Solution {
//    func uniquePaths(_ m: Int, _ n: Int) -> Int {
//        // C(M+N, N)
//        // M and N = m-1 n-1
//        let mm = max(m - 1, n - 1)
//        let nn = min(m - 1, n - 1)
//
//        var result: Double = 1
//        for i in 0 ..< nn {
//            result = result*Double(mm + nn - i)/Double(i + 1)
//        }
//        return Int(result)
//    }
//}


// DP
//class Solution {
//    func uniquePaths(_ m: Int, _ n: Int) -> Int {
//
//        var matrix = Array(repeating: Array(repeating: 1, count: n), count: m)
//
//        for i in 1..<m {
//            for j in 1..<n {
//                matrix[i][j] = matrix[i][j - 1] + matrix[i - 1][j]
//            }
//        }
//        return matrix.last?.last ?? 0
//    }
//}

// ------------------------------------------------------------------------------

let solution = Solution()
var answer = solution.uniquePaths(3, 7)
print(answer == 28)

answer = solution.uniquePaths(3, 2)
print(answer == 3)

answer = solution.uniquePaths(16, 16)
print(answer == 155117520)
