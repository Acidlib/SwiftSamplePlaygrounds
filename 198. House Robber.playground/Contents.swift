//https://leetcode.com/problems/house-robber/
//Runtime: 4 ms, faster than 71.95% of Swift online submissions for House Robber.
//Memory Usage: 14.1 MB, less than 41.38% of Swift online submissions for House Robber.
class Solution0 {
    func rob(_ nums: [Int]) -> Int {
        print("nums: \(nums)")
        let length = nums.count
        if (length == 0) { return 0 }
        if (length == 1) { return nums[0] }
        if (length == 2) { return nums[0] > nums[1] ? nums[0] : nums[1] }
        var dp = Array(repeating:0, count: length + 1)
        dp[1] = nums[0]
        // nums: [1,2,3,1]
        // dp:   [0, 1, 2, 4, 4]
        //       i-1 i i+1
        for i in 1 ..< length {
            dp[i+1] = max(dp[i], nums[i] + dp[i-1]);
        }
        return dp.last!
    }
}
// ------------------------------------------------------------------------------

let solution = Solution()
var answer = solution.rob([1,2,3,1])

print(answer == 4)

answer = solution.rob([2,7,9,3,1])
print(answer == 12)


// ------------------------------------------------------------------------------
// 20220723
// 510 ler ler
//Runtime: 2 ms, faster than 84.73% of Swift online submissions for House Robber.
//Memory Usage: 14.2 MB, less than 34.24% of Swift online submissions for House Robber.
class Solution {
    func rob(_ nums: [Int]) -> Int {
        var memo = Array(repeating: 0, count: nums.count)
        var maxSum = 0
        for i in 0 ..< memo.count {
            memo[i] = max((i<2 ? memo[i] : memo[i-2]) + nums[i], (i<3 ? memo[i] : memo[i-3]) + nums[i])
            maxSum = max(memo[i], maxSum)
        }
        return maxSum
    }
}
