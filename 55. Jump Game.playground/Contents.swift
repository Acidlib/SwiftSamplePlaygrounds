//https://leetcode.com/problems/jump-game/
//Runtime: 340 ms, faster than 96.13% of Swift online submissions for Jump Game.
//Memory Usage: 14.7 MB, less than 22.02% of Swift online submissions for Jump Game.
//Runtime: 574 ms, faster than 45.07% of Swift online submissions for Jump Game.
//Memory Usage: 14.3 MB, less than 71.27% of Swift online submissions for Jump Game.

class Solution1 {
    func canJump(_ nums: [Int]) -> Bool {
        guard nums.count > 0 else { return true }
        var farest = nums.first!
        var current = 0
        while farest >= current {
            // reach is current + current value
            let reach = current + nums[current]
            if reach >= (nums.count-1) { return true }
            farest = max(farest, reach)
            current += 1
        }
        return false
    }
}

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else { return true }
        var farestReach = nums.first!
        var current = 0
        while current <= farestReach {
            farestReach = max(farestReach, current + nums[current])
            if farestReach >= nums.count - 1 {
                return true
            }
            current += 1
        }
        return false
    }
}

// ------------------------------------------------------------------------------

let solution = Solution()
var answer = solution.canJump([2,3,1,1,4])
print(answer == true)

answer = solution.canJump([3,2,1,0,4])
print(answer == false)

answer = solution.canJump([0, 1])
print(answer == false)


answer = solution.canJump([0])
print(answer == true)

