//https://leetcode.com/problems/merge-sorted-array/
//Runtime: 11 ms, faster than 61.94% of Swift online submissions for Merge Sorted Array.
//Memory Usage: 14.4 MB, less than 3.28% of Swift online submissions for Merge Sorted Array.
class Solution1 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var merged = [Int]()
        var i = 0, j = 0
        while i < m, j < n {
            if nums1[i] <= nums2[j] {
                merged.append(nums1[i])
                i += 1
            } else {
                merged.append(nums2[j])
                j += 1
            }
        }
        for ii in i ..< m {
            merged.append(nums1[ii])
        }
        
        for jj in j ..< n {
            merged.append(nums2[jj])
        }
        
        nums1 = merged
    }
}

let solution = Solution()
var result = [1,2,3,0,0,0]
solution.merge(&result, 3, [2,5,6], 3)
print(result == [1,2,2,3,5,6])

result = [-1,0,0,3,3,3,0,0,0]
solution.merge(&result, 6, [1,2,2], 3)
print(result == [-1,0,0,1,2,2,3,3,3])

result = [0]
solution.merge(&result, 0, [1], 1)
print(result == [1])

result = [1]
solution.merge(&result, 1, [], 0)
print(result == [1])

// 510: 20220708 failed
// failed case:
// 1. ([0], 0, [1], 1)
// 2. ([1], 0, [], 0)

//Runtime: 16 ms, faster than 25.67% of Swift online submissions for Merge Sorted Array.
//Memory Usage: 14.1 MB, less than 48.36% of Swift online submissions for Merge Sorted Array.
//Runtime: 10 ms, faster than 68.81% of Swift online submissions for Merge Sorted Array.
//Memory Usage: 13.8 MB, less than 97.46% of Swift online submissions for Merge Sorted Array.
//Runtime: 9 ms, faster than 72.99% of Swift online submissions for Merge Sorted Array.
//Memory Usage: 14 MB, less than 79.70% of Swift online submissions for Merge Sorted Array.
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = 0, j = 0
        while i < m + n, j < n, (i - j) < m {
            if nums1[i] > nums2[j] {
                nums1.insert(nums2[j], at: i)
                j += 1
            }
            i += 1
        }
        // need more ori nums1
        if (i-j) < m {
            nums1 = Array(nums1[0..<m+n])
        } else {
            nums1 = Array(nums1[0..<i])
        }

        // need more nums2
        for jj in j ..< n {
            nums1.append(nums2[jj])
        }
    }
}

