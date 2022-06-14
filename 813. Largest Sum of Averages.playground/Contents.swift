//https://leetcode.com/problems/largest-sum-of-averages/
// ref: https://leetcode.com/problems/largest-sum-of-averages/discuss/561245/top-down-and-bottom-up-with-detail-explanation
// ref: https://leetcode.com/problems/largest-sum-of-averages/discuss/127181/C%2B%2B-4-lines-6-ms-DFS-%2B-memo
//Runtime: 18 ms, faster than 50.00% of Swift online submissions for Largest Sum of Averages.
//Memory Usage: 14.1 MB, less than 50.00% of Swift online submissions for Largest Sum of Averages.
class Solution {
    func largestSumOfAverages(_ nums: [Int], _ k: Int) -> Double {
        var memo = [[Double]](repeating: [Double](repeating: 0, count: k+1), count: nums.count+1)
        return topDown(0, nums: nums, k: k, memo: &memo)
    }
    
    func topDown(_ start: Int, nums: [Int], k: Int, memo: inout [[Double]]) -> Double {
        if start >= nums.count || memo[start][k] > 0 { return memo[start][k] }
        var sum = 0
        for i in start ... nums.count - k {
            sum += nums[i]
            if (k == 1 && i < nums.count - 1) { continue }
            memo[start][k] = max(memo[start][k], Double(sum) / Double((i - start + 1)) + topDown(i+1, nums: nums, k: k-1, memo: &memo))
        }
        return memo[start][k]
    }
}

let solution = Solution()
var answer = solution.largestSumOfAverages([9,1,2,3,9], 3)
print(answer == 20.0)

answer = solution.largestSumOfAverages([1,2,3,4,5,6,7], 4)
print(answer == 20.5)

answer = solution.largestSumOfAverages([4,1,7,5,6,2,3], 4)
print(answer == 18.166666666666664)





