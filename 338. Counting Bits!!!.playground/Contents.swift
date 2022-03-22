//Runtime: 50 ms, faster than 62.74% of Swift online submissions for Counting Bits.
//Memory Usage: 19.2 MB, less than 59.80% of Swift online submissions for Counting Bits.
class Solution {
    func countBits(_ num: Int) -> [Int] {
        guard num > 0 else { return [0] }

        var bits = [0]

        for i in 1...num {
            if i % 2 != 0 {
                bits.append(bits[i-1] + 1)
            } else {
                bits.append(bits[i / 2])
            }
        }
        return bits
    }
}


let solution = Solution()
var answer = solution.countBits(2)
print(answer == [0,1,1])

answer = solution.countBits(5)
print(answer == [0,1,1,2,1,2])
