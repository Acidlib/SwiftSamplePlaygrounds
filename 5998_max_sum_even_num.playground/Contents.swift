import Foundation
class Solution {
    func maximumEvenSplit(_ finalSum: Int) -> [Int] {
        guard finalSum % 2 == 0 else {return []}
        if finalSum == 2 {return [2]}
        var residual = finalSum
        var result = [Int]()
        var num = 2
        while (residual > num) {
            if (!result.contains(num) && !result.contains(residual-num) && (residual-num) != num) {
                result.append(num)
                residual -= num
                num += 2
            } else {
                num += 2
            }
        }
        if (num < finalSum) {
            result.append(num)
        }

        return result
    }
}


let solution = Solution()
var answer = solution.maximumEvenSplit(12)
print(answer)
print(answer == [2,4,6])

answer = solution.maximumEvenSplit(7)
print(answer == [])

answer = solution.maximumEvenSplit(28)
print(answer == [2,4,6,16])


// Result:
// 时间复杂度：𝑂(𝑛√)
// TLE
