class Solution {
    func countPairs(_ nums: [Int], _ k: Int) -> Int {
        // boundary: more than one pair?
        var cursor = 0
        var result = 0
        while cursor < nums.count {
            for i in cursor+1 ..< nums.count {
                if (nums[i] == nums[cursor] && i * cursor % k == 0) {
                    result += 1
                }
            }
            cursor += 1
        }
        return result
    }
}


let solution = Solution()
var answer = solution.countPairs([3,1,2,2,2,1,3], 2)
print(answer == 4)

answer = solution.countPairs([1,2,3,4], 1)
print(answer == 0)
