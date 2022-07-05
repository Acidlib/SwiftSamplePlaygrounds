class Solution1 {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return Int.min
        }
        var maxValue = nums[0]
        var preMax = nums[0]
        for i in 1..<nums.count {
            let value = nums[i]
            preMax = max(preMax + value, value)
            maxValue = max(maxValue, preMax)
        }
        return maxValue
    }
}


// 20220705
// Runtime: 1249 ms, faster than 23.52% of Swift online submissions for Maximum Subarray.
// Memory Usage: 18.6 MB, less than 42.39% of Swift online
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
         if nums.count == 1 { return nums.first!}
         var preMax = nums.first!
         var result = nums.first!
         for i in 1 ..< nums.count {
             preMax = max(nums[i], nums[i] + preMax)
             result = max(result, preMax)
         }
         return result
    }
}

let solution = Solution()
var answer = solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
print(answer == 6)




answer = solution.maxSubArray([1])
print(answer == 1)

answer = solution.maxSubArray([5,4,-1,7,8])
print(answer == 23)
