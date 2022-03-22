//### SWIFT sorted()
//Runtime: 1032 ms, faster than 100.00% of Swift online submissions for Append K Integers With Minimal Sum.
//Memory Usage: 16.3 MB, less than 100.00% of Swift online submissions for Append K Integers With Minimal Sum.


//### SELF: Quick sort
//Runtime: 4000 ms, faster than 100.00% of Swift online submissions for Append K Integers With Minimal Sum.
//Memory Usage: 19.1 MB, less than 100.00% of Swift online submissions for Append K Integers With Minimal Sum.
//03/06/2022 18:13    Accepted    4000 ms    19.1 MB    swift
//03/06/2022 18:12    Time Limit Exceeded    N/A    N/A    swift
//03/06/2022 18:12    Time Limit Exceeded    N/A    N/A    swift
//03/06/2022 18:12    Time Limit Exceeded    N/A    N/A    swift
class Solution {
    func minimalKSum(_ nums: [Int], _ k: Int) -> Int {
        // sort array
        // go through again
        var sorted = nums
        sorted = sorted.sorted()
        var sum = 0
        var count = 0
        var serialNumber = 1
        // iterate the sorted array first
        for i in 0 ..< sorted.count {
            if count == k {
                return sum
            }

            while serialNumber < sorted[i] {
                sum += serialNumber
                serialNumber += 1
                count += 1
                if count == k {
                    return sum
                }
            }
            if serialNumber <= sorted[i] {
                serialNumber += 1
            }
        }
        
        // add up the sum till reach k
        while count < k {
            sum += serialNumber
            serialNumber += 1
            count += 1
        }

        return sum
    }
    
//    func sorted(_ nums: [Int]) -> [Int] {
//        func quickSort(_ listToSort: inout [Int], _ low: Int, _ high: Int) {
//            if low >= high { return }
//
//            let pivotIndex = partition(&listToSort, low, high)
//            quickSort(&listToSort, low, pivotIndex-1)
//            quickSort(&listToSort, (pivotIndex), high)
//            return
//        }
//
//        func partition(_ listToSort: inout [Int], _ low: Int, _ high: Int) -> Int {
//            let pivot = listToSort[(low + high)/2]
//            var l = low
//            var h = high
//
//            while l <= h {
//                while listToSort[l] < pivot {l += 1}
//                while listToSort[h] > pivot {h -= 1}
//                if l <= h {
//                    listToSort.swapAt(l, h)
//                    l += 1
//                    h -= 1
//                }
//            }
//
//            return l
//        }
//
//        var listToSort = nums
//        quickSort(&listToSort, 0, nums.count-1)
//        return listToSort
//    }
}

let solution = Solution()
var answer = solution.minimalKSum([1,4,25,10,25], 2)
print(answer == 5)
print("-------------")
answer = solution.minimalKSum([5,6], 6)
print(answer == 25)
print("-------------")
answer = solution.minimalKSum([1,2,3], 3)
print(answer == 15)
print("-------------")
answer = solution.minimalKSum([53,41,90,33,84,26,50,32,63,47,66,43,29,88,71,28,83], 76)
print(answer == 3444)
print("-------------")
answer = solution.minimalKSum([96,44,99,25,61,84,88,18,19,33,60,86,52,19,32,47,35,50,94,17,29,98,22,21,72,100,40,84], 35)
print(answer == 794)
