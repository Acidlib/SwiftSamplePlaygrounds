class Solution {
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

let solution = Solution()
var answer = solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
print(answer == 6)




answer = solution.maxSubArray([1])
print(answer == 1)

answer = solution.maxSubArray([5,4,-1,7,8])
print(answer == 23)
