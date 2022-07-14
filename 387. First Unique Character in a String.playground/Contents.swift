//https://leetcode.com/problems/first-unique-character-in-a-string/
//Runtime: 88 ms, faster than 83.97% of Swift online submissions for First Unique Character in a String.
//Memory Usage: 15.3 MB, less than 5.98% of Swift online submissions for First Unique Character in a String.
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        let characters = [Character](s)
        var memo = [Character: Int]()
        
        for (idx, chara) in characters.enumerated() {
            if memo[chara] == nil {
                memo[chara] = idx
            } else {
                memo[chara] = Int.max
            }
        }
        let sorted = memo.sorted{$0.value < $1.value}
        return sorted.first!.value == Int.max ? -1 : sorted.first!.value
    }
}

let solution = Solution()
var result = solution.firstUniqChar("leetcode")
print(result == 0)

result = solution.firstUniqChar("loveleetcode")
print(result == 2)

result = solution.firstUniqChar("aabb")
print(result == -1)
