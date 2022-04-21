//https://leetcode.com/problems/palindromic-substrings/submissions/
//Runtime: 5 ms, faster than 68.09% of Swift online submissions for Palindromic Substrings.
//Memory Usage: 14.1 MB, less than 87.23% of Swift online submissions for Palindromic Substrings.
//Runtime: 3 ms, faster than 92.02% of Swift online submissions for Palindromic Substrings.
//Memory Usage: 14.3 MB, less than 75.00% of Swift online submissions for Palindromic Substrings.
class Solution {
    func countSubstrings(_ s: String) -> Int {
        let str = Array(s)
        var result = 0
        var templ = 0, tempr = 0
        for i in 0...str.count - 1 {
            templ = i
            tempr = i
            result += 1
            // check neibor pair
            while tempr < str.count - 1 && str[i] == str[tempr + 1] {
                tempr += 1
                result += 1
            }
            // check center pair
            while templ > 0 && tempr < str.count - 1 && str[templ - 1] == str[tempr + 1] {
                templ += -1
                tempr += 1
                result += 1
            }
        }
        return result
    }
}

let solution = Solution()
var result = solution.countSubstrings("abc")
print(result == 3)

result = solution.countSubstrings("aaa")
print(result == 6)
