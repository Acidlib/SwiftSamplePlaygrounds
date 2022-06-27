//309. Best Time to Buy and Sell Stock with Cooldown
//https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/
//Runtime: 16 ms, faster than 57.89% of Swift online submissions for Best Time to Buy and Sell Stock with Cooldown.
//Memory Usage: 14.3 MB, less than 64.91% of Swift online submissions for Best Time to Buy and Sell Stock with Cooldown.
//ref: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/discuss/762377/Swift%3A-SIMPLE-and-SWEET-solution-with-idea-and-complexity-(100)
//  sell = max(lastBuy + price, lastSell) ==> sell vs hold
//  buy = max(lastBuy, lastRest - price)  ==> hold vs buy (max is the total inout value)
//  rest = lastSell                       ==> cooldown
// since the biggest profit while resting is from the last time we did a "sell"

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var buy = Int.min
        var sell = 0
        var rest = 0

        for price in prices {
            // print("(1) price:\(price), sell: \(sell), buy:\(buy), rest:\(rest)")
            let lastSell = sell
            sell = max(buy + price, sell)
            buy = max(buy, rest - price)
            rest = lastSell
            // print("(2) price:\(price), sell: \(sell), buy:\(buy), rest:\(rest)")
        }
        return max(sell, rest)
    }
}

//for the first round, the buy is a negative value => sell = 0
//(1) price:1, sell: 0, buy:-9223372036854775808, rest:0
//(2) price:1, sell: 0, buy:-1, rest:0

//(1) price:2, sell: 0, buy:-1, rest:0
//(2) price:2, sell: 1, buy:-1, rest:0

//(1) price:3, sell: 1, buy:-1, rest:0
//(2) price:3, sell: 2, buy:-1, rest:1

//(1) price:0, sell: 2, buy:-1, rest:1
//(2) price:0, sell: 2, buy:1, rest:2

//(1) price:2, sell: 2, buy:1, rest:2
//(2) price:2, sell: 3, buy:1, rest:2

// =====================================================================================================
//hold -----do nothing----->hold                /// no change (hold)        (1)
//hold -----sell----->notHold_cooldown          /// Hold -- sell            (3) notHold_cooldown
//notHold -----do nothing -----> notHold        /// no change (not hold)    (2)
//notHold -----buy-----> hold                   /// not hold -- (hold)      (1)
//notHold_cooldown -----do nothing----->notHold /// no change (not hold)    (2)
// Python: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/discuss/75942/4-line-Python-solution-52-ms
//def maxProfit(self, prices):
//    notHold, notHold_cooldown, hold = 0, float('-inf'), float('-inf')
//    for p in prices:
//        hold, notHold, notHold_cooldown = max(hold, notHold - p), max(notHold, notHold_cooldown), hold + p
//    return max(notHold, notHold_cooldown)


let solution = Solution()
var result = solution.maxProfit([1,2,3,0,2])
print(result == 3)

result = solution.maxProfit([1])
print(result == 0)
