//https://leetcode.com/problems/design-add-and-search-words-data-structure/
class TrieNode {
    var isEnd = false
    var children = [Character : TrieNode]()
}

//https://leetcode.com/problems/design-add-and-search-words-data-structure/discuss/735094/Swift%3A-Trie-%2B-DFS-with-complexity-analysis
//    For add():
//    Time: O(n), Space: O(n)
//
//    For search():
//
//    When there are no wildcards:
//    Time: O(n), Space: O(n) because of the recursive calls
//    Where there are wildcards:
//    The absolute worst case we can have 26 children at each node, traversing through all nodes with DFS will take 26^n (n nodes, each nodes have 26 children/characters). 26^n is technically 2^n. Therefore,
//    Time: O(2^n), Space: O(n) because we only have at max n calls on the stack at any given time.
//    However, one can use tighter bounds and say Time: O(m) where m is the total number of characters on the trie.
class WordDictionary0 {
    var root = TrieNode()
    init() {
        
    }
    
    func addWord(_ word: String) {
        var currentNode = root
        
        for char in word {
            if let node = currentNode.children[char] {
                currentNode = node
            } else {
                let newNode = TrieNode()
                currentNode.children[char] = newNode
                currentNode = newNode
            }
        }
        currentNode.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        return dfs(0, Array(word), root)
    }
    
    func dfs(_ index: Int, _ word: [Character], _ node: TrieNode) -> Bool {
        if index == word.count { return node.isEnd }
        let char = word[index]
        if char != "." {
            return node.children[char] != nil && dfs(index + 1, word, node.children[char]!)
        } else {
            for char in node.children.keys {
                if node.children[char] != nil && dfs(index + 1, word, node.children[char]!) {
                    return true
                }
            }
        }
        
        return false
    }
}


/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */

// TLE, I didn't try because I hate using Map
class WordDictionary1 {
    var storage = [Int: Set<String>]()
        
        func addWord(_ word: String) {
            if storage[word.count] == nil {
                storage[word.count] = []
            }
            storage[word.count]!.insert(word)
        }
        
        func search(_ word: String) -> Bool {
            guard let  words = storage[word.count] else { return false }
            
            for w  in words {
                var i = w.startIndex
                var j = word.startIndex
                
                var found = true
                while i < w.endIndex {
                    if word[j] != "." && word[j] != w[i] {
                        found = false;
                        break;
                    }
                    
                    i = w.index(after: i)
                    j = word.index(after: j)
                }
                if found {
                    return true
                }
            }
            
            return false
        }
}


//Runtime: 2981 ms, faster than 83.87% of Swift online submissions for Design Add and Search Words Data Structure.
//Memory Usage: 20.9 MB, less than 97.85% of Swift online submissions for Design Add and Search Words Data Structure.
//Runtime: 2053 ms, faster than 100.00% of Swift online submissions for Design Add and Search Words Data Structure.
//Memory Usage: 21.3 MB, less than 97.85% of Swift online submissions for Design Add and Search Words Data Structure.
//ref: https://leetcode.com/problems/design-add-and-search-words-data-structure/discuss/1088422/100-beats-Swift-Solution


//    The search operation in solution with Tries takes O(26^M) time in worst case. (like "..................z" search) and it sounds too bad, because we have limit M <= 500. 26^500 sounds crazy %)
//
//    So in a linear approach it will take
//    O(N*M) time and O(N) Space
//
//    Save words in dictionary (storage) where
//    key - is the lenght of the word
//    value - set with words with key length
//    While searching - i just compare the query with each word from storage.


class WordDictionary {
    var dict = [Int: Set<[Character]>]()
    
    func addWord(_ word: String) {
        dict[word.count, default: []].insert(Array(word))
    }
    
    func search(_ word: String) -> Bool {
        
        guard let wordSet = dict[word.count] else { return false }
        if word.contains(".") {
            
            var letters = [(Character, Int)]()
            
            for (index, char) in word.enumerated() {
                if char != "." {
                    letters.append((char, index))
                }
            }
            
            if letters.isEmpty {
                return true
            }
            
            for a in wordSet {
                var match = true
                for (char, index) in letters {
                    if a[index] != char {
                        match = false
                        break
                    }
                }
                if match {
                    return true
                }
            }
            return false
            
        } else {
            return wordSet.contains(Array(word))
        }
    }
}

//Runtime: 2766 ms, faster than 90.32% of Swift online submissions for Design Add and Search Words Data Structure.
//Memory Usage: 20.9 MB, less than 97.85% of Swift online submissions for Design Add and Search Words Data Structure.

class WordDictionary55 {
    var dictionay = [Int: Set<[Character]>]()
    func addWord(_ word: String) {
        dictionay[word.count, default:[]].insert(Array(word))
    }
    
    func search(_ word: String) -> Bool {
        guard let wordSet = dictionay[word.count] else { return false }
        if word.contains(".") {
            var letters = [(Character, Int)]()
            for (index, char) in word.enumerated() {
                if char != "." {
                    letters.append((char, index))
                }
            }
            
            if letters.isEmpty { return true }
            
            for wd in wordSet {
                var match = true
                for (char, index) in letters {
                    if wd[index] != char {
                        match = false
                        break
                    }
                }
                if match { return true }
            }
            return false
        } else {
            return wordSet.contains(Array(word))
        }
    }
}
