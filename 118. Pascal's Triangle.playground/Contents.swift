//https://leetcode.com/problems/pascals-triangle/
//Runtime: 10 ms, faster than 8.07% of Swift online submissions for Pascal's Triangle.
//Memory Usage: 14.2 MB, less than 42.07% of Swift online submissions for Pascal's Triangle.
//Runtime: 3 ms, faster than 77.23% of Swift online submissions for Pascal's Triangle.
//Memory Usage: 14.3 MB, less than 5.48% of Swift online submissions for Pascal's Triangle.
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[1]]
        if numRows == 1 { return result }
        for i in 1 ..< numRows {
            var temp = Array(repeating: 1, count: i+1)
            for j in 1 ..< temp.count - 1 {
                temp[j] = result.last![j-1] + result.last![j]
            }
            result.append(temp)
        }
        return result
    }
}


// 1 1
// 1 2 1            => 1= 0, 1
// 1 3 3 1          => 1= 0,1 | 2 = 1,2
// 1 4 6 4 1        =>
// 1 5 10 10 5 1
// 1 6 15 20 15 1


//let solution = Solution()
//var result = solution.generate(5)
//print(result == [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]])
//
//result = solution.generate(1)
//print(result == [[1]])


//result = solution.generate(6)
//print(result == [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1], [1,5, 10, 10, 5, 1]])
