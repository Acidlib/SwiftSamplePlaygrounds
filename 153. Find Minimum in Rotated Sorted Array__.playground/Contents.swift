//Runtime: 11 ms, faster than 95.01% of Swift online submissions for Find Minimum in Rotated Sorted Array.
//Memory Usage: 14.2 MB, less than 55.13% of Swift online submissions for Find Minimum in Rotated Sorted Array.
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.first! }
        if nums.first! < nums.last! { return nums.first! }
        
        var lb = 0
        var ub = nums.count - 1

        while lb < ub {
            
            let mid = lb + (ub-lb)/2
            
            if (nums[lb] < nums[ub]) {
                return nums[lb]
            }
            
            if nums[mid] > nums[ub] {
                lb = mid + 1
            } else if nums[mid] <= nums[lb] {
                ub = mid
                lb = lb + 1
            }
        }
        return nums[lb]
    }
}

let solution = Solution()
var answer = solution.findMin([3,4,5,1,2])
print(answer == 1)

answer = solution.findMin([4,5,6,7,0,1,2])
print(answer == 0)

answer = solution.findMin([11,13,15,17])
print(answer == 11)


answer = solution.findMin([2, 1])
print(answer == 1)

answer = solution.findMin([2,3,1])
print(answer == 1)

answer = solution.findMin([2,3,4,5,1])
print(answer == 1)
