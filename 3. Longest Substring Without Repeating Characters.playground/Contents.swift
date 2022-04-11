//04/11/2022 23:48 answer
//https://leetcode.com/problems/longest-substring-without-repeating-characters/submissions/
//Runtime: 20 ms, faster than 70.93% of Swift online submissions for Longest Substring Without Repeating Characters.
//Memory Usage: 14 MB, less than 99.48% of Swift online submissions for Longest Substring Without Repeating Characters
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var window = [Character]()
        var maxCount = 0
        for l in s {
            if window.contains(l) {
                while window.first != l {
                    window.removeFirst()
                }
                window.removeFirst()
            }
            window.append(l)
            maxCount = max(maxCount, window.count)
        }
        return maxCount
    }
}

// ------------------------------------------------------------------------------------------------
// 04/17/2021 02:36 answer
//Runtime: 74 ms, faster than 20.47% of Swift online submissions for Longest Substring Without Repeating Characters.
//Memory Usage: 14.4 MB, less than 88.26% of Swift online submissions for Longest Substring Without Repeating Characters.
// class Solution2 {
//     func lengthOfLongestSubstring(_ s: String) -> Int {
//         var window: [Character] = []     // save unique characters
//         var localMax = 0                 // the max so far we have
//         for character in s {
//             if !window.contains(character) {
//                 window.append(character)
//             } else {
//                 let index = window.firstIndex(of: character) ?? 0
//                 // print("window: \(window) indexL \(index) \(window.count) \(window[(index+1)...])")
//                 window = Array(window[(index+1)...])
//                 window.append(character)
//             }
//             localMax = max(window.count, localMax)
//         }
//         return localMax
//     }
// }


let solution = Solution()
var result = solution.lengthOfLongestSubstring("abcabcbb")
print(result == 3)

result = solution.lengthOfLongestSubstring("bbbbb")
print(result == 1)

result = solution.lengthOfLongestSubstring("pwwkew")
print(result == 3)


