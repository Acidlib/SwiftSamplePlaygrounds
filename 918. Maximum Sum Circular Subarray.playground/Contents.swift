//https://leetcode.com/problems/maximum-sum-circular-subarray/

// 20220726
//510: TLE
class Solution1 {
    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        var newNums = nums
        newNums.append(contentsOf: nums[0..<nums.count-1])
        var maxSum = nums.first!        // can't use Int.min otherwise it fails at [2]
        for i in 0 ..< newNums.count-1 {
            var sum = newNums[i]
            for j in (i+1) ..< min((i + nums.count), newNums.count) {
                sum = newNums[j] > (newNums[j] + sum) ? newNums[j] : (newNums[j] + sum)
                maxSum = max(sum, maxSum)
            }
        }
        return maxSum
    }
}

//Runtime: 432 ms, faster than 100.00% of Swift online submissions for Maximum Sum Circular Subarray.
//Memory Usage: 15.1 MB, less than 52.38% of Swift online submissions for Maximum Sum Circular Subarray.
//ref: https://leetcode.com/problems/maximum-sum-circular-subarray/discuss/1173622/Swift-O(n)-solution
class Solution {
    func maxSubarraySumCircular(_ A: [Int]) -> Int {
          var maximum = -30000
          var minimum = 30000
          var sum = 0
          var partialMax = 0
          var partialMin = 0
        A.forEach { (element) in
                   partialMax = max(partialMax+element,element)
                   partialMin = min(partialMin+element,element)
                   maximum = max(maximum,partialMax)
                   minimum = min(minimum,partialMin)
                   sum += element
                  }
        if(sum == minimum) { return maximum }
        else { return max(maximum, sum-minimum) }
    }
}

let case1 = Solution().maxSubarraySumCircular([1,-2,3,-2])
print(case1 == 3)

let case2 = Solution().maxSubarraySumCircular([5,-3,5])
print(case2 == 10)

let case3 = Solution().maxSubarraySumCircular([-3,-2,-3])
print(case3 == -2)
