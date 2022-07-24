//https://leetcode.com/problems/squares-of-a-sorted-array/

// 510: swift native:
// Runtime: 293 ms, faster than 59.11% of Swift online submissions for Squares of a Sorted Array.
//Memory Usage: 15.3 MB, less than 92.65% of Swift online submissions for Squares of a Sorted Array.
//Runtime: 217 ms, faster than 93.29% of Swift online submissions for Squares of a Sorted Array.
//Memory Usage: 15.8 MB, less than 30.19% of Swift online submissions for Squares of a Sorted Array.
class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var sorted = [Int]()
        for num in nums {
            sorted.append(num * num)
        }
        return sorted.sorted()
    }
}
