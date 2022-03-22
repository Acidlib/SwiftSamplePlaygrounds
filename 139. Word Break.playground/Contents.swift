//https://leetcode.com/problems/word-break/

// Original:
//Runtime: 207 ms, faster than 29.15% of Swift online submissions for Word Break.
//Memory Usage: 14.2 MB, less than 93.36% of Swift online
//Runtime: 104 ms, faster than 40.96% of Swift online submissions for Word Break.
//Memory Usage: 14.6 MB, less than 54.24% of Swift online submissions for Word Break.

// To Speed up: Line 28
// max(0, end-maxCount) to speed up the iteration
// Runtime: 7 ms, faster than 95.20% of Swift online submissions for Word Break.
// Memory Usage: 14.8 MB, less than 16.97% of Swift online submissions for Word Break.
// for start in max(0, end-maxCount) ..< end {
    
class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        guard wordDict.count > 0 else { return false }
        let newWordDict = Set(wordDict)
        let maxCount = wordDict.reduce(0) { max($0, $1.count)}
        let strArray = Array(s)
        //print(strArray)
        var dpArray = [Bool](repeating: false, count: s.count + 1)
        dpArray[0] = true
        for end in 1...s.count {
            // max(0, end-maxCount) to speed up the iteration
            // Runtime: 7 ms, faster than 95.20% of Swift online submissions for Word Break.
            // Memory Usage: 14.8 MB, less than 16.97% of Swift online submissions for Word Break.
            for start in max(0, end-maxCount) ..< end {
                //print("\(start):\(end) | \(dpArray.map{$0 == true ? 1 : 0})")
                if dpArray[start] && newWordDict.contains(String(Array(strArray[start..<end]))) {
                    //print(String(Array(strArray[start..<end])))
                    //print("\(start):\(end) > \(dpArray.map{$0 == true ? 1 : 0})")
                    dpArray[end] = true
                    //print("\(start):\(end) | \(dpArray.map{$0 == true ? 1 : 0})")
                    break;
                }
            }
        }
        return dpArray.last!
    }
}

////https://leetcode.com/problems/word-break/discuss/528869/Swift-24ms-with-explanations
////Runtime: 4 ms, faster than 99.63% of Swift online submissions for Word Break.
////Memory Usage: 15 MB, less than 12.92% of Swift online submissions for Word Break.
//class Solution2 {
//    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
//
//        /* go thought wordDict, get the max length of word in the dict.
//        when we try each combination later, we use this length instead of array.count
//        this is optional, In the case we don't get max length, the runtime is 70ms,
//        using maxLen will cut the runTime to 24 ms */
//        var maxLen = 0
//        for word in wordDict {
//            maxLen = max(maxLen, word.count)
//        }
//
//        // turn wordDict form Array to Set, because search in Array takes O(n) time
//        // but Set takes only O(1) time
//        let set = Set(wordDict)
//
//        // leftover will be used as a queue to collect the substring after remove
//        // the word in wordDict
//        var leftover = [Int]()
//        leftover.append(0)
//
//        /* history to record substring that tried before.
//        the string in set will equal to current substring + string value of
//        the distance to the end of string. This will avoid misrecording for the
//        test case such as "leetleetcode", where first "leet" will be recorded and
//        second "leet" won't able to pass the history check because history already
//        contains "leet". So we write them as "leet8" for first "leet", "leet4" for
//        second "leet" to the history. */
//        var history = Set<String>()
//
//        let array = Array(s)
//
//        /* start form first index, append one more char to it each time and check if
//        wordDict contains that word. In the case we can't find match, return false
//        In the case we find match, then check if it is already in history to avoid
//        endless loop */
//        while !leftover.isEmpty {
//            let startIndex = leftover.popLast()!
//            //let array = Array(nextSub)
//            var cur: String = ""
//
//            // only loop for nextLen times, which is the min between
//            // the max length of word in wordDict and array length
//            let nextLen = min(maxLen, array.count - startIndex)
//
//            for i in 0..<nextLen {
//                let nextChar = array[startIndex + i]
//                cur.append(nextChar)
//
//                if set.contains(cur) {
//                    if cur.count == array.count - startIndex {
//                        // the last word was found
//                        return true
//                    }
//
//                    // there are remainings, keep loop
//                    let distanceToEnd = array.count - startIndex - cur.count
//                    let record = cur + String(distanceToEnd)
//                    if !history.contains(record) {
//                        let possiableStartIndex = startIndex + i + 1
//                        print(array[startIndex + i + 1])
//                        leftover.append(possiableStartIndex)
//                        history.insert(record)
//                    }
//                }
//            }
//        }
//
//        return false
//    }
//}
                                                                    
                                                                    
// ------------------------------------------------------------------------------

