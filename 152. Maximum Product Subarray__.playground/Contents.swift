import Foundation
class Solution1 {
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.first!}
        
        var localMin = nums.first!
        var localMax = nums.first!
        var globalMax = nums.first!
        
        for i in 1 ..< nums.count {
            let temp = max(nums[i], nums[i] * localMax, nums[i] * localMin)
            localMin = min(nums[i], nums[i] * localMax, nums[i] * localMin)
            localMax = temp
            globalMax = max(localMax, globalMax)
        }
        return globalMax
    }
}

let solution = Solution()
var answer = solution.maxProduct([2,3,-2,4])
print(answer == 6)

answer = solution.maxProduct([-2,0,-1])
print(answer == 0)

answer = solution.maxProduct([2,3,-2,4,3])
print(answer == 12)

answer = solution.maxProduct([-2,0,1])
print(answer == 1)

answer = solution.maxProduct([-2])
print(answer == -2)

answer = solution.maxProduct([0, 2])
print(answer == 2)

answer = solution.maxProduct([-2,3,-4])
print(answer == 24)

answer = solution.maxProduct([2,-5,-2,-4,3])
print(answer == 24)

// 20220726
// peek again
//Runtime: 42 ms, faster than 51.37% of Swift online submissions for Maximum Product Subarray.
//Memory Usage: 15 MB, less than 8.24% of Swift online submissions for Maximum Product Subarray.
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var localMin = nums.first!
        var localMax = nums.first!
        var gloableMax = nums.first!
        for i in 1 ..< nums.count {
            // temp: this is important, not to rewrite the localMin or localMax at this point of time.
            let temp = max(nums[i], localMin*nums[i], localMax*nums[i])
            localMin = min(nums[i], localMin*nums[i], localMax*nums[i])
            localMax = temp
            gloableMax = max(gloableMax, localMax)
        }
        return gloableMax
    }
}

