//https://leetcode.com/problems/intersection-of-two-arrays-ii/
//ref:https://leetcode.com/problems/intersection-of-two-arrays-ii/discuss/82257/Swift-Two-Pointers-solution-with-illustration
//Runtime: 30 ms, faster than 30.89% of Swift online submissions for Intersection of Two Arrays II.
//Memory Usage: 13.9 MB, less than 95.03% of Swift online submissions for Intersection of Two Arrays II.
//Runtime: 21 ms, faster than 72.35% of Swift online submissions for Intersection of Two Arrays II.
//Memory Usage: 14.4 MB, less than 12.53% of Swift online submissions for Intersection of Two Arrays II.
class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let n1 = nums1.sorted()
        let n2 = nums2.sorted()
        
        var i = 0, j = 0, result = [Int]()
        
        while i < n1.count && j < n2.count {
            if n1[i] == n2[j] {
                result.append(n1[i])
                i += 1
                j += 1
            } else if n1[i] > n2[j] {
                j += 1
            } else {
                i += 1
            }
        }
        return result
    }
}

let solution = Solution()
var result = solution.intersect([4,9,5], [9,4,9,8,4])
print(result == [4,9])

result = solution.intersect([1,2,2,1], [2,2])
print(result == [2,2])


