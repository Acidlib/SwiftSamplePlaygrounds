//https://leetcode.com/problems/first-bad-version/

/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class VersionControl {
    func isBadVersion(_ version: Int) -> Bool { return false }// fake
}

// 2019 answer: C++
/*
class Solution1 {
public:
    int firstBadVersion(int n) {
        int low = 0;
        int high = n;
        
        while (low < high) {
            long mid = (low/2 + high/2);
            if (!isBadVersion(mid) && isBadVersion(mid+1)) {
                return mid+1;
            } else if (!isBadVersion(mid)) {
                low = mid + 1;
            } else {
                high = mid;
            }
        }
        return low;
    }
};*/

//20220721
//Runtime: 0 ms, faster than 100.00% of Swift online submissions for First Bad Version.
//Memory Usage: 13.7 MB, less than 21.53% of Swift online submissions for First Bad Version.
//Runtime: 5 ms, faster than 37.14% of Swift online submissions for First Bad Version.
//Memory Usage: 13.6 MB, less than 61.99% of Swift online submissions for First Bad Version.
class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var lb = 0
        var ub = n
        while lb <= ub {
            let middle = lb + (ub - lb)/2
            if isBadVersion(lb) { return lb }
            if !isBadVersion(middle) {
                lb = middle + 1
            } else {
                ub = middle - 1
            }
        }
        return lb
        
    }
}
