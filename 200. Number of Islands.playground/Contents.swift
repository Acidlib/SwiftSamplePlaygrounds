//https://leetcode.com/problems/number-of-islands/
//Runtime: 200 ms, faster than 92.73% of Swift online submissions for Number of Islands.
//Memory Usage: 17.1 MB, less than 34.41% of Swift online submissions for Number of Islands.

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var board = grid
        //
        var res = 0
        for (i, row) in board.enumerated() {
            for (j, _) in row.enumerated() {
                // print("i: \(i), row: \(row); j:\(j) board:\(board[i]) res:\(res)")
                if board[i][j] == Character("1") {
                    dfs(&board, i: i, j: j)
                    res += 1
                }
            }
        }
        return res
    }
    
    func dfs(_ grid: inout [[Character]], i: Int, j: Int) {
        // return when out of the bound
        if (i >= grid.count || i < 0) || (j >= grid[0].count || j < 0) { return }
        // ignore 0
        if grid[i][j] == Character("0") { return }
        
        // Write grid
        // print("write grid:[\(i)][\(j)] -> 0")
        grid[i][j] = Character("0")
        // reset the surounding values to be zero
        dfs(&grid, i: i + 1, j: j)
        dfs(&grid, i: i - 1, j: j)
        dfs(&grid, i: i, j: j + 1)
        dfs(&grid, i: i, j: j - 1)
    }
}
// ------------------------------------------------------------------------------

let solution = Solution()
var answer = solution.numIslands( [
    ["1","1","1","1","0"],
    ["1","1","0","1","0"],
    ["1","1","0","0","0"],
    ["0","0","0","0","0"]
  ])
print(answer == 1)

answer = solution.numIslands([
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]
  ])
print(answer == 3)

