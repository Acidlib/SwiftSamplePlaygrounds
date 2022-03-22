// I can't write unit test for this
// it could be a restriction of Swift
class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var sum = 0, n = n
        while n != 0 {
            sum += 1
            n &= (n - 1)
        }
        return sum
    }
}

let solution = Solution()
var answer = solution.hammingWeight(00000000000000000000000000001011)
print(answer == 3)

answer = solution.hammingWeight(00000000000000000000000010000000)
print(answer == 1)

//answer = solution.hammingWeight(11111111111111111111111111111101)
//print(answer == 31)


