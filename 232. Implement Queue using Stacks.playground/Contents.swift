//https://leetcode.com/problems/implement-queue-using-stacks/
//refs: https://leetcode.com/problems/implement-queue-using-stacks/discuss/1471866/Swift-true-2-stacks-implementation
//Runtime: 4 ms, faster than 47.34% of Swift online submissions for Implement Queue using Stacks.
//Memory Usage: 14.5 MB, less than 42.02% of Swift online submissions for Implement Queue using Stacks.
class MyQueue {
    var ls = [Int]()
    var rs = [Int]()
    init() {
    }
    
    func push(_ x: Int) {
        while !ls.isEmpty { rs.append(ls.removeLast())}
        rs.append(x)
    }
    
    func pop() -> Int {
        while !rs.isEmpty { ls.append(rs.removeLast())}
        return ls.removeLast()
    }
    
    func peek() -> Int {
        while !rs.isEmpty { ls.append(rs.removeLast())}
        return ls.last!
    }
    
    func empty() -> Bool {
        return ls.isEmpty && rs.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
