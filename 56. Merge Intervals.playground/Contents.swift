//https://leetcode.com/problems/merge-intervals/
//Runtime: 136 ms, faster than 74.60% of Swift online submissions for Merge Intervals.
//Memory Usage: 15.5 MB, less than 74.10% of Swift online
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 0 else { return [] }
        let sortedIntervals = intervals.sorted(by: {$0[0] < $1[0]})
        var result = [[Int]]()
        var temp = sortedIntervals.first!
        for i in 1 ..< sortedIntervals.count {
            let interval = sortedIntervals[i]
            if interval[0] <= temp[1] {
                temp = [temp[0], max(interval[1], temp[1])]
            } else {
                result.append(temp)
                temp = interval
            }
        }
        if !temp.isEmpty {
            result.append(temp)
        }
        return result
    }
}

// ------------------------------------------------------------------------------

let solution = Solution()
var answer = solution.merge([[1,3],[2,6],[8,10],[15,18]])
print(answer == [[1,6],[8,10],[15,18]])

answer = solution.merge([[1,4],[4,5]])
print(answer == [[1,5]])

answer = solution.merge([[1,4],[0,4]])
print(answer == [[0,4]])

answer = solution.merge([[1,4],[2,3]])
print(answer == [[1,4]])
