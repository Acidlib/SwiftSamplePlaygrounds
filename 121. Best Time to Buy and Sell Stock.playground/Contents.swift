//https://leetcode.com/problems/best-time-to-buy-and-sell-stock/submissions/
import Foundation
//Runtime: 822 ms, faster than 95.13% of Swift online submissions for Best Time to Buy and Sell Stock.
//Memory Usage: 18 MB, less than 57.31% of Swift online submissions for Best Time to Buy and Sell Stock.
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var diff = 0
        var lm = prices.first!  // local minimum
        var lM = prices.first!  // local maximum
        for price in prices {
            if price < lm {
                lm = price
                lM = price
            } else if price > lM {
                lM = price
                // when the value is higher than localMax, get the diff first
                if diff < (lM - lm) {
                    diff = lM - lm
                }
            }
        }
        return diff
    }
}

let solution = Solution()
var answer = solution.maxProfit([7,1,5,3,6,4])
print(answer == 5)

answer = solution.maxProfit([7,6,4,3,1])
print(answer == 0)


class Solution2 {
    func maxProfit(_ prices: [Int]) -> Int {
        var lm = prices.first!
        var lM = prices.first!
        var maxDiff = 0
        for price in prices {
            if price < lm {
                lm = price
                lM = price
            } else if price > lM {
                lM = price
                maxDiff = max(maxDiff, lM - lm)
            }
        }
        return maxDiff
    }
}
