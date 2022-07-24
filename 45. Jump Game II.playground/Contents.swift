//https://leetcode.com/problems/jump-game-ii/

//Runtime: 210 ms, faster than 23.81% of Swift online submissions for Jump Game II.
//Memory Usage: 14.4 MB, less than 55.78% of Swift online submissions for Jump Game II.
//Runtime: 143 ms, faster than 47.62% of Swift online submissions for Jump Game II.
//Memory Usage: 14 MB, less than 95.92% of Swift online submissions for Jump Game II.

//ref: https://leetcode.com/problems/jump-game-ii/discuss/18028/O(n)-BFS-solution
class Solution {
    func jump(_ nums: [Int]) -> Int {
        var position = nums.count - 1
        var stepsCount = 0
        while position != 0 {
            for i in 0 ..< position {   //!! til position is ok
                if ((i + nums[i]) >= position) {
                    stepsCount += 1
                    position = i
                    break
                }
            }
        }
        return stepsCount
    }
}


let case1 = Solution().jump([2,3,0,1,4])
print(case1 == 2, case1)

let case2 = Solution().jump([2,3,1,1,4])
print(case2 == 2, case2)
