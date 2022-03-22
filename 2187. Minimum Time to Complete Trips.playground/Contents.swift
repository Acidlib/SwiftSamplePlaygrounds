
//https://leetcode.com/contest/weekly-contest-282/problems/minimum-time-to-complete-trips/
//1 <= time.length <= 105
//1 <= time[i], totalTrips <= 107
import Foundation

class Solution {
    func minimumTime(_ time: [Int], _ totalTrips: Int) -> Int {
        
        func sumBeyondTotalTrips(_ guess: Int, _ time: [Int]) -> Bool {
            return time.reduce(0) { (num1, num2) -> Int in
                num1 + (guess/num2)
            } >= totalTrips
        }
        
        var up: Int = time.max()! * totalTrips
        var lb = 1
        while lb < up {
            let guess = (up - lb) / 2 + lb
            if (sumBeyondTotalTrips(guess, time)) {
                up = guess
            } else {
                lb = guess + 1
                
            }
        }

        return lb
    }
}


let solution = Solution()
var answer = solution.minimumTime([1,2,3], 5)
print(answer)
print(answer == 3)

answer = solution.minimumTime([2], 1)
print(answer == 2)
