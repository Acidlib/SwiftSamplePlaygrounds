//https://leetcode.com/problems/closest-dessert-cost/
//ref: https://leetcode.com/problems/closest-dessert-cost/discuss/1088193/Swift-solution
//Runtime: 28 ms, faster than 44.44% of Swift online submissions for Closest Dessert Cost.
//Memory Usage: 15 MB, less than 11.11% of Swift online submissions for Closest Dessert Cost.
class Solution {
    func closestCost(_ baseCosts: [Int], _ toppingCosts: [Int], _ target: Int) -> Int {
        var toppingCombos = [0: true], minCombo = baseCosts.min()!, maxCombo = baseCosts.max()! + toppingCosts.reduce(into: Int(0), { $0 += 2 * $1 })
        // toppingCombos begins with [0: true]
        // actually the bool is not being used
        for toppingCost in toppingCosts {
            let tempToppingCombos = toppingCombos.keys
            // toppingCombos will increase size after each iteration
            // print("key:\(tempToppingCombos)")
            for toppingCombo in tempToppingCombos {
                // print("1. \(toppingCombo), \(toppingCost) =>\(toppingCombo + toppingCost)")
                // print("2. \(toppingCombo), \(toppingCost) =>\(toppingCombo + toppingCost * 2)")
                toppingCombos[toppingCombo + toppingCost] = true
                toppingCombos[toppingCombo + toppingCost * 2] = true
            }
        }
        for baseCost in baseCosts {
            for toppingCombo in toppingCombos.keys {
                let combo = baseCost + toppingCombo
                if combo <= target {
                    minCombo = max(minCombo, combo)
                } else {
                    maxCombo = min(maxCombo, combo)
                }
            }
        }
        return (maxCombo - target) < (target - minCombo) ? maxCombo : minCombo
    }
}

//quesiton: [1,7], [3,4], 10
//tpcbs: [0: true]
//key:[0]
//1. 0, 3 =>3
//2. 0, 3 =>6
//key:[3, 6, 0]
//1. 3, 4 =>7
//2. 3, 4 =>11
//1. 6, 4 =>10
//2. 6, 4 =>14
//1. 0, 4 =>4
//2. 0, 4 =>8

let solution = Solution()
var answer = solution.closestCost([1,7], [3,4], 10)
print(answer == 10)
answer = solution.closestCost([2,3], [4,5,100], 18)
print(answer == 17)
answer = solution.closestCost([3,10], [2,5], 9)
print(answer == 8)
answer = solution.closestCost([10], [1], 1)
print(answer == 10)


/*
// 510:
// Wrong direction:
// *1: at least one topping, each at most 2!!!
// *2: boundary condition: abs values are equivalent
// FAILE!!
class Solution {
    func closestCost(_ baseCosts: [Int], _ toppingCosts: [Int], _ target: Int) -> Int {
        var minDiff = Int.max
        var sortedToppings = toppingCosts.sorted(by: <)
            sortedToppings.insert(0, at: 0)
        for i in 0 ..< baseCosts.count {
            let newTarget = target - baseCosts[i]
            var localMin = newTarget
            if newTarget < 0 {
                minDiff = abs(minDiff) == abs(localMin) ? max(minDiff, localMin) : abs(minDiff) < abs(localMin) ? minDiff : localMin
                continue
            }
            
            for j in 0 ..< sortedToppings.count {
                for k in j+1 ..< sortedToppings.count {
                    let topping1 = sortedToppings[j]
                    let topping2 = sortedToppings[k]
                    let comb1 = newTarget - topping1 - topping2
                    let comb2 = newTarget - topping1 - topping2 * 2
                    let comb3 = newTarget - topping1 * 2 - topping2
                    let comb4 = newTarget - topping1 * 2 - topping2 * 2
                    // print("\(i), base:\(baseCosts[i]) localMin: \(localMin) newTarget: \(newTarget) topping1:\(topping1) topping2: \(topping2)")
                    // print("\(comb1), \(comb2), \(comb3), \(comb4)")
                    let temp1 = abs(comb1) < abs(comb2) ? comb1 : comb2
                    let temp2 = abs(comb3) < abs(comb4) ? comb3 : comb4
                    let temp = abs(temp1) < abs(temp2) ? temp1 : temp2
                    localMin = abs(temp) < abs(localMin) ? temp : localMin
                }
            }
            // print("local: \(localMin) diff: \(minDiff)")
            minDiff = abs(minDiff) < abs(localMin) ? minDiff : localMin
            // print(" result: \(target-minDiff) \(minDiff)")
        }
        // print(minDiff, target - minDiff)
        return target - minDiff
    }
}
*/
