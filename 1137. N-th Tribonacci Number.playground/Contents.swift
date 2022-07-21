//https://leetcode.com/problems/n-th-tribonacci-number/submissions/

//Runtime: 8 ms, faster than 7.86% of Swift online submissions for N-th Tribonacci Number.
//Memory Usage: 13.3 MB, less than 97.86% of Swift online submissions for N-th Tribonacci Number.
class Solution {
    func tribonacci(_ n: Int) -> Int {
        var memo = [0,1,1]
        if n <= 2 { return memo[n] }
        
        
        // Runtime: 5 ms, faster than 35.00% of Swift online submissions for N-th Tribonacci Number.
        // Memory Usage: 13.6 MB, less than 60.71% of Swift online submissions for N-th Tribonacci Number.
        // Runtime: 0 ms, faster than 100.00% of Swift online submissions for N-th Tribonacci Number.
        // Memory Usage: 13.7 MB, less than 60.71% of Swift online submissions for N-th Tribonacci Number.
        if n > 37 { return -1 }
        
        for i in 3 ... n {
            memo.append(memo[i-1] + memo[i-2] + memo[i-3])
        }
        return memo.last!
    }
}

