class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [[Int]]() }
        let sortedNums = nums.sorted()
        var result = [[Int]]()

        // [x0, x1, x2, x3, ..., x(count-3), x(count-2), x(count-1)]
        for i in 0 ..< sortedNums.count-2 {
            // [-1,0,1,2,-1,-4]
            if i != 0 && sortedNums[i] == sortedNums[i-1] {
                continue
                
            }
            var minIndex = i + 1
            var maxIndex = sortedNums.count - 1
            while minIndex < maxIndex {
                let sum = sortedNums[i] + sortedNums[minIndex] + sortedNums[maxIndex]
                if sum == 0 {
                    result.append([sortedNums[i], sortedNums[minIndex], sortedNums[maxIndex]])
                    minIndex += 1
                    // To pass the case: [0,0,0,0,0,0]
                    while minIndex < maxIndex, sortedNums[minIndex] == sortedNums[minIndex-1] {
                        minIndex += 1
                    }
                } else if sum < 0 {
                    minIndex += 1
                } else {
                    maxIndex -= 1
                }
            }
        }
        return result
    }
}

//let solution = Solution()
//var answer = solution.threeSum([-1,0,1,2,-1,-4])
//print(answer)
//print(answer == [[-1,-1,2],[-1,0,1]])
//
//answer = solution.threeSum([])
//print(answer == [])
//
//answer = solution.threeSum([0])
//print(answer == [])
//
//answer = solution.threeSum([0,0,0,0,0,0])
//print(answer)

var randomSet = [ (1,2,3)]
var new = (1, 2, 3)
randomSet.append(new)
print(randomSet)
