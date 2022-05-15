//https://leetcode.com/problems/implement-trie-prefix-tree/submissions/
class TrieNode {
    var word = ""
    var children = [Character : TrieNode]()
}

//Runtime: 192 ms, faster than 89.29% of Swift online submissions for Implement Trie (Prefix Tree).
//Memory Usage: 21.2 MB, less than 45.41% of Swift online submissions for Implement Trie (Prefix Tree).
//Runtime: 258 ms, faster than 56.22% of Swift online submissions for Implement Trie (Prefix Tree).
//Memory Usage: 20.5 MB, less than 90.55% of Swift online submissions for Implement Trie (Prefix Tree).

class Trie {
    var root = TrieNode()

    func insert(_ word: String) {
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
        currentNode.word = word
    }
    
    func search(_ word: String) -> Bool {
        var currentNode = root
        
        for char in word {
            if let node = currentNode.children[char] {
                currentNode = node
            } else {
                return false
            }
        }
        
        return currentNode.word.isEmpty ? false : true
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var currentNode = root
        
        for char in prefix {
            if let node = currentNode.children[char] {
                currentNode = node
            } else {
                return false
            }
        }
        return currentNode.children.isEmpty && currentNode.word.isEmpty ? false : true
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */


/// Wuwu memorize:
///
///

class TrieNode2 {
    var word = ""
    var children = [Character:TrieNode]()
}

//Runtime: 338 ms, faster than 27.36% of Swift online submissions for Implement Trie (Prefix Tree).
//Memory Usage: 21.2 MB, less than 56.72% of Swift online submissions for Implement Trie (Prefix Tree).
//Runtime: 288 ms, faster than 46.27% of Swift online submissions for Implement Trie (Prefix Tree).
//Memory Usage: 21.2 MB, less than 56.72% of Swift online submissions for Implement Trie (Prefix Tree).
//Runtime: 257 ms, faster than 57.21% of Swift online submissions for Implement Trie (Prefix Tree).
//Memory Usage: 21 MB, less than 75.62% of Swift online submissions for Implement Trie (Prefix Tree).
//Runtime: 225 ms, faster than 67.16% of Swift online submissions for Implement Trie (Prefix Tree).
//Memory Usage: 21.1 MB, less than 56.72% of Swift online submissions for Implement Trie (Prefix Tree).

class Trie2 {
    var root = TrieNode()
    
    func insert(_ word: String) {
        var currentNode = root
        for character in word {
            if let node = currentNode.children[character] {
                currentNode = node
            } else {
                let newNode = TrieNode()
                currentNode.children[character] = newNode
                currentNode = newNode
            }
        }
        currentNode.word = word
    }
    
    func search(_ word: String) -> Bool {
        var currentNode = root
        for character in word {
            if let node = currentNode.children[character] {
                currentNode = node
            } else {
                return false
            }
        }
        return currentNode.word.isEmpty ? false : true
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var currentNode = root
        for character in prefix {
            if let node = currentNode.children[character] {
                currentNode = node
            } else {
                return false
            }
        }
        return currentNode.word.isEmpty && currentNode.children.isEmpty ? false : true
    }
}


let trie = Trie2()
trie.insert("apple")
var result = trie.search("apple")
print(result)
