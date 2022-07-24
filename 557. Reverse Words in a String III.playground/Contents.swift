//https://leetcode.com/problems/reverse-words-in-a-string-iii/
///510
//Runtime: 1324 ms, faster than 5.19% of Swift online submissions for Reverse Words in a String III.
//Memory Usage: 14.9 MB, less than 85.47% of Swift online submissions for Reverse Words in a String III.
class Solution1 {
    func reverseWords1(_ s: String) -> String {
        var stack = [Character]()
        var result = ""
        for c in s {
            if c != " " {
                stack.append(c)
            } else {
                var newSub = [Character]()
                while stack.count > 0 {
                    let elm = stack.last!
                    stack = stack.dropLast()
                    newSub.append(elm)
                }
                result = result + Array(newSub) + " "
            }
        }
        var newSub = [Character]()
        while stack.count > 0 {
            let elm = stack.last!
            stack = stack.dropLast()
            newSub.append(elm)
        }
        result = result + Array(newSub)
        return result
    }
}

let case1 = Solution().reverseWords( "Let's take LeetCode contest")
print(case1 ==  "s'teL ekat edoCteeL tsetnoc")


//510 optimize:
//Runtime: 340 ms, faster than 26.99% of Swift online submissions for Reverse Words in a String III.
//Memory Usage: 14.7 MB, less than 94.81% of Swift online submissions for Reverse Words in a String III.
//Runtime: 373 ms, faster than 17.30% of Swift online submissions for Reverse Words in a String III.
//Memory Usage: 14.7 MB, less than 94.81% of Swift online submissions for Reverse Words in a String III.
class Solution2 {
    func reverseWords(_ s: String) -> String {
        var stack = [Character]()
        var result = ""
        var tempSubStr = ""
        for c in s {
            if c != " " {
                tempSubStr.insert(c, at: tempSubStr.startIndex)
            } else {
                result = result + tempSubStr + " "
                tempSubStr = ""
            }
        }
        result = result + tempSubStr
        return result
    }
}

// ref: https://leetcode.com/problems/reverse-words-in-a-string-iii/discuss/398755/swift-(one-line)
//Runtime: 282 ms, faster than 51.56% of Swift online submissions for Reverse Words in a String III.
//Memory Usage: 15 MB, less than 71.63% of Swift online submissions for Reverse Words in a String III.
import Foundation
class Solution {
    func reverseWords(_ s: String) -> String {
        return s.components(separatedBy: " ").map{String($0.reversed())}.joined(separator: " ")
    }
}
