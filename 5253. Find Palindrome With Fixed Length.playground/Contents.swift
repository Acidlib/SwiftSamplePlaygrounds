//https://leetcode.com/contest/weekly-contest-286/problems/find-palindrome-with-fixed-length/
//ref: https://leetcode.com/problems/find-palindrome-with-fixed-length/discuss/1887170/Python-Half-of-the-Palindromes
//Runtime: 1455 ms, faster than 100.00% of Swift online submissions for Find Palindrome With Fixed Length.
//Memory Usage: 22.5 MB, less than 100.00% of Swift online submissions for Find Palindrome With Fixed Length.
import Foundation
class Solution {
    func kthPalindrome(_ queries: [Int], _ intLength: Int) -> [Int] {
        let base = (pow(10, (intLength - 1)/2) as NSNumber).intValue
        var result = Array(repeating: -1, count: queries.count)
        let isOdd = intLength % 2 == 1
        for (i, q) in queries.enumerated() {
            let value = q-1+base
            var palindrome = String(value)
            for (idx, c) in [Character](String(value)).enumerated().reversed() {
                if isOdd && idx == (intLength-1)/2 { continue }
                palindrome.append(c)
            }
            result[i] = palindrome.count == intLength ? Int(palindrome)! : -1
        }
        return result
    }
}

// ------------------------------------------------------------------------------

let solution = Solution()
var answer = solution.kthPalindrome([1,2,3,4,5,90], 3)
print(answer == [101,111,121,131,141,999])

answer = solution.kthPalindrome([2,4,6], 4)
print(answer == [1111,1331,1551])

answer = solution.kthPalindrome([2,201429812,8,520498110,492711727,339882032,462074369,9,7,6], 1)
print(answer == [2,-1,8,-1,-1,-1,-1,9,7,6])

answer = solution.kthPalindrome([1,2,3,4,5,90], 3)
print(answer == [101,111,121,131,141,999])

answer = solution.kthPalindrome([2,201429812,8,520498110,492711727,339882032,462074369,9,7,6], 1)
print(answer == [2,-1,8,-1,-1,-1,-1,9,7,6])

answer = solution.kthPalindrome([449229674,501930675,40059525,908875541,9,672504016], 5)
print(answer == [-1,-1,-1,-1,10801,-1])

answer = solution.kthPalindrome([31,119983340,494857782,48,904409366,65626832,610586467], 15)
print(answer == [100000303000001,-1,-1,100000474000001,-1,756268313862657,-1])

answer = solution.kthPalindrome([510134], 10)
print(answer == [-1])
