class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n <= 1 { return 1}
        var stairArray = [1, 1]
        for i in 1 ... n-1 {
            stairArray.append(stairArray[i-1] + stairArray[i])
        }
        return stairArray.last!
    }
}


let solution = Solution()
var answer = solution.climbStairs(2)
print(answer == 2)

answer = solution.climbStairs(3)
print(answer == 3)

answer = solution.climbStairs(4)
print(answer == 5)
