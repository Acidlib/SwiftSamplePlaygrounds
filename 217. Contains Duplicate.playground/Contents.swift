class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return Set(nums).count != nums.count
    }
}

let solution = Solution()
var answer = solution.containsDuplicate([7,1,5,3,6,4])
print(answer == false)

answer = solution.containsDuplicate([7,6,4,3,1])
print(answer == false)

answer = solution.containsDuplicate([1,2,3,1])
print(answer == true)

answer = solution.containsDuplicate([1,2,3,4])
print(answer == false)

answer = solution.containsDuplicate([1,1,1,3,3,4,3,2,4,2])
print(answer == true)

