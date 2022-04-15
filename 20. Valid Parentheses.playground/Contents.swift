//https://leetcode.com/problems/valid-parentheses/
//Runtime: 6 ms, faster than 33.72% of Swift online submissions for Valid Parentheses.
//Memory Usage: 14.4 MB, less than 31.45% of Swift online submissions for Valid Parentheses.
//Runtime: 0 ms, faster than 100.00% of Swift online submissions for Valid Parentheses.
//Memory Usage: 14.5 MB, less than 31.45% of Swift online submissions for Valid Parentheses.
class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        for c in Array(s) {
            if stack.isEmpty && isCloseParenthese(c) {
                return false
            }
            if isOpenParenthese(c) {
                stack.append(c)
            }
            if isCloseParenthese(c) {
                if let prev = stack.popLast(), !isPair(prev, c) {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
    
    func isOpenParenthese(_ c: Character) -> Bool {
        return c == "{" || c == "(" || c == "["
    }
    
    func isCloseParenthese(_ c: Character) -> Bool {
        return c == "}" || c == ")" || c == "]"
    }
    
    func isPair(_ a: Character, _ b: Character) -> Bool {
        return (a == "(" && b == ")") ||
        (a == "{" && b == "}") ||
        (a == "[" && b == "]")
    }
}

let solution = Solution()
var result = solution.isValid("()")
print(result == true)

result = solution.isValid("()[]{}")
print(result == true)

result = solution.isValid("(]")
print(result == false)


