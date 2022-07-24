//https://leetcode.com/problems/house-robber-ii/
//Runtime: 8 ms, faster than 23.61% of Swift online submissions for House Robber II.
//Memory Usage: 14.2 MB, less than 45.14% of Swift online submissions for House Robber II.
//Runtime: 12 ms, faster than 6.94% of Swift online submissions for House Robber II.
//Memory Usage: 13.9 MB, less than 79.17% of Swift online submissions for House Robber II.
class Solution0 {
    func rob(_ nums: [Int]) -> Int {
        let length = nums.count
        if (length == 0) { return 0 }
        if (length == 1) { return nums[0] }
        if (length == 2) { return nums[0] > nums[1] ? nums[0] : nums[1] }
        // step1: remove the last element
        var dp = Array(repeating:0, count: length)
        var maxValue = 0
        dp[1] = nums[0]
        for i in 1 ..< length - 1 {
            dp[i+1] = max(dp[i], nums[i] + dp[i-1]);
        }
        maxValue = dp.last!
        // step2: remove the first element
        dp = Array(repeating:0, count: length)
        dp[1] = nums[1]
        for i in 1 ..< length - 1{
            dp[i+1] = max(dp[i], nums[i+1] + dp[i-1]);
        }
        maxValue = max(maxValue, dp.last!)
        return maxValue
    }
}

// ------------------------------------------------------------------------------

let solution = Solution()
var answer = solution.rob([2,3,2])
print(answer == 3)

answer = solution.rob([1,2,3,1])
print(answer == 4)

answer = solution.rob([1,2,3])
print(answer == 3)

answer = solution.rob([200,3,140,20,10])
print(answer == 340)

answer = solution.rob([2,1,1,2])
print(answer == 3)

answer = solution.rob([1,2,1,1])
print(answer == 3)


// 20220723
//Runtime: 3 ms, faster than 81.44% of Swift online submissions for House Robber II.
//Memory Usage: 14.2 MB, less than 38.32% of Swift online submissions for House Robber II.
class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {return nums.first!}
        // 1
        var memo = Array(repeating: 0, count: nums.count)
        var maxSum1 = 0
        for i in 1 ..< memo.count {
            memo[i] = max((i<2 ? memo[i] : memo[i-2]) + nums[i], (i<3 ? memo[i] : memo[i-3]) + nums[i])
            maxSum1 = max(memo[i], maxSum1)
        }
        //2
        memo = Array(repeating: 0, count: nums.count)
        var maxSum2 = 0
        for i in 0 ..< memo.count-1 {
            memo[i] = max((i<2 ? memo[i] : memo[i-2]) + nums[i], (i<3 ? memo[i] : memo[i-3]) + nums[i])
            maxSum2 = max(memo[i], maxSum2)
        }
        return max(maxSum1, maxSum2)
    }
}

