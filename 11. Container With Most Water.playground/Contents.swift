//Runtime: 648 ms - 1000 ms, faster than 17-77.78% of Swift online submissions for Container With Most Water.
//Memory Usage: 18.5 MB, less than 6.01% of Swift online submissions for Container With Most Water.
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        for i in 0 ..< height.count {
            let left = i
            var right = height.count - 1
            while left < right {
                let sum = (right - left) * min(height[right], height[left])
                let maxSum = (right - left) * height[i]
                maxArea = max(sum, maxArea)
                // Important!
                // When the value reach to the max possible area, break and move i
                if sum == maxSum {
                    break
                }
                right -= 1
            }
        }
        return maxArea
    }
}

let solution = Solution()
var answer = solution.maxArea([1,8,6,2,5,4,8,3,7])
print(answer == 49)

answer = solution.maxArea([1,1])
print(answer == 1)

answer = solution.maxArea([1,1000,1000,6,2,5,4,8,3,7])
print(answer == 1000)

/// TLE (N^2)
//class Solution {
//    func maxArea(_ height: [Int]) -> Int {
//        var maxArea = 0
//        for i in 0 ..< height.count {
//            let left = i
//            var right = height.count - 1
//            while left < right {
//                let sum = (right - left) * min(height[right], height[left])
//                if sum > maxArea {
//                    maxArea = sum
//                }
//                right -= 1
//            }
//        }
//        return maxArea
//    }
//}
