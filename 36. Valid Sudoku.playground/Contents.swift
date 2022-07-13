// https://leetcode.com/problems/valid-sudoku/
// ref: https://leetcode.com/problems/valid-sudoku/discuss/15450/Shared-my-concise-Java-code
// ref: https://leetcode.com/problems/valid-sudoku/discuss/15472/Short%2BSimple-Java-using-Strings
// Java: Hashmap
// true if the element is added to the HashSet<T> object; false if the element is already present.
//Runtime: 152 ms, faster than 18.30% of Swift online submissions for Valid Sudoku.
//Memory Usage: 14.6 MB, less than 20.21% of Swift online submissions for Valid Sudoku.
//Runtime: 118 ms, faster than 47.66% of Swift online submissions for Valid Sudoku.
//Memory Usage: 14.6 MB, less than 34.26% of Swift online submissions for Valid Sudoku.
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var memo = Set<String>()
        for i in 0 ..< 9 {
            for j in 0 ..< 9 {
                let val = board[i][j]
                if val != "." {
                    if !memo.insert("val: (\(val) row \(i)").inserted ||
                        !memo.insert("val: \(val) col \(j)").inserted ||
                        !memo.insert("val: \(val) block \(i/3)- \(j/3)").inserted {
                        return false
                    }
                }
            }
        }
        
        return true
    }
}

let solution = Solution()
var result = solution.isValidSudoku([["5","3",".",".","7",".",".",".","."]
                                     ,["6",".",".","1","9","5",".",".","."]
                                     ,[".","9","8",".",".",".",".","6","."]
                                     ,["8",".",".",".","6",".",".",".","3"]
                                     ,["4",".",".","8",".","3",".",".","1"]
                                     ,["7",".",".",".","2",".",".",".","6"]
                                     ,[".","6",".",".",".",".","2","8","."]
                                     ,[".",".",".","4","1","9",".",".","5"]
                                     ,[".",".",".",".","8",".",".","7","9"]])
print(result == true)
result = solution.isValidSudoku([["8","3",".",".","7",".",".",".","."]
                                 ,["6",".",".","1","9","5",".",".","."]
                                 ,[".","9","8",".",".",".",".","6","."]
                                 ,["8",".",".",".","6",".",".",".","3"]
                                 ,["4",".",".","8",".","3",".",".","1"]
                                 ,["7",".",".",".","2",".",".",".","6"]
                                 ,[".","6",".",".",".",".","2","8","."]
                                 ,[".",".",".","4","1","9",".",".","5"]
                                 ,[".",".",".",".","8",".",".","7","9"]])
print(result == false)

