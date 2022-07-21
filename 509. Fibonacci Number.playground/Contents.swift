//https://leetcode.com/problems/fibonacci-number/
//Runtime: 0 ms, faster than 100.00% of Swift online submissions for Fibonacci Number.
//Memory Usage: 13.5 MB, less than 68.69% of Swift online submissions for Fibonacci Number.

class Solution {
    func fib(_ n: Int) -> Int {
        var memo = [0,1]
        if n <= 1 { return memo[n] }
        for i in 2 ... n {
            memo.append(memo[i-1] + memo[i-2])
        }
        return memo.last!
    }
}

