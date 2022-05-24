//https://leetcode.com/problems/top-k-frequent-elements/
//
//Runtime: 83 ms, faster than 62.24% of Swift online submissions for Top K Frequent Elements.
//Memory Usage: 15.8 MB, less than 63.44% of Swift online submissions for Top K Frequent Elements.
//Runtime: 144 ms, faster than 9.67% of Swift online submissions for Top K Frequent Elements.
//Memory Usage: 15.9 MB, less than 32.78% of Swift online submissions for Top K Frequent Elements.
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dic = [Int: Int]()
        for i in nums {
            dic[i, default: 0] += 1
        }
        return Array(dic.sorted { $0.1 > $1.1 }.map{$0.0}.prefix(k))
    }
}

let solution = Solution()
solution.topKFrequent([1,1,1,2,2,3], 2)

