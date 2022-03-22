class Solution {
    func reverseBits(_ n: Int) -> Int {
        var n = n
        var result = 0
        
        for i in 0..<32 {
            result += (n & 1)
            n >>= 1
            if i < 31 {
                result <<= 1
            }
        }
        
        return result
    }
}

let solution = Solution()
var answer = solution.reverseBits(00000010100101000001111010011100)
print(answer == 964176192)

answer = solution.reverseBits(11111111111111111111111111111101)
print(answer == 3221225471)


