//  https://leetcode.com/problems/word-search-ii/discuss/1512006/Swift-DFS-%2B-Trie-clean-code
//  comment: Quite nice. In this I like that a Trie and a node for the Trie are the same. I have something similar but unfortunately with not so clean code. And instead of using a dictionary in the trie node to store children, I've got the array with 26 optional Trie? elements. This leads to a bit of awkwardness when putting in your speed up magic! I should have used the dictionary.

class Solution {
    //O(n+m), O(n+m), n = words.len, m = board
    class Trie {
        var dict = [Character: Trie]()
        var endWord: String?
    }
    
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let root = Trie()
        
        //Create a trieNode for input words
        for word in words {
            var curr = root
            for char in word {
                if curr.dict[char] == nil {
                    curr.dict[char] = Trie()
                }
                curr = curr.dict[char]!
            }
            curr.endWord = word
        }
        
        var board = board
        var res = [String]()
        let rows = board.endIndex, cols = board[0].endIndex
        
        func dfs(_ x:Int, _ y: Int, _ node: Trie) {
            guard x >= 0, y >= 0, x < rows, y < cols else { return }

            let char = board[x][y]
            
            if let next = node.dict[char] {
                // Append the andwer in the res
                if let word = next.endWord {
                    res.append(word)
                    next.endWord = nil
                }
                
                // in case if it's out of bound
                board[x][y] = "_"

                dfs(x+1,y,next)
                dfs(x-1,y,next)
                dfs(x,y+1,next)
                dfs(x,y-1,next)
                board[x][y] = char

                if next.dict.isEmpty { /*speed up magic*/
                    node.dict[char] = nil
                }
            }
            
        }

        for i in 0..<rows {
            for j in 0..<cols {
                dfs(i,j,root)
            }
        }
        return res
    }
}
