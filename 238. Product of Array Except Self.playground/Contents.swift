
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        // zero
        //
        // 1. [xxxxx0xxxxx]
        // 2. [xxx0xxxx0xx] => [00000000]
        // 3. [xxxxxxxxxxx] => [totalProduc/self, ]
        
        var totalProduct = 1
        var zeroPositions = [Int]()

        for (n, value) in nums.enumerated() {
            if (value == 0) {
                zeroPositions.append(n)
            } else {
                totalProduct = totalProduct * value
            }
            if zeroPositions.count > 1 {
                return Array(repeating: 0, count: nums.count)
            }
        }
        
        if zeroPositions.count > 0 {
            var result = Array(repeating: 0, count: nums.count)
            result[zeroPositions[0]] = totalProduct
            return result
        } else {
            return nums.map { num in
                totalProduct/num
            }
        }

    }
}

let solution = Solution()
var answer = solution.productExceptSelf([1,2,3,4])
print(answer == [24,12,8,6])

answer = solution.productExceptSelf([-1,1,0,-3,3])
print(answer == [0,0,9,0,0])



