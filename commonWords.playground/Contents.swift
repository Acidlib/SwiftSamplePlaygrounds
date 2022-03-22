class Solution {
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
            var map: [String:Int] = [:]
            let fixedWords = paragraph.split {!$0.isLetter}
            for word in fixedWords { map[word.lowercased(), default:0] += 1 }
            print(map)
            let sorted =  map.sorted {$0.value > $1.value }
            for item in sorted where banned.contains(item.key) == false  {
                return item.key
            }
            return ""
        }
}

let solution = Solution()
var result: String
//result = solution.mostCommonWord("Bob hit a ball, the hit BALL flew far after it was hit.", ["hit"])
//
//print(result)
//
//result = solution.mostCommonWord("a.", [])
//print(result)

result = solution.mostCommonWord("a, a, a, a, b,b,b,c, c", ["a"])
print(result)
