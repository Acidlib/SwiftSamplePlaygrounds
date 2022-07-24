//https://leetcode.com/problems/delete-and-earn/

//https://leetcode.com/problems/delete-and-earn/

// process exited with signal SIGSEGV
//class Solution {
//    func deleteAndEarn(_ nums: [Int]) -> Int {
//        return deleteAndEarn(nums, 0)
//    }
//
//    func deleteAndEarn(_ nums: [Int],_ sum: Int) -> Int {
//            var maxSum = sum
//            let numSet = Set(nums)
//            for i in numSet {
//                //var newSum = maxSum
//                maxSum = max(maxSum, deleteandEarnHelper(nums, i, sum))
//            }
//            return maxSum
//        }
//
//    func deleteandEarnHelper(_ nums: [Int],_ delete: Int, _ sum: Int) -> Int {
//        let sum = sum + delete
//        let newNums = nums.filter{$0 != (delete + 1) && $0 != (delete - 1)}
//        return deleteAndEarn(newNums, sum)
//    }
//}

//Runtime: 73 ms, faster than 54.72% of Swift online submissions for Delete and Earn.
//Memory Usage: 14.3 MB, less than 98.11% of Swift online submissions for Delete and Earn.
class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var take = 0, skip = 0
        var values = [Int](repeating: 0, count: 10001)
        for num in nums {
            values[num] += num
        }
        for value in values {
            var temp = max(skip+value, take)
            skip = take
            take = temp
        }
        
        return take
    }
}

let case1 = Solution().deleteAndEarn([2,2,3,3,3,4])
print(case1 == 9)
print(case1)
