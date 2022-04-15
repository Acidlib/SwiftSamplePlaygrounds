//https://leetcode.com/problems/valid-anagram/
//Runtime: 23 ms, faster than 70.25% of Swift online submissions for Valid Anagram.
//Memory Usage: 16 MB, less than 30.49% of Swift online submissions for Valid Anagram.
//Runtime: 19 ms, faster than 79.52% of Swift online submissions for Valid Anagram.
//Memory Usage: 16.3 MB, less than 13.15% of Swift online submissions for Valid Anagram.
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var dictionary = [Character: Int]()
        let s = Array(s)
        let t = Array(t)
        // Point: to speed up
        // loop one time for 2 array
        for i in 0 ..< t.count {
            dictionary[s[i]] = dictionary[s[i], default: 0] + 1
            dictionary[t[i]] = dictionary[t[i], default: 0] - 1
        }
        
        for elem in dictionary.values {
            if elem != 0 {
                return false
            }
        }
        return true
    }
}

let solution = Solution()
var result = solution.isAnagram("anagram", "nagaram")
print(result == true)

result = solution.isAnagram("rat", "car")
print(result == false)


// -------------------

//Runtime: 27 ms, faster than 57.25% of Swift online submissions for Valid Anagram.
//Memory Usage: 15.5 MB, less than 40.66% of Swift online submissions for Valid Anagram.
/*
for c in Array(s) {
    dictionary[c] = dictionary[c, default: 0] + 1
}
for c in Array(t) {
    dictionary[c] = dictionary[c, default: 0] - 1
}*/


