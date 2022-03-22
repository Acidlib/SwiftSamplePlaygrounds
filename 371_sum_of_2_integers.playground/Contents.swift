class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        // Solution 1:
        // Use the advanced(by:) method in generic code to offset a value by a specified distance. If you're working directly with numeric values, use the addition operator (+) instead of this method.
        // return a.advanced(by: b)
        
        // Solution 2:
        var sum = a, carry = b
        while carry != 0 {
            (sum, carry) = (sum ^ carry, (sum & carry) << 1)
        }
        return sum
    }
}

let solution = Solution()
var answer = solution.getSum(1, 2)
print(answer == 3)

answer = solution.getSum(2, 3)
print(answer == 5)


