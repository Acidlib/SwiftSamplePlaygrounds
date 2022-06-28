//https://leetcode.com/problems/maximum-profit-from-trading-stocks/
import Foundation
class Solution {
    func maxProfit(_ present: [Int], _ future: [Int], _ budget: Int) -> Int {
        var dp = Array(repeating: Array(repeating: Int.min, count: budget + 1), count: present.count + 1)
        for have in 0 ... budget {
            dp[present.count][have] = 0
        }
        for i in stride(from: present.count-1, through: 0, by: -1){
            for j in 0 ... budget {
                let include = present[i] <= j ? (future[i] - present[i]) + dp[i+1] [j - present[i]] : Int.min
                let exclude = dp[i+1][j]
                //print("in: \(include), ex: \(exclude)")
                dp[i][j] = max(include, exclude)
            }
        }
        // print(dp)
        return dp[0][budget]
    }
}


let solution = Solution()
var answer = solution.maxProfit([5,4,6,2,3], [8,5,4,3,5], 10)
print(answer == 6)

answer = solution.maxProfit([2,2,5], [3,4,10], 6)
print(answer == 5)

answer = solution.maxProfit([3,3,12], [0,3,15], 10)
print(answer == 0)
