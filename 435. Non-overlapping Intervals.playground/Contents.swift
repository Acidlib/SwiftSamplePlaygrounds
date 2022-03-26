//https://leetcode.com/problems/non-overlapping-intervals/
//Runtime: 2050 ms, faster than 25.56% of Swift online submissions for Non-overlapping Intervals.
//Memory Usage: 23.2 MB, less than 65.56% of Swift online submissions for Non-overlapping Intervals.
//Runtime: 1604 ms, faster than 64.44% of Swift online submissions for Non-overlapping Intervals.
//Memory Usage: 23.3 MB, less than 54.44% of Swift online submissions for Non-overlapping Intervals.

class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        guard intervals.count > 0 else { return 0 }
        let sortedIntervals = intervals.sorted { (lhs, rhs) in
            return lhs[1] == rhs[1] ? lhs[0] < rhs[0] : lhs[1] < rhs[1]
        }
        var temp = sortedIntervals.first!
        var count = 0
        for i in 1 ..< intervals.count {
            let interval = sortedIntervals[i]
            if interval[0] < temp[1] || interval[1] <= temp[1] {
                count += 1
            } else {
                temp = interval
            }
        }
        return count
    }
}

// ------------------------------------------------------------------------------

let solution = Solution()
var answer = solution.eraseOverlapIntervals([[1,2],[2,3],[3,4],[1,3]])
print(answer == 1)

answer = solution.eraseOverlapIntervals([[1,2],[1,2],[1,2]])
print(answer == 2)

answer = solution.eraseOverlapIntervals([[1,2],[2,3]])
print(answer == 0)


answer = solution.eraseOverlapIntervals([[1,5],[2,6],[7,10]])
print(answer == 1)


answer = solution.eraseOverlapIntervals([[1,2],[2,5],[4,6],[1,6]])
print(answer == 2)

answer = solution.eraseOverlapIntervals([[1,100],[11,22],[1,11],[2,12]])
print(answer == 2)
print(answer)

