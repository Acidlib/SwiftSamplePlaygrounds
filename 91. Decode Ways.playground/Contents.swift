//https://leetcode.com/problems/decode-ways/
//Runtime: 0 ms, faster than 100.00% of Swift online submissions for Decode Ways.
//Memory Usage: 14.1 MB, less than 84.77% of Swift online submissions for Decode Ways.
class Solution {
    func numDecodings(_ s: String) -> Int {
        // letter map: 1 - 26
        let sArray = Array(s)
        let nums = sArray.map{Int(String($0))!}
        guard nums.count > 0 else { return 0 }
        guard nums.first! > 0 else { return 0 }
    
        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = 1
        for i in 1 ..< nums.count {            
            let twoNum = nums[i-1] * 10 + nums[i]
            dp[i] = dp[i-1]
            // e.g 30 40 50
            // e.g 00
            if (nums[i] == 0 && twoNum > 26) || twoNum == 0{
                return 0
            }
            // do nothing
            if nums[i] == 0 {
                
            }
            // [x1, x2, x3]
            // [x1x2, x3]
            else if nums[i] != 0 && nums[i-1] != 0 && twoNum <= 26 {
                //[x1 x2 0]
                if i < (nums.count - 1) && nums[i+1] == 0 {
                    // do nothing
                } else {
                    dp[i] = i > 1 ? dp[i-1] + dp[i-2] : dp[i] + 1
                }
            }
        }
        return dp.last!
    }
}

// ------------------------------------------------------------------------------

let solution = Solution()
var answer = solution.numDecodings("12")
print(answer == 2)

answer = solution.numDecodings("226")
print(answer == 3)

answer = solution.numDecodings("06")
print(answer == 0)

answer = solution.numDecodings("10")
print(answer == 1)

answer = solution.numDecodings("2101")
print(answer == 1)

answer = solution.numDecodings("12")
print(answer == 2)

answer = solution.numDecodings("2101")
print(answer == 1)

answer = solution.numDecodings("10")
print(answer == 1)

answer = solution.numDecodings("1123")
print(answer == 5)

answer = solution.numDecodings("10011")
print(answer == 0)
