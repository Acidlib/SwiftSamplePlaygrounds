//https://leetcode.com/problems/reverse-string/
// 510:
//Runtime: 588 ms, faster than 5.06% of Swift online submissions for Reverse String.
//Memory Usage: 18.4 MB, less than 65.03% of Swift online submissions for Reverse String.
//Next challenges:
class Solution1 {
    func reverseString(_ s: inout [Character]) {
        var count = 0
        let length = s.count
        while count < length {
            let pop = s.popLast()!
            s.insert(pop, at: count)
            count += 1
        }
    }
}

//Runtime: 208 ms, faster than 54.14% of Swift online submissions for Reverse String.
//Memory Usage: 18.7 MB, less than 17.48% of Swift online submissions for Reverse String.
class Solution {
    func reverseString(_ s: inout [Character]) {
        var head = 0
        var tail = s.count - 1
        while head < tail {
            let temp = s[head]
            s[head] = s[tail]
            s[tail] = temp

            head += 1
            tail -= 1
        }
    }
}



