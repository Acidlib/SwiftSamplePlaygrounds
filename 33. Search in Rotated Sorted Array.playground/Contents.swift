//            lb                         ub
//            |------------0-------------|
//            1.  T  ^                          ====> Sorted    lb += 1
//            4.               T  ^             ====> T < mid   lb += 1

//            3.                  ^ T           ====> Sorted    lb = mid + 1
//            2.     ^  T                       ====> T > mid   lb = mid + 1

//            5.       ^       T                ====> T | midV  lb = mid + 1
//            6.          T     v               ====> T | midV  lb += 1

//            1, 4, is the same case
//            2, 3, is the same case
//            we only have to check 5, 6 case
//            otherwise the rest of case are the same

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 1 else { return nums.first! == target ? 0 : -1 }
        var lb = 0
        var ub = nums.count - 1
        while lb < ub {
            let mid = lb + (ub-lb)/2
            let midV = nums[mid]
            if nums[mid] == target { return mid }
            if nums[lb] == target { return lb }
            if nums[ub] == target { return ub }
            
            if nums[ub] < nums[lb] && target < nums[ub] && midV > nums[ub] {
                lb = mid + 1
                ub -= 1
            } else if  nums[ub] < nums[lb] &&  target > nums[ub] && midV < nums[ub] {
                ub = mid - 1
                lb += 1
            } else if target < midV {
                lb += 1
                ub = mid - 1
            } else {
                lb = mid + 1
                ub -= 1
            }
        }
        return nums[lb] == target ? lb : -1
    }
}

let solution = Solution()
var answer = solution.search([4,5,6,7, 0,1,2], 0)
print(answer == 4)

answer = solution.search([4,5,6,7,0,1,2], 3)
print(answer == -1)

answer = solution.search([1], 0)
print(answer == -1)


answer = solution.search([4,5,6,7, 8, 0,1,2], 8)
print(answer == 4)

answer = solution.search([1, 3], 0)
print(answer == -1)

answer = solution.search([4,5,6,7,0,1,2], 5)
print(answer == 1)

answer = solution.search([8,9,2,3,4], 9)
print(answer == 1)

answer = solution.search([4,5,6,7,0,1,2], 1)
print(answer == 5)

answer = solution.search([3,1], 4)
print(answer == -1)

answer = solution.search([4,5,6,7,0,1,2], 5)
print(answer == 1)

answer = solution.search([8,1,2,3,4,5,6,7], 6)
print(answer == 6)
