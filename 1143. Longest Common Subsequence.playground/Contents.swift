class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {

    }
}

// ------------------------------------------------------------------------------

let solution = Solution()
var answer = solution.longestCommonSubsequence("abcde", "ace")
print(answer == 3)

answer = solution.longestCommonSubsequence("abc", "abc")
print(answer == 3)

answer = solution.longestCommonSubsequence("abc", "def")
print(answer == 0)
