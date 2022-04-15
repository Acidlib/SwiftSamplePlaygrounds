//https://leetcode.com/problems/minimum-window-substring/
//m == s.length
//n == t.length
//1 <= m, n <= 105
//s and t consist of uppercase and lowercase English letters.
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        var needMap = [Character:Int]()
        for char in s {
            needMap[char] = 0
        }
        for char in t {
            needMap[char] = needMap[char, default: 0] + 1
        }
        
        var start = 0
        var end = 0
        var minLength = Int.max
        var minStart = 0
        var missing = t.count
        let s = Array(s)
        
        while (end < s.count) {
            let current = s[end]
            if(needMap[current]! > 0) {
                missing -= 1
            }
            needMap[current] = needMap[current]! - 1
            
            while (missing == 0) {
                // missing == 0,
                // record the possible result
                if (end - start + 1 < minLength) {
                    minLength =  end - start + 1
                    minStart = start
                }

                // Check previous increment head
                // if needMap head is > 0 => missing + 1
                // it will escape
                let head = s[start]
                if (needMap[head]! >= 0) {
                    missing += 1
                }
                
                // increment start
                // thus add +1 back to needMap
                needMap[head] = needMap[head]! + 1
                start += 1
            }
            end += 1
        }
        
        return minLength == Int.max ? "" : String(s[minStart..<minStart + minLength])
        
    }
}

let solution = Solution()
var result = solution.minWindow("ADOBECODEBANC", "ABC")
print(result == "BANC")

result = solution.minWindow("a", "a")
print(result == "a")

result = solution.minWindow("a", "aa")
print(result == "")
