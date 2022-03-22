//251 / 251 test cases passed.
//Status: Accepted
//Runtime: 20 ms
//Memory Usage: 14.7 MB
//Submitted: 0 minutes ago

class Solution {
    func cellsInRange(_ s: String) -> [String] {
        let startChar = Unicode.Scalar(String(s.first!))?.value
        let endChar = Unicode.Scalar(String(s[String.Index.init(utf16Offset: 3, in: s)]))?.value
        let rowFrom =  s[String.Index.init(utf16Offset: 1, in: s)].wholeNumberValue!
        let rowTo = s[String.Index.init(utf16Offset: 4, in: s)].wholeNumberValue!
        var result = [String]()
        guard let charFrom = startChar, let charTo = endChar else { return [] }
        print(startChar, endChar, rowFrom, rowTo)
        for j in charFrom ... charTo {
            for i in rowFrom ... rowTo {
                let col = Unicode.Scalar.init(j)!
                result.append("\(col)\(i)")
            }
        }
        return result
    }
}


let solution = Solution()
var answer = solution.cellsInRange("K1:L2")
print(answer == ["K1","K2","L1","L2"])

answer = solution.cellsInRange("A1:F1")
print(answer == ["A1","B1","C1","D1","E1","F1"])