let solution = Solution()
var answer = solution.wordBreak("leetcode", ["leet","code"])
print(answer == true)

answer = solution.wordBreak("applepenapple", ["apple","pen"])
print(answer == true)

answer = solution.wordBreak("catsandog", ["cats","dog","sand","and","cat"])
print(answer == false)

answer = solution.wordBreak("applepenapplecake", ["apple","pen", "applecake"])
print(answer == true)

answer = solution.wordBreak("bb", ["a","b","bbb","bbbb"])
print(answer == true)

//["l", "e", "e", "t", "c", "o", "d", "e"]
//0:1 | [1, 0, 0, 0, 0, 0, 0, 0, 0]
//0:2 | [1, 0, 0, 0, 0, 0, 0, 0, 0]
//1:2 | [1, 0, 0, 0, 0, 0, 0, 0, 0]
//0:3 | [1, 0, 0, 0, 0, 0, 0, 0, 0]
//1:3 | [1, 0, 0, 0, 0, 0, 0, 0, 0]
//2:3 | [1, 0, 0, 0, 0, 0, 0, 0, 0]
//0:4 | [1, 0, 0, 0, 0, 0, 0, 0, 0]
//leet
//0:4 > [1, 0, 0, 0, 0, 0, 0, 0, 0]
//0:4 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//0:5 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//1:5 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//2:5 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//3:5 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//4:5 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//0:6 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//1:6 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//2:6 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//3:6 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//4:6 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//5:6 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//0:7 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//1:7 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//2:7 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//3:7 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//4:7 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//5:7 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//6:7 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//0:8 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//1:8 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//2:8 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//3:8 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//4:8 | [1, 0, 0, 0, 1, 0, 0, 0, 0]
//code
//4:8 > [1, 0, 0, 0, 1, 0, 0, 0, 0]
//4:8 | [1, 0, 0, 0, 1, 0, 0, 0, 1]
//true
//["a", "p", "p", "l", "e", "p", "e", "n", "a", "p", "p", "l", "e"]
//0:1 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:2 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//1:2 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:3 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//1:3 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//2:3 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:4 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//1:4 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//2:4 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//3:4 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:5 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//apple
//0:5 > [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:5 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//0:6 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//1:6 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//2:6 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//3:6 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//4:6 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//5:6 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//0:7 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//1:7 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//2:7 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//3:7 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//4:7 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//5:7 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//6:7 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//0:8 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//1:8 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//2:8 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//3:8 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//4:8 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//5:8 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//pen
//5:8 > [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
//5:8 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//0:9 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//1:9 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//2:9 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//3:9 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//4:9 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//5:9 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//6:9 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//7:9 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//8:9 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//0:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//1:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//2:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//3:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//4:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//5:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//6:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//7:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//8:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//9:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//0:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//1:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//2:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//3:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//4:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//5:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//6:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//7:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//8:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//9:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//10:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//0:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//1:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//2:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//3:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//4:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//5:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//6:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//7:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//8:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//9:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//10:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//11:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//0:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//1:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//2:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//3:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//4:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//5:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//6:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//7:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//8:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//apple
//8:13 > [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
//8:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1]
//true
//["c", "a", "t", "s", "a", "n", "d", "o", "g"]
//0:1 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:2 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//1:2 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:3 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//cat
//0:3 > [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:3 | [1, 0, 0, 1, 0, 0, 0, 0, 0, 0]
//0:4 | [1, 0, 0, 1, 0, 0, 0, 0, 0, 0]
//cats
//0:4 > [1, 0, 0, 1, 0, 0, 0, 0, 0, 0]
//0:4 | [1, 0, 0, 1, 1, 0, 0, 0, 0, 0]
//0:5 | [1, 0, 0, 1, 1, 0, 0, 0, 0, 0]
//1:5 | [1, 0, 0, 1, 1, 0, 0, 0, 0, 0]
//2:5 | [1, 0, 0, 1, 1, 0, 0, 0, 0, 0]
//3:5 | [1, 0, 0, 1, 1, 0, 0, 0, 0, 0]
//4:5 | [1, 0, 0, 1, 1, 0, 0, 0, 0, 0]
//0:6 | [1, 0, 0, 1, 1, 0, 0, 0, 0, 0]
//1:6 | [1, 0, 0, 1, 1, 0, 0, 0, 0, 0]
//2:6 | [1, 0, 0, 1, 1, 0, 0, 0, 0, 0]
//3:6 | [1, 0, 0, 1, 1, 0, 0, 0, 0, 0]
//4:6 | [1, 0, 0, 1, 1, 0, 0, 0, 0, 0]
//5:6 | [1, 0, 0, 1, 1, 0, 0, 0, 0, 0]
//0:7 | [1, 0, 0, 1, 1, 0, 0, 0, 0, 0]
//1:7 | [1, 0, 0, 1, 1, 0, 0, 0, 0, 0]
//2:7 | [1, 0, 0, 1, 1, 0, 0, 0, 0, 0]
//3:7 | [1, 0, 0, 1, 1, 0, 0, 0, 0, 0]
//sand
//3:7 > [1, 0, 0, 1, 1, 0, 0, 0, 0, 0]
//3:7 | [1, 0, 0, 1, 1, 0, 0, 1, 0, 0]
//0:8 | [1, 0, 0, 1, 1, 0, 0, 1, 0, 0]
//1:8 | [1, 0, 0, 1, 1, 0, 0, 1, 0, 0]
//2:8 | [1, 0, 0, 1, 1, 0, 0, 1, 0, 0]
//3:8 | [1, 0, 0, 1, 1, 0, 0, 1, 0, 0]
//4:8 | [1, 0, 0, 1, 1, 0, 0, 1, 0, 0]
//5:8 | [1, 0, 0, 1, 1, 0, 0, 1, 0, 0]
//6:8 | [1, 0, 0, 1, 1, 0, 0, 1, 0, 0]
//7:8 | [1, 0, 0, 1, 1, 0, 0, 1, 0, 0]
//0:9 | [1, 0, 0, 1, 1, 0, 0, 1, 0, 0]
//1:9 | [1, 0, 0, 1, 1, 0, 0, 1, 0, 0]
//2:9 | [1, 0, 0, 1, 1, 0, 0, 1, 0, 0]
//3:9 | [1, 0, 0, 1, 1, 0, 0, 1, 0, 0]
//4:9 | [1, 0, 0, 1, 1, 0, 0, 1, 0, 0]
//5:9 | [1, 0, 0, 1, 1, 0, 0, 1, 0, 0]
//6:9 | [1, 0, 0, 1, 1, 0, 0, 1, 0, 0]
//7:9 | [1, 0, 0, 1, 1, 0, 0, 1, 0, 0]
//8:9 | [1, 0, 0, 1, 1, 0, 0, 1, 0, 0]
//true
//["a", "p", "p", "l", "e", "p", "e", "n", "a", "p", "p", "l", "e", "c", "a", "k", "e"]
//0:1 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:2 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//1:2 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:3 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//1:3 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//2:3 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:4 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//1:4 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//2:4 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//3:4 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:5 | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//apple
//0:5 > [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:5 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:6 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//1:6 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//2:6 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//3:6 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//4:6 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//5:6 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:7 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//1:7 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//2:7 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//3:7 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//4:7 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//5:7 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//6:7 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:8 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//1:8 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//2:8 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//3:8 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//4:8 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//5:8 | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//pen
//5:8 > [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//5:8 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:9 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//1:9 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//2:9 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//3:9 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//4:9 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//5:9 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//6:9 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//7:9 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//8:9 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//1:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//2:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//3:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//4:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//5:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//6:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//7:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//8:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//9:10 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//1:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//2:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//3:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//4:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//5:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//6:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//7:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//8:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//9:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//10:11 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//1:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//2:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//3:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//4:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//5:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//6:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//7:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//8:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//9:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//10:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//11:12 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//0:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//1:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//2:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//3:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//4:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//5:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//6:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//7:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//8:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//apple
//8:13 > [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//8:13 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//0:14 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//1:14 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//2:14 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//3:14 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//4:14 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//5:14 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//6:14 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//7:14 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//8:14 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//9:14 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//10:14 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//11:14 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//12:14 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//13:14 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//0:15 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//1:15 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//2:15 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//3:15 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//4:15 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//5:15 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//6:15 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//7:15 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//8:15 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//9:15 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//10:15 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//11:15 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//12:15 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//13:15 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//14:15 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//0:16 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//1:16 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//2:16 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//3:16 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//4:16 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//5:16 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//6:16 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//7:16 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//8:16 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//9:16 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//10:16 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//11:16 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//12:16 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//13:16 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//14:16 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//15:16 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//0:17 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//1:17 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//2:17 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//3:17 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//4:17 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//5:17 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//6:17 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//7:17 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//8:17 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//applecake
//8:17 > [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]
//8:17 | [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1]
//true
