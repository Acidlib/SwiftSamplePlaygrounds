class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var localMax = 0
        var count = 0
        for i in flowerbed {
            if count != 0 && i == 1 {
                localMax = max(count, localMax)
                count = 0
                print(localMax)
                if localMax >= 2*n { return true }
            } else {
                count += 1
            }
        }
        return localMax > 2*n
    }
}

let solution = Solution()
let result = solution.canPlaceFlowers([1,0,0,0,1], 2)
