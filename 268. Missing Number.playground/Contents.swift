//Runtime: 120 ms, faster than 80.35% of Swift online submissions for Missing Number.
//Memory Usage: 14.3 MB, less than 73.80% of Swift online submissions for Missing Number.
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let sum = nums.reduce(0, +)
        let all = nums.count * (nums.count + 1) / 2
        return all - sum
    }
}


let solution = Solution()
var answer = solution.missingNumber([3,0,1])
print(answer == 2)

answer = solution.missingNumber([0,1])
print(answer == 2)

answer = solution.missingNumber([9,6,4,2,3,5,7,0,1])
print(answer == 8)

