//https://leetcode.com/problems/permutation-in-string/
// 510: TLE
class Solution1 {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var start = 0
        var end = 0
        let s1 = [Character](s1)
        let s2 = [Character](s2)
        var memo = [Character:Int]()
        for c1 in s1 {
            memo[c1, default: 0] += 1
        }
        let memoCopy = memo
        while start <= s2.count - s1.count {
            end = start
            while end >= start && end <= (start+s1.count) {
                if memo[s2[end]] == nil || memo[s2[end]] == 0 {
                    if memo[s2[end]] == nil { print(s2[end]) }
                    memo = memoCopy
                    break
                } else {
                    memo[s2[end]] = memo[s2[end]]! - 1 == 0 ? nil : memo[s2[end]]! - 1
                    end += 1
                    if memo.isEmpty { return true }
                }
            }
            start += 1
        }
        return memo.isEmpty
    }
}

// ref: https://leetcode.com/problems/permutation-in-string/discuss/2140485/Swift-or-Simple-Sliding-Windoe

class Solution2 {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        guard s1.count <= s2.count else { return false }
        let s1 = Array(s1), s2 = Array(s2)
        let freq1 = s1.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        var freq2 = s2[0..<s1.count].reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        
        // check if the count are the same
        func checkMatch() -> Bool {
            for key in freq1.keys where freq1[key]! != freq2[key, default:0] {
                return false
            }
            return true
        }
        
        for i in 0 ..< s2.count - s1.count where !checkMatch() {
            freq2[s2[i]]! -= 1
            freq2[s2[i + s1.count], default: 0] += 1
        }
        
        return checkMatch()
    }
}

// ref: (java) https://leetcode.com/problems/permutation-in-string/discuss/102588/Java-Solution-Sliding-Window
// 510 convert java to swift
//Runtime: 16 ms, faster than 93.89% of Swift online submissions for Permutation in String.
//Memory Usage: 14.4 MB, less than 67.56% of Swift online submissions for Permutation in String.
class Solution3 {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let len1 = s1.count, len2 = s2.count
        let s1 = [Character](s1), s2 = [Character](s2)
        if len1 > len2 { return false }

        var countArr = Array(repeating: 0, count: 26)
        for i in 0 ..< len1 {
            countArr[Int(s1[i].asciiValue!) - 97] += 1
            countArr[Int(s2[i].asciiValue!) - 97] -= 1
        }

        if allZero(countArr) { return true }

        for i in len1 ..< len2 {
            countArr[Int(s2[i].asciiValue!) - 97] -= 1
            countArr[Int(s2[i-len1].asciiValue!) - 97] += 1
            if allZero(countArr) { return true }
        }
        return false;
    }

    func allZero(_ countArr: [Int]) -> Bool {
        for c in countArr {
            if c != 0 { return false }
        }
        return true
    }
}

let case1 = Solution().checkInclusion("ab", "eidbaooo")
print(case1 == true)

let case2 = Solution().checkInclusion("ab", "eidboaoo")
print(case2 == false)

let case3 = Solution().checkInclusion("adc", "dcda")
print(case3 == true)
