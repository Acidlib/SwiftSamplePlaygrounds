//https://leetcode.com/problems/group-anagrams/submissions/
//Runtime: 109 ms, faster than 85.76% of Swift online submissions for Group Anagrams.
//Memory Usage: 16.2 MB, less than 61.71% of Swift online submissions for Group Anagrams.
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dictionary = [String: Array<String>]()
        for str in strs {
            dictionary[String(str.sorted()), default: Array<String>()].append(str)
        }
        var result = [[String]]()
        for elem in dictionary.values {
            result.append(elem)
        }
        return result
    }
}

let solution = Solution()
var result = solution.groupAnagrams(["eat","tea","tan","ate","nat","bat"])
print(result == [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]])

result = solution.groupAnagrams([""])
print(result == [[""]])

result = solution.groupAnagrams(["a"])
print(result == [["a"]])


