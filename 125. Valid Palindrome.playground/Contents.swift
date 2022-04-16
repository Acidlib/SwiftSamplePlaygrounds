//https://leetcode.com/problems/valid-palindrome/
import Foundation
//Runtime: 20 ms, faster than 64.53% of Swift online submissions for Valid Palindrome.
//Memory Usage: 15.6 MB, less than 69.34% of Swift online submissions for Valid Palindrome.
//Runtime: 12 ms, faster than 93.43% of Swift online submissions for Valid Palindrome.
//Memory Usage: 15.5 MB, less than 72.85% of Swift online submissions for Valid Palindrome.
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let s = s.lowercased().filter{ $0.isLetter || $0.isNumber }
        let sArr = Array(s)
        var start = 0
        var end = sArr.count - 1
        while start <= end {
            if sArr[start] != sArr[end] {
                return false
            }
            start += 1
            end -= 1
        }
        return true
    }
}

let solution = Solution()
var result = solution.isPalindrome("A man, a plan, a canal: Panama")
print(result == true)

result = solution.isPalindrome("race a car")
print(result == false)

result = solution.isPalindrome(" ")
print(result == true)

result = solution.isPalindrome("ab@a")
print(result == true)

result = solution.isPalindrome("0P")
print(result == false)
