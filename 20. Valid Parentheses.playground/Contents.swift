//https://leetcode.com/problems/valid-parentheses/
//Runtime: 6 ms, faster than 33.72% of Swift online submissions for Valid Parentheses.
//Memory Usage: 14.4 MB, less than 31.45% of Swift online submissions for Valid Parentheses.
//Runtime: 0 ms, faster than 100.00% of Swift online submissions for Valid Parentheses.
//Memory Usage: 14.5 MB, less than 31.45% of Swift online submissions for Valid Parentheses.
class Solution1 {
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

let case1 = Solution().isValid("()")
print(case1 == true)

let case2 = Solution().isValid("()[]{}")
print(case2 == true)

let case3 = Solution().isValid("(]")
print(case3 == false)

let case4 = Solution().isValid("]")
print(case4 == false)

let case5 = Solution().isValid("(])")
print(case5 == false)


// 510
// be aware of boundary condition: start with close or close at open.
//Runtime: 5 ms, faster than 52.33% of Swift online submissions for Valid Parentheses.
//Memory Usage: 14.5 MB, less than 14.34% of Swift online submissions for Valid Parentheses.
class Solution {
    func isValid(_ s: String) -> Bool {
        let characters = [Character](s)
        var stack = [Character]()
        for c in characters {
            if stack.isEmpty && (c == "}" || c == "]" || c == ")") { return false}
            if c == "(" || c == "[" || c == "{" {
                stack.append(c)
            } else {
                if let pop = stack.popLast() {
                    if (c == ")" && pop != "(") ||
                        (c == "}" && pop != "{") ||
                        (c == "]" && pop != "[")  {
                        return false
                    }
                }
            }
        }
        return stack.isEmpty
    }
}
