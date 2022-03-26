//https://leetcode.com/problems/insert-interval/
//Runtime: 65 ms, faster than 81.69% of Swift online submissions for Insert Interval.
//Memory Usage: 14.9 MB, less than 35.21% of Swift online submissions for Insert Interval.
// conditions
// 1. |------()------|
// 2. |------(--|----)
// 3. (----|-----|---)
// 4. (----|-----)---|
// 5. ()||
// 6. ||()
class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard intervals.count > 0 else { return [newInterval]}
        var result = [[Int]]()
        var temp = newInterval
        for i in 0 ..< intervals.count {
            if temp.isEmpty {
                result.append(contentsOf: intervals[i..<intervals.count])
                break
            }
            
            let interval = intervals[i]
            let newTemp = insertArray(interval, temp)
            // no overlap
            if newTemp.isEmpty {
                if temp != newInterval || temp[1] < interval[0] {
                    result.append(temp)
                    temp = []
                }
                result.append(interval)
            // overlap: assgin to temp
            } else {
                temp = newTemp
            }
        }
        // final
        if !temp.isEmpty {
            result.append(temp)
        }
        return result
    }
    
    
    func insertArray(_ interval: [Int], _ newInterval: [Int]) -> [Int] {
        if interval[0] >= newInterval[0] && interval[1] <= newInterval[1] {
            return [newInterval[0], newInterval[1]]
        } else if interval[0] >= newInterval[0] && newInterval[1] <= interval[1] && interval[0] < newInterval[1] {
            return [newInterval[0], interval[1]]
        } else if interval[0] <= newInterval[0] && interval[1] >= newInterval[1] {
            return [interval[0], interval[1]]
        } else if interval[0] <= newInterval[0] && interval[1] <= newInterval[1] && interval[1] > newInterval[0] {
            return [interval[0], newInterval[1]]
        } else if interval[1] == newInterval[0] {
            return [interval[0], newInterval[1]]
        } else if interval[0] == newInterval[1] {
            return [newInterval[0], interval[1]]
        } else {
            return []
        }
    }
}
// ------------------------------------------------------------------------------

let solution = Solution()
var answer = solution.insert([[1,3],[6,9]], [2,5])
print(answer == [[1,5],[6,9]])

answer = solution.insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8])
print(answer == [[1,2],[3,10],[12,16]])

answer = solution.insert([[1,5]], [6,8])
print(answer == [[1,5],[6,8]])

answer = solution.insert([[1,5]], [2,3])
print(answer == [[1,5]])

answer = solution.insert([[2,4],[5,7],[8,10],[11,13]], [3,6])
print(answer = [[2,7], [8,10], [11,13]])

answer = solution.insert([[3,5],[12,15]], [6,6])
print(answer = [[3,5],[6,6],[12,15]])


answer = solution.insert([[2,5],[6,7],[8,9]], [0,1])
print(answer)
print(answer = [[0,1],[2,5],[6,7],[8,9]])
