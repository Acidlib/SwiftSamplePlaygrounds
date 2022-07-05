//https://leetcode.com/problems/minimum-difficulty-of-a-job-schedule/

// ===========Top down method=====================
// [!] number of states: n*d
// [!] each state has for loop: time complexity: n^2*d
// [!] space: top-down DP n*d (equal to number of states)
// ref: https://www.youtube.com/watch?v=F1DYKh1VcBE&ab_channel=HappyCoding
class Solution1 {
    func minDifficulty(_ jobDifficulty: [Int], _ d: Int) -> Int {
        if d > jobDifficulty.count { return -1 }
        return dfs(0, d, jobDifficulty)
    }
    
    func dfs(_ index: Int,_ remainDays: Int, _ jobDifficulty: [Int]) -> Int {
        if index == jobDifficulty.count && remainDays == 0 { return 0 }
        // return Int.max would cause error: error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).
        if index == jobDifficulty.count || remainDays == 0 { return 1001 }
        var currentMax = 0
        var result = Int.max
        for i in index ..< jobDifficulty.count {
            currentMax = max(currentMax, jobDifficulty[i])
            // next state would be i+1, remaindDays-1
            result = min(result, currentMax + dfs(i+1, remainDays-1, jobDifficulty))
        }
        return result
    }
}

// ===========Bottom down method=====================
class Solution {
    func minDifficulty(_ jobDifficulty: [Int], _ d: Int) -> Int {
        var dp = Array(repeating: Array(repeating: -1, count: d+1), count: jobDifficulty.count+1)
        for i in 0 ..< jobDifficulty.count {
            for d in d
        }
    }
}


let solution = Solution()
var answer = solution.minDifficulty([6,5,4,3,2,1], 2)
print(answer == 7)

answer = solution.minDifficulty([9,9,9], 4)
print(answer == -1)

answer = solution.minDifficulty([1,1,1], 3)
print(answer == 3)
