//https://leetcode.com/problems/maximum-profit-from-trading-stocks/
import Foundation
class Solution1 {
    func maxProfit(_ present: [Int], _ future: [Int], _ budget: Int) -> Int {
        let n = present.count
        var dp = Array(repeating: Array(repeating: Int.min, count: budget + 1), count: present.count + 1)
        for have in 0 ... budget {
            dp[n][have] = 0
        }
        for i in stride(from: n - 1, through: 0, by: -1){
            for j in 0 ... budget {
                let profit = future[i] - present[i]
                let include = present[i] <= j ? profit + dp[i+1] [j - present[i]] : Int.min
                let exclude = dp[i+1][j]
                print("[\(i),\(j)] in: \(include), ex: \(exclude)")
                dp[i][j] = max(include, exclude)
            }
        }
         print(dp)
        return dp[0][budget]
    }
}

// 510: bottom up
class Solution2 {
    func maxProfit(_ present: [Int], _ future: [Int], _ budget: Int) -> Int {
        let n = present.count
        var dp = Array(repeating: Array(repeating: 0, count: budget + 1), count: present.count + 1)

        for i in 1 ... n {
            for j in 0 ... budget {
                // Note: position of value is -1
                let buy = present[i-1]
                let sell = future[i-1]
                let include = buy <= j ? (sell - buy) + dp[i-1][j - buy] : Int.min
                let exclude = dp[i-1][j]
                //print("[\(i),\(j)] in: \(include), ex: \(exclude)")
                dp[i][j] = max(include, exclude)
            }
        }
        return dp.last!.last!
    }
}
// 510: Budget M -> 0
class Solution3 {
    func maxProfit(_ present: [Int], _ future: [Int], _ budget: Int) -> Int {
        let n = present.count
        var dp = Array(repeating: Array(repeating: 0, count: budget + 1), count: present.count + 1)

        for i in 1 ... n {
            let buy = present[i-1]
            let sell = future[i-1]
            for j in stride(from: budget, through: buy, by: -1) where buy <= j {
                // print(j)
                let include = (sell - buy) + dp[i-1][j - buy]
                let exclude = dp[i-1][j]
                dp[i][j] = max(include, exclude)
            }
        }
        return dp.last!.last!
    }
}
// 510: Budget M -> 0 (1D)
class Solution4_1 {
    func maxProfit(_ present: [Int], _ future: [Int], _ budget: Int) -> Int {
        let n = present.count
        var dp = Array(repeating: 0, count: budget + 1)

        for i in 0 ..< n {
            let buy = present[i]
            let sell = future[i]
            for j in stride(from: budget, through: buy, by: -1) where buy <= j {
                let include = (sell - buy) + dp[j-buy]
                let exclude = dp[j]
                dp[j] = max(include, exclude)
            }
        }
        return dp[budget]
    }
}

// 510: Simplified Solutoin 4_1
class Solution {
    func maxProfit(_ present: [Int], _ future: [Int], _ budget: Int) -> Int {
        var dp = Array(repeating: 0, count: budget + 1)
        for i in 0 ..< present.count {
            for j in stride(from: budget, through: present[i], by: -1) where present[i] <= j {
                dp[j] = max((future[i] - present[i]) + dp[j-present[i]], dp[j])
            }
        }
        return dp.last!
    }
}

let solution = Solution()
var answer = solution.maxProfit([5,4,6,2,3], [8,5,4,3,5], 10)
print("\(answer == 6)")

answer = solution.maxProfit([2,2,5], [3,4,10], 6)
print(answer == 5)

answer = solution.maxProfit([3,3,12], [0,3,15], 10)
print(answer == 0)

answer = solution.maxProfit([0], [1], 0)
print(answer == 1)

