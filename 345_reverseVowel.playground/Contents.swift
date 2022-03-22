class Solution {
    func reverseVowels(_ s: String) -> String {
        let vowels = ["a","e","i","o","u","A","E","I","O","U"]
        var leftIndex = 0
        var rightIndex = s.count - 1
        var sArr = Array(s)
        while leftIndex < rightIndex {
            if sArr[leftIndex].isVowel {
                leftIndex += 1
                continue
            }
            if sArr[rightIndex].isVowel {
                rightIndex -= 1
                continue
            }
            sArr.swapAt(leftIndex, rightIndex)
            leftIndex += 1
            rightIndex -= 1
        }
        return String(sArr)
    }
}

extension Character {
    var isVowel: Bool {
        switch self {
        case "a", "e", "i", "o", "u":
            return true
        case "A", "E", "I", "O", "U":
            return true
        default:
            return false
        }
    }
 }



let solution = Solution()
var answer = solution.reverseVowels("hello")
print(answer == "holle")

answer = solution.reverseVowels("leetcode")
print(answer == "leotcede")
