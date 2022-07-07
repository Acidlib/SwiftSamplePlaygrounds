//Runtime: 119 ms, faster than 19.91% of Swift online submissions for Two Sum.
//Memory Usage: 14.3 MB, less than 58.64% of Swift online submissions for Two Sum.
import Foundation

class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0 ..< nums.count {
            var output = [i]
            for j in i+1 ..< nums.count {
                if nums[j] == (target - nums[i]) {
                    output.append(j)
                    return output
                }
            }
        }
        return []
    }
}

//20220707
//Runtime: 43 ms, faster than 96.29% of Swift online submissions for Two Sum.
//Memory Usage: 14.4 MB, less than 48.19% of Swift online submissions for Two Sum.
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var memo = [Int: Int]()
        for (i, num) in nums.enumerated() {
            let remain = target - num
            if let index = memo[remain] {
                return [index, i]
            }
            memo[num] = i
        }
        return []
    }
}


let solution = Solution()
var answer = solution.twoSum([2,7,11,15], 9)
print(answer == [0,1])

answer = solution.twoSum([3,2,4], 6)
print(answer == [1,2])

answer = solution.twoSum([3,3], 6)
print(answer == [0, 1])
