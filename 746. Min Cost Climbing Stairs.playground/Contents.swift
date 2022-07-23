//https://leetcode.com/problems/min-cost-climbing-stairs/
// 510:
//Runtime: 53 ms, faster than 9.04% of Swift online submissions for Min Cost Climbing Stairs.
//Memory Usage: 14.2 MB, less than 46.25% of Swift online submissions for Min Cost Climbing Stairs.
//Runtime: 42 ms, faster than 30.23% of Swift online submissions for Min Cost Climbing Stairs.
//Memory Usage: 13.9 MB, less than 81.65% of Swift online submissions for Min Cost Climbing Stairs.
// using condifions
class Solution0 {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var memo = Array(repeating: 0, count: cost.count + 1)
        for i in 0 ... cost.count {
            memo[i] = min(i<1 ? 0 : (memo[i-1]+cost[i-1]), i<2 ? 0 : (memo[i-2]+cost[i-2]))
        }
        return memo.last!
    }
}
//Runtime: 28 ms, faster than 76.23% of Swift online submissions for Min Cost Climbing Stairs.
//Memory Usage: 14.2 MB, less than 46.25% of Swift online submissions for Min Cost Climbing Stairs.
// less conditions
// but complex array size:
class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var memo = Array(repeating: 0, count: cost.count + 3)
        var newCost = [0, 0]
        newCost.append(contentsOf: cost)
        for i in 2 ..< memo.count {
            memo[i] = min(memo[i-1]+newCost[i-1], memo[i-2]+newCost[i-2])
        }
        return memo.last!
    }
}

let case1 = Solution().minCostClimbingStairs([10,15,20])
print(case1 == 15)
print(case1)

let case2 = Solution().minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1])
print(case2 == 6)
print(case2)
