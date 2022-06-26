//https://leetcode.com/problems/distinct-subsequences/

//Runtime: 96 ms, faster than 80.00% of Swift online submissions for Distinct Subsequences.
//Memory Usage: 22 MB, less than 80.00% of Swift online submissions for Distinct Subsequences.
//ref: https://leetcode.com/problems/distinct-subsequences/discuss/1932086/100-Fastest-Swift-Solution
class Solution {
    func numDistinct(_ s: String, _ t: String) -> Int {
        let s = Array(s), t = Array(t)
        var memo = Array(repeating: Array(repeating: -1, count: t.count), count: s.count)
        
        func numDistinct(_ i: Int, _ j: Int) -> Int {
            if j < 0 { return 1 }
            if i < 0 { return 0 }
            
            if memo[i][j] != -1 { return memo[i][j] }
            
            if s[i] != t[j] {
                memo[i][j] = numDistinct(i - 1, j)
            } else {
                memo[i][j] = numDistinct(i - 1, j) + numDistinct(i - 1, j - 1)
            }
            
            return memo[i][j]
        }
        
        return numDistinct(s.count - 1, t.count - 1)
    }
}

/*
 // 510:
 // the iteration doesn't work as I expected
class Solution {
    func numDistinct(_ s: String, _ t: String) -> Int {
        var result = 0
        return iterateSubstring([Character](s), [Character](t), &result)
    }
    
    func iterateSubstring(_ input: [Character], _ target: [Character], _ result: inout Int) -> Int {
        let first = target.first
        for i in 0 ..< input.count {
            print("\(i). input: \(input) target: \(target), result:\(result)")
            if input[i] == first {
                if target.count == 1 {
                    result = result + 1
                    print("result = \(result)")
                }
                else {
                    return iterateSubstring(Array(input[1..<input.count]), Array(target[1..<target.count]), &result)
                }
            }
            return iterateSubstring(Array(input[1..<input.count]), target, &result)
        }
        return result
    }
}

//0. input: ["b", "b", "b", "i", "t"] target: ["b", "b", "i", "t"], result:0
//0. input: ["b", "b", "i", "t"] target: ["b", "i", "t"], result:0
//0. input: ["b", "i", "t"] target: ["i", "t"], result:0
//1. input: ["b", "i", "t"] target: ["i", "t"], result:0
//0. input: ["i", "t"] target: ["t"], result:0
//1. input: ["i", "t"] target: ["t"], result:0
//result = 1
//result: false, 1
*/

let solution = Solution()
var result = solution.numDistinct("rabbbit", "rabbit")
print("result: \(result == 3), \(result)")
