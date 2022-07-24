//https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
//510
//Runtime: 94 ms, faster than 60.98% of Swift online submissions for Two Sum II - Input Array Is Sorted.
//Memory Usage: 14.5 MB, less than 90.10% of Swift online submissions for Two Sum II - Input Array Is Sorted.
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var wishList = [Int:Int]()
        for (index, num) in numbers.enumerated() {
            let wish = target - num
            if let pairIndex = wishList[num] {
                return [pairIndex + 1, index + 1]
            } else {
                wishList[wish] = index
            }
        }
        return []
    }
}

let case1 = Solution().twoSum([2,7,11,15], 9)
print(case1 == [1,2])

let case2 = Solution().twoSum([2,3,4], 6)
print(case2 == [1,3])

let case3 = Solution().twoSum([-1, 0], -1)
print(case3 == [1,2])
