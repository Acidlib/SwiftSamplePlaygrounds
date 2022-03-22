//https://leetcode.com/problems/longest-common-subsequence/
// 05/03/2021 20:22
// Runtime: 21 ms, faster than 60.28% of Swift online submissions for Longest Common Subsequence.
// Memory Usage: 22 MB, less than 56.03% of Swift online submissions for Longest Common Subsequence.
//class Solution {
//    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
//        let array1 = Array(text1)
//        let array2 = Array(text2)
//        let m = text1.count
//        let n = text2.count
//        //print(m, n)
//        var map = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
//        for i in 0 ..< m {
//            for j in 0 ..< n {
//                if array1[i] == array2[j] {
//                    map[i+1][j+1] = 1 + map[i][j]
//                } else {
//                    map[i+1][j+1] = max(map[i][j+1], map[i+1][j])
//                }
//            }
//        }
//        return map[m][n]
//    }
//}

//class Solution {
//    func longestCommonSubsequence(_ x: String, _ y: String) -> Int {
//        let m = x.count, n = y.count, a = [Character](x), b = [Character](y)
//        var t = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
//        for i in 1...m {
//            for j in 1...n {
//                if a[i-1] == b[j-1] {
//                    t[i][j] = 1 + t[i-1][j-1]
//                } else {
//                    t[i][j] = max(t[i][j-1], t[i-1][j])
//                }
//            }
//        }
//        return t[m][n]
//    }
//}

//Runtime: 10 ms, faster than 95.04% of Swift online submissions for Longest Common Subsequence.
//Memory Usage: 21.8 MB, less than 78.01% of Swift online submissions for Longest Common Subsequence.
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let serialX = text1.count > text2.count ? [Character](text2) : [Character](text1)
        let serialY = text1.count > text2.count ? [Character](text1) : [Character](text2)
        // dp array chooses the longest length of text
        var dpArray =  Array(repeating: Array(repeating: 0, count: serialY.count+1), count: serialX.count+1)
        for i in 1...serialX.count {
            for j in 1...serialY.count {
                if serialX[i-1] == serialY[j-1] {
                    dpArray[i][j] = dpArray[i-1][j-1] + 1
                } else {
                    dpArray[i][j] = max(dpArray[i][j-1], dpArray[i-1][j])
                }
            }
        }
        return dpArray[serialX.count][serialY.count]
    }
}

// ------------------------------------------------------------------------------

let solution = Solution()
var answer = solution.longestCommonSubsequence("abcde", "ace")
print(answer == 3)

answer = solution.longestCommonSubsequence("abc", "abc")
print(answer == 3)

answer = solution.longestCommonSubsequence("abc", "def")
print(answer == 0)

answer = solution.longestCommonSubsequence("ezupkr", "ubmrapg")
print(answer == 2)
