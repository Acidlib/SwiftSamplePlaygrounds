//https://leetcode.com/contest/weekly-contest-286/problems/minimum-deletions-to-make-array-beautiful/
class Solution {
    func minDeletion(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var window = [nums.first!]
        for i in 1 ..< nums.count {
            let val = nums[i]
            if window.count % 2 == 1 && val == window.last! {
                // do nothing
            } else {
                window.append(val)
            }
        }
        print(window)
        let windowCount = window.count % 2 == 1 ? window.count - 1 : window.count
        return nums.count - windowCount
    }
}
// ------------------------------------------------------------------------------

let solution = Solution()
var answer = solution.minDeletion([1,1,2,3,5])
print(answer == 1)
print(answer)

answer = solution.minDeletion([1,1,2,2,3,3])
print(answer == 2)
print(answer)

