class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        var result = Array(repeating: amount+1, count: amount+1)
        result[0] = 0
        for i in 1 ..< result.count {
            for j in 0 ..< coins.count {
                // should be i not result[i]
                if i >= coins[j] {
                    result[i] = min(result[i], 1 + result[i - coins[j]])
                }
            }
        }

        return result.last! < amount ? result.last! : -1
            
    }
}

let solution = Solution()
var answer = solution.coinChange([1,2,5], 11)
print(answer == 3)

answer = solution.coinChange([1,2,4,6], 11)
print(answer == 3)

answer = solution.coinChange([2], 3)
print(answer == -1)

answer = solution.coinChange([1], 0)
print(answer == 0)
