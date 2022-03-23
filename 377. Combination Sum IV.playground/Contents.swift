// https://leetcode.com/problems/combination-sum-iv/
//Runtime: 0 ms, faster than 100.00% of Swift online submissions for Combination Sum IV.
//Memory Usage: 14.3 MB, less than 28.13% of Swift online submissions for Combination Sum IV.
//Runtime: 4 ms, faster than 73.44% of Swift online submissions for Combination Sum IV.
//Memory Usage: 14.1 MB, less than 67.19% of Swift online submissions for Combination Sum IV.
class Solution {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted().filter{ $0 <= target }
        // Because of overflow, must use double
        // Alternative: var dpArray = Array<Double>(repeating: 0, count: target + 1)
        var dpArray = Array(repeating: Double(0), count: target + 1)
        dpArray[0] = 1
        for i in 1 ... target {
            for n in nums {
                if n <= i {
                    dpArray[i] += dpArray[i - n]
                } else {
                    break
                }
            }
        }
        return Int(dpArray[target])
    }
}

// ------------------------------------------------------------------------------

let solution = Solution()
var answer = solution.combinationSum4([1,2,3], 4)

print(answer == 7)

answer = solution.combinationSum4([9], 3)
print(answer == 0)

answer = solution.combinationSum4([3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25], 1)
print(answer == 0)

answer = solution.combinationSum4([3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25], 10)
print(answer == 9)

answer = solution.combinationSum4([10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,350,360,370,380,390,400,410,420,430,440,450,460,470,480,490,500,510,520,530,540,550,560,570,580,590,600,610,620,630,640,650,660,670,680,690,700,710,720,730,740,750,760,770,780,790,800,810,820,830,840,850,860,870,880,890,900,910,920,930,940,950,960,970,980,990,111], 999)

print(answer == 1)
