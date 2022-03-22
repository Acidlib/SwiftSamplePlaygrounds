class Solution {
    func sumOfThree(_ num: Int) -> [Int] {
        if (num%3 == 0) {
            return [num/3-1, num/3, num/3+1]
        }
        return []
    }
}


let solution = Solution()
var answer = solution.sumOfThree(33)
print(answer == [10,11,12])

answer = solution.sumOfThree(4)
print(answer == [])
