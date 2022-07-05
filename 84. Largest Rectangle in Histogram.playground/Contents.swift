//https://leetcode.com/problems/largest-rectangle-in-histogram/
// tutorial:
// https://liuzhenglaichn.gitbook.io/algorithm/monotonic-stack


// Good ref: https://leetcode.com/problems/largest-rectangle-in-histogram/discuss/1727432/Daily-LeetCoding-Challenge-January-Day-29
// TLE: Brutal
//Time: O(n ^ 2) : Let n be the length of the heights
//Space: O(1)
class Solution1 {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var maxArea = 0
        for i in 0 ..< heights.count {
            var minHeight = Int.max
            for j in i ..< heights.count {
                minHeight = min(minHeight, heights[j])
                maxArea = max(maxArea, minHeight * (j-i+1))
            }
        }
        return maxArea
    }
}

//Runtime: 782 ms, faster than 97.01% of Swift online submissions for Largest Rectangle in Histogram.
//Memory Usage: 18.6 MB, less than 20.90% of Swift online submissions for Largest Rectangle in Histogram.
//Runtime: 1336 ms, faster than 23.88% of Swift online submissions for Largest Rectangle in Histogram.
//Memory Usage: 18.6 MB, less than 38.81% of Swift online submissions for Largest Rectangle in Histogram.
class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        // Stack of tuple (index, height)
        var stack: [(Int, Int)] = []
        var maxArea = 0
        for i in 0 ..< heights.count {
            var startIndex = i
            while let last = stack.last, last.1 > heights[i] {
                stack.popLast()
                //print("i:\(i) bye:\(heights[i]) pop:\(last.0) height: \(last.1) area\(last.1 * (i - last.0))")
                // note that when calculating the area, the i is actually the uncounted one
                // e.g. [2,1,5,6,2,3] => index 4, value 2, calculate idx:2-3, => 4-2 = 2
                // there is no need to + 1 for (i-last.0)
                maxArea = max(maxArea, last.1 * (i - last.0))
                startIndex = last.0
                //print("\(i) stack:\(stack) maxArea:\(maxArea)")
            }
            stack.append((startIndex, heights[i]))
            //print("\(i) stack:\(stack) maxArea:\(maxArea)//")
        }
        //print(stack, maxArea)
        for (startIndex, height) in stack {
            maxArea = max(maxArea, height * (heights.count - startIndex))
        }
        return maxArea
    }
}

let solution = Solution()
var answer = solution.largestRectangleArea([2,1,5,6,2,3])
print(answer == 10)
//0 stack:[(0, 2)] maxArea:0//
//1 stack:[] maxArea:2
//1 stack:[(0, 1)] maxArea:2//
//2 stack:[(0, 1), (2, 5)] maxArea:2//
//3 stack:[(0, 1), (2, 5), (3, 6)] maxArea:2//
//4 stack:[(0, 1), (2, 5)] maxArea:6
//4 stack:[(0, 1)] maxArea:10
//4 stack:[(0, 1), (2, 2)] maxArea:10//
//5 stack:[(0, 1), (2, 2), (5, 3)] maxArea:10//
//stack: [(0, 1), (2, 2), (5, 3)] 10

//answer = solution.largestRectangleArea([2, 4])
//print(answer == 4)
