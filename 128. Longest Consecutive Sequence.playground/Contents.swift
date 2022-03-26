//128. Longest Consecutive Sequence
//Runtime: 205 ms, faster than 82.04% of Swift online submissions for Longest Consecutive Sequence.
//Memory Usage: 17.7 MB, less than 62.86% of Swift online submissions for Longest Consecutive Sequence.
class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        let sortedNums = nums.sorted()
        var count = 1
        var maxCount = 1
        for i in 1 ..< sortedNums.count {
            if sortedNums[i] == sortedNums[i-1] + 1 {
                count += 1
                maxCount = max(maxCount, count)
            } else if sortedNums[i] == sortedNums[i-1]  {
                // do nothing
            } else {
                count = 1
            }
        }
        return maxCount
    }
}

// ------------------------------------------------------------------------------

let solution = Solution()
var answer = solution.longestConsecutive([100,4,200,1,3,2])
print(answer == 4)

answer = solution.longestConsecutive([0,3,7,2,5,8,4,6,0,1])
print(answer == 9)

answer = solution.longestConsecutive([0])
print(answer == 1)

answer = solution.longestConsecutive([1,2,0,1])
print(answer = 3)
