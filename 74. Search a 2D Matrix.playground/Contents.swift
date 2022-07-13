//https://leetcode.com/problems/search-a-2d-matrix/
//Runtime: 36 ms, faster than 27.95% of Swift online submissions for Search a 2D Matrix.
//Memory Usage: 14.4 MB, less than 9.74% of Swift online submissions for Search a 2D Matrix.
//Runtime: 20 ms, faster than 95.90% of Swift online submissions for Search a 2D Matrix.
//Memory Usage: 14.3 MB, less than 38.97% of Swift online submissions for Search a 2D Matrix.
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let left = 0
        let right = matrix[0].count * matrix.count - 1
        return binarySearch(left, right, matrix: matrix, target)
    }
    
    func binarySearch(_ left: Int, _ right: Int, matrix:[[Int]], _ target: Int) -> Bool {
        if left > right { return false }
        if left == right {
            let (row, col) = getIndex(left, matrix)
            return matrix[row][col] == target
        }
        let midIndex = left + (right - left) / 2
        let (midRow, midCol) = getIndex(midIndex, matrix)
        if matrix[midRow][midCol] == target {
            return true
        } else if matrix[midRow][midCol] > target {
            return binarySearch(left, midIndex, matrix: matrix, target)
        } else {
            return binarySearch(midIndex+1, right, matrix: matrix, target)
        }
    }
    
    func getIndex(_ index: Int, _ matrix: [[Int]]) -> (Int, Int) {
        if index == 0 { return (0,0) }
        let row = (index) / matrix[0].count
        let col = (index) % matrix[0].count
        return (row, col)
    }
}

let solution = Solution()
var result = solution.searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3)
print(result == true)

result = solution.searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13)
print(result == false)

result = solution.searchMatrix([[1,1]], 0)
print(result == false)

result = solution.searchMatrix([[1,3]], 3)
print(result == true)

result = solution.searchMatrix([[1],[3]], 3)
print(result == true)
