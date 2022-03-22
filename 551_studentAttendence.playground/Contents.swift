//Input: numbers = [2,7,11,15], target = 9
//Output: [1,2]
//Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2


class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var low = 0
        var high = numbers.count - 1
        while low < high {
            let sum = numbers[low] + numbers[high]
            if sum == target { return [low + 1, high + 1]}
            if sum < target {
                low += 1
            } else {
                high -= 1
            }
        }
        return [-1, -1]
    }
}
//Input: numbers = [2,7,11,15], target = 9
//Output: [1,2]
//Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2

let solution = Solution()
var result = solution.twoSum([2, 7, 11, 15], 9)
print(result)


result = solution.twoSum([1, 2, 4, 5, 7, 8, 11, 47], 8)
print(result)
