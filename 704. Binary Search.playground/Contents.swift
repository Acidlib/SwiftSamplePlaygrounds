//https://leetcode.com/problems/binary-search/
//Runtime: 554 ms, faster than 5.07% of Swift online submissions for Binary Search.
//Memory Usage: 14.3 MB, less than 51.59% of Swift online submissions for Binary Search.
//Runtime: 464 ms, faster than 18.08% of Swift online submissions for Binary Search.
//Memory Usage: 14.4 MB, less than 31.85% of Swift online submissions for Binary Search.
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var lb = 0
        var ub = nums.count - 1
        while lb <= ub {
            let middle = lb + (ub - lb)/2
            if nums[middle] == target { return middle }
            
            // boost the result:
            // Runtime: 268 ms, faster than 91.91% of Swift online submissions for Binary Search.
            // Memory Usage: 14.2 MB, less than 70.88% of Swift online submissions for Binary Search.
            if nums[lb] == target { return lb }
            if nums[ub] == target {return ub}
            
            if nums[middle] < target {
                lb = middle + 1
            } else {
                ub = middle - 1
            }
        }
        return -1
    }
}

let case1 = Solution().search([-1,0,3,5,9,12], 9)
print("\(case1) => \(case1 == 4)")

let case2 = Solution().search([-1,0,3,5,9,12], 2)
print("\(case2) => \(case2 == -1)")

let case3 = Solution().search([5], 5)
print("\(case3) => \(case3 == 0)")

let case4 = Solution().search([2,5], 5)
print("\(case4) => \(case4 == 1)")
