//https://leetcode.com/problems/count-number-of-texts/
//good ref: https://leetcode.com/problems/count-number-of-texts/discuss/2017753/Simple-O(N)-single-pass-solution
// some good explanations
//Runtime: 442 ms, faster than 94.76% of Python online submissions for Count Number of Texts.
//Memory Usage: 15 MB, less than 95.29% of Python online submissions for Count Number of Texts.
//class Solution(object):
//    def countTexts(_, keys):
//        dp = [1]
//        prev = None
//        for key in keys:
//            keep = 1 if key != prev else 3 + (key in '79')
//            del dp[:-keep]
//            dp.append(sum(dp) % 1000000007)
//            prev = key
//        return dp[-1]


//Runtime: 256 ms, faster than 40.00% of Swift online submissions for Count Number of Texts.
//Memory Usage: 16.5 MB, less than 80.00% of Swift online submissions for Count Number of Texts.
class Solution {
    func countTexts(_ pressedKeys: String) -> Int {
        let keys = [Character](pressedKeys)
        var prev: Character?
        var dp = [1]
        for key in keys {
            let sumCount = key != prev ? 1 : (key == "7" || key == "9") ? 4 : 3
            dp = dp.suffix(sumCount)
            dp.append(dp.reduce(0, +) % 1000000007)
            prev = key
        }
        return dp.last!
    }
}

let solution = Solution()
var answer = solution.countTexts("22233")
print(answer == 8)

answer = solution.countTexts("222222222222222222222222222222222222")
print(answer == 82876089)
