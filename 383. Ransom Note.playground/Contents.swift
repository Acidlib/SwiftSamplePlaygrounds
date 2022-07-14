//https://leetcode.com/problems/ransom-note/
//Runtime: 406 ms, faster than 5.12% of Swift online submissions for Ransom Note.
//Memory Usage: 14.9 MB, less than 18.87% of Swift online submissions for Ransom Note.
//Runtime: 247 ms, faster than 5.66% of Swift online submissions for Ransom Note.
//Memory Usage: 15.2 MB, less than 7.55% of Swift online submissions for Ransom Note.
class Solution1 {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        let target = [Character](ransomNote).sorted()
        let provider = [Character](magazine).sorted()
        print(target, provider)
        var index = 0
        for i in 0 ..< provider.count {
            if provider[i] == target[index] {
                index += 1
            }
            if index >= target.count {
                return true
            }
        }
        return false
        
    }
}

//Runtime: 71 ms, faster than 34.50% of Swift online submissions for Ransom Note.
//Memory Usage: 14.9 MB, less than 18.87% of Swift online submissions for Ransom Note.
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        let target = [Character](ransomNote)
        var provider = [Character](magazine)
        for chara in target {
            if let idx = provider.firstIndex(of: chara) {
                provider.remove(at: idx)
            } else {
                return false
            }
        }
        return true
    }
}


let solution = Solution()
var result = solution.canConstruct("a", "b")
print(result == false)

result = solution.canConstruct("aa", "ab")
print(result == false)

result = solution.canConstruct("aa", "aab")
print(result == true)

result = solution.canConstruct("aab", "baa")
print(result == true)
