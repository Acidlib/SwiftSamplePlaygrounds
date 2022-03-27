//https://leetcode.com/contest/weekly-contest-286/problems/find-the-difference-of-two-arrays/
class Solution {
    func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
        guard nums2.count > 0 else { return [nums1, []] }
        guard nums1.count > 0 else { return [[], nums2] }
        
        var nums1Copy = nums1
        var nums2Copy = nums2
        
        for num1 in nums1 {
            nums2Copy = nums2Copy.filter({$0 != num1})
        }
        
        for num2 in nums2 {
            nums1Copy = nums1Copy.filter({$0 != num2})
        }
        
        return [Array(Set(nums1Copy)), Array(Set(nums2Copy))]
    }
}

// ------------------------------------------------------------------------------

let solution = Solution()
var answer = solution.findDifference([1,2,3], [2,4,6])
print(answer == [[1,3],[4,6]])
print(answer)

answer = solution.findDifference([1,2,3,3], [1,1,2,2])
print(answer == [[3],[]])
print(answer)

