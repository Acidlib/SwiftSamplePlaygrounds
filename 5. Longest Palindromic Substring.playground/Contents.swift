//https://leetcode.com/problems/longest-palindrome/
//Runtime: 33 ms, faster than 90.15% of Swift online submissions for Longest Palindromic Substring.
//Memory Usage: 14.7 MB, less than 30.55% of Swift online submissions for Longest Palindromic Substring.
// Ref: https://leetcode.com/problems/longest-palindromic-substring/discuss/1604014/Swift-Readable-Solution
class Solution {
    func longestPalindrome(_ s: String) -> String {
        let s = Array(s)
        var start = 0
        var end = 0
        for center in s.indices {
            // center is one value (?)
            let length1 = palindromeLength(chars: s, leftCenter: center, rightCenter: center)
            // center is a pair (?)
            let length2 = palindromeLength(chars: s, leftCenter: center, rightCenter: center+1)
            let maxLength = max(length1, length2)
            if maxLength > end - start {
                start = center - (maxLength - 1) / 2
                end = center + maxLength / 2
            }
        }
        return String(s[start...end])
    }

    private func palindromeLength(chars: [Character], leftCenter: Int, rightCenter: Int) -> Int {
        var leftCenter = leftCenter
        var rightCenter = rightCenter
        while leftCenter >= 0 && rightCenter < chars.endIndex && chars[leftCenter] == chars[rightCenter] {
            leftCenter -= 1
            rightCenter += 1
        }
        return rightCenter - leftCenter - 1
    }
}

//Runtime: 19 ms, faster than 100.00% of Swift online submissions for Longest Palindromic Substring.
//Memory Usage: 14.2 MB, less than 88.31% of Swift online submissions for Longest Palindromic Substring.
//Ref: https://leetcode.com/problems/longest-palindromic-substring/discuss/1034808/Swift-Fast-and-Simple-beat-98
class Solution2 {
    func longestPalindrome(_ s: String) -> String {
        var a = Array(s), start = 0, len = 1, center = 0
        while center < a.count {
            var l = center, r = center
            while r < a.count - 1 && a[l] == a[r + 1] {
                r += 1
            }
            center = r + 1
            while l > 0 && r < a.count - 1 && a[l - 1] == a[r + 1] {
                l -= 1
                r += 1
            }
            if len < r - l + 1 {
                len = r - l + 1
                start = l
            }
        }
        return String(s.prefix(start + len).suffix(len))
    }
}

// 唔唔默寫
//Runtime: 56 ms, faster than 71.31% of Swift online submissions for Longest Palindromic Substring.
//Memory Usage: 14.3 MB, less than 88.33% of Swift online submissions for Longest Palindromic Substring.
class Solution3 {
    func longestPalindrome(_ s: String) -> String {
        let a = Array(s)
        var center = 0, len = 1, start = 0
        while center < a.count {
            var l = center, r = center
            // accumulate same one
            while r < a.count - 1 && a[r] == a[r+1] {
                r += 1
            }
            // shift the center
            center += 1
            
            // find the pair
            while l > 0 && r < a.count - 1 && a[l-1] == a[r+1] {
                r += 1
                l -= 1
            }
            
            if len < r-l+1 {
                len = r-l + 1
                start = l
            }
        }
        // 0 1 2 3 4 5
        // let's say start = 2 len = 2
        // the result will be: 2 3
        return String(s.prefix(start + len).suffix(len)) // faster
        //return String(a[start..<(start+len)])
    }
}


let solution = Solution()
var result = solution.longestPalindrome("babad")
print(result == "aba")


result = solution.longestPalindrome("cbbd")
print(result == "bb")

result = solution.longestPalindrome("bc")
print(result == "b")

result = solution.longestPalindrome("bb")
print(result == "bb")

result = solution.longestPalindrome("ccc")
print(result == "ccc")


let s = "012345"
print(s.prefix(4).suffix(2))

