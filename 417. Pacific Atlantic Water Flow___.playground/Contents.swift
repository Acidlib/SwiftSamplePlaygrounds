//https://leetcode.com/problems/pacific-atlantic-water-flow/
//Runtime: 344 ms, faster than 62.50% of Swift online submissions for Pacific Atlantic Water Flow.
//Memory Usage: 14.3 MB, less than 95.45% of Swift online submissions for Pacific Atlantic Water Flow.
class Solution {
    var result = [[Int]]()
    func pacificAtlantic(_ matrix: [[Int]]) -> [[Int]] {
        if matrix.count == 0 { return result }
        let maxY = matrix.count, maxX = matrix[0].count
        
        //use 2 matrixes to record those "able to connect to ocean" grides;
        var markPac = [[Bool]](repeating: [Bool](repeating:false, count: maxX), count: maxY)
        var markAtl = [[Bool]](repeating: [Bool](repeating:false, count: maxX), count: maxY)
        
        for y in 0...(maxY-1) {
            dfs(matrix, Int(UInt8.min), y, 0, maxY, maxX, &markPac)
            dfs(matrix, Int(UInt8.min), y, maxX-1, maxY, maxX, &markAtl)
        }
        for x in 0...(maxX-1) {
            dfs(matrix, Int(UInt8.min), 0, x, maxY, maxX, &markPac)
            dfs(matrix, Int(UInt8.min), maxY-1, x, maxY, maxX, &markAtl)
        }
        // mark into result:
        for y in 0...(maxY-1) {
            for x in 0...(maxX-1) {
                if markPac[y][x], markAtl[y][x] { result.append( [y,x] ) }
            }
        }
        return result
    }

    func dfs(_ m: [[Int]], _ preHight:Int, _ y:Int, _ x:Int, _ maxY:Int, _ maxX:Int, _ ocean:inout [[Bool]]) {
        if y < 0 || x < 0 || y >= maxY || x >= maxX || ocean[y][x] || m[y][x] < preHight { return }
        ocean[y][x] = true;
        dfs(m, m[y][x], y-1, x, maxY, maxX, &ocean)
        dfs(m, m[y][x], y+1, x, maxY, maxX, &ocean)
        dfs(m, m[y][x], y, x+1, maxY, maxX, &ocean)
        dfs(m, m[y][x], y, x-1, maxY, maxX, &ocean)
    }
    
}

// ------------------------------------------------------------------------------

let solution = Solution()
var answer = solution.pacificAtlantic([[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]])
print(answer == [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]])

answer = solution.pacificAtlantic([[2,1],[1,2]])
print(answer == [[0,0],[0,1],[1,0],[1,1]])

