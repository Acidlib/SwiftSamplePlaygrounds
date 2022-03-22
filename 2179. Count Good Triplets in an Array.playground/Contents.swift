import Foundation
class Solution {
    func maximumEvenSplit(_ finalSum: Int) -> [Int] {
        guard finalSum % 2 == 0 else {return []}
        var result = [Int]()
        var residual = finalSum
        func getMaxEvenCommonFactor(_ value: Int) -> Int {
            let squareRoot = Int(floor(sqrt(Double(value))))
            
            return squareRoot % 2 == 0 ? squareRoot : squareRoot - 1
        }
        
        let squareRoot = Int(floor(sqrt(Double(28))))
        while (residual % 2 == 0 && residual > 1) {
            let factor = getMaxEvenCommonFactor(residual)
            if (result.contains(factor)) {
                factor += 2
            }
            result.append(factor)
            residual = residual - factor
            print(factor, residual)
        }
        return result
    }
}


let solution = Solution()
var answer = solution.maximumEvenSplit(12)
print(answer == [2,4,6])

answer = solution.maximumEvenSplit(7)
print(answer == [])

answer = solution.maximumEvenSplit(28)
print(answer == [6,8,2,12])
