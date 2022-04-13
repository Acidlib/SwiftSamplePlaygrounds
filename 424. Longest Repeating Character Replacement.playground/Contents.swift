//https://leetcode.com/problems/longest-repeating-character-replacement/
// ref: https://leetcode.com/problems/longest-repeating-character-replacement/discuss/619135/Swift-Solution-O(n)-Sliding-Window-%2B-Dictionary
//Runtime: 28 ms, faster than 58.67% of Swift online submissions for Longest Repeating Character Replacement.
//Memory Usage: 14.8 MB, less than 30.00% of Swift online submissions for Longest Repeating Character Replacement.
class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var dict = [Character: Int]()
        var start = 0
        var maxCount = 0
        var maxLength = 0
        
        let sArr = Array(s)
        
        for end in 0 ..< sArr.count {
            dict[sArr[end]] = dict[sArr[end], default: 0] + 1
            maxCount = max(maxCount, dict[sArr[end]]!)
            while end - start + 1 - maxCount > k {
                dict[sArr[start]] = dict[sArr[start]]! - 1
                start += 1
            }
            maxLength = max(maxLength, end - start + 1)
        }
        return maxLength
    }
}

let solution = Solution()
var result = solution.characterReplacement("ABAB", 2)
print(result == 4)

result = solution.characterReplacement("AABABBA", 1)
print(result == 4)

result = solution.characterReplacement("KRSCDCSONAJNHLBMDQGIFCPEKPOHQIHLTDIQGEKLRLCQNBOHNDQGHJPNDQPERNFSSSRDEQLFPCCCARFMDLHADJADAGNNSBNCJQOF", 4)
print(result == 7)
