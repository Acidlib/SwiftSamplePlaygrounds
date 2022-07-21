//https://leetcode.com/problems/search-insert-position/
//Runtime: 40 ms, faster than 37.36% of Swift online submissions for Search Insert Position.
//Memory Usage: 14.1 MB, less than 85.85% of Swift online submissions for Search Insert Position.
//Runtime: 23 ms, faster than 95.32% of Swift online submissions for Search Insert Position.
//Memory Usage: 14.4 MB, less than 31.74% of Swift online submissions for Search Insert Position.

// 510 ler ler (20220721)
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var lb = 0
        var rb = nums.count - 1
        while lb <= rb {
            let middle = lb + (rb-lb)/2
            if nums[middle] < target {
                lb = middle + 1
            } else {
                rb = middle - 1
            }
        }
        return lb
    }
}
