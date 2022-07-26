//https://leetcode.com/problems/maximum-length-of-subarray-with-positive-product/

// ref: https://leetcode.com/problems/maximum-length-of-subarray-with-positive-product/discuss/819581/Swift-O(n)-time-O(1)-space
//Runtime: 962 ms, faster than 60.42% of Swift online submissions for Maximum Length of Subarray With Positive Product.
//Memory Usage: 19.1 MB, less than 41.67% of Swift online submissions for Maximum Length of Subarray With Positive Product.
//Runtime: 1298 ms, faster than 31.25% of Swift online submissions for Maximum Length of Subarray With Positive Product.
//Memory Usage: 19 MB, less than 56.25% of Swift online submissions for Maximum
class Solution {
    func getMaxLen(_ nums: [Int]) -> Int {
        // the initial value is not intuitive. but essential to get the COUNT right. can't be 0 for the [-1]'s sake.
        var negativeFirstIndex = -1
        var negativeCount = 0
        // the initial value is not intuitive. but essential to get the COUNT right. can't be 0 for the [-1]'s sake.
        var firstIndex = -1
        var globalMax = 0
        for (index, num) in nums.enumerated() {
            if num == 0 {
                negativeFirstIndex = -1
                firstIndex = index
                negativeCount = 0
            } else if num < 0 {
                negativeCount += 1
                if negativeFirstIndex == -1 {
                    negativeFirstIndex = index
                }
            }
            globalMax = max(globalMax, (negativeCount % 2 == 0) ? index - firstIndex : index - negativeFirstIndex)
        }
        
        return globalMax
    }
}

let case1 = Solution().getMaxLen([1,-2,-3,4])
print(case1 == 4)

let case2 = Solution().getMaxLen([0,1,-2,-3,-4])
print(case2 == 3)

let case3 = Solution().getMaxLen([-1,-2,-3,0,1])
print(case3 == 2)

let case4 = Solution().getMaxLen([-1])
print(case4 == 0)
