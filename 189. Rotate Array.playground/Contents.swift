//https://leetcode.com/problems/rotate-array/
//510
//Runtime: 1032 ms, faster than 27.84% of Swift online submissions for Rotate Array.
//Memory Usage: 21.4 MB, less than 60.52% of Swift online submissions for Rotate Array.
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        var count = k
        while count > 0 {
            let num = nums.popLast()!
            nums.insert(num, at: 0)
            count -= 1
        }
    }
}

//510
//WRONG, because k can be bigger than nums.count
//class Solution2 {
//    func rotate(_ nums: inout [Int], _ k: Int) {
//         nums = Array(nums[(nums.count - k)..<nums.count]) + Array(nums[0..<nums.count-k])
//    }
//}
// ======> optimize: use modulator
//Runtime: 272 ms, faster than 79.94% of Swift online submissions for Rotate Array.
//Memory Usage: 21.8 MB, less than 12.30% of Swift online submissions for Rotate Array.
class Solution2 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.count
         nums = Array(nums[(nums.count - k)..<nums.count]) + Array(nums[0..<nums.count-k])
    }
}
