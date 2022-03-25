//https://leetcode.com/problems/course-schedule/
//Runtime: 151 ms, faster than 13.38% of Swift online submissions for Course Schedule.
//Memory Usage: 15 MB, less than 23.24% of Swift online submissions for Course Schedule.
//Runtime: 68 ms, faster than 88.38% of Swift online submissions for Course Schedule.
//Memory Usage: 14.8 MB, less than 34.86% of Swift online submissions for Course Schedule.
class Solution {
    // graph
    var graph = [Int: Set<Int>]()
    var visited = Set<Int>()
    
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        for item in prerequisites {
            let course = item[0]
            let preqs = item[1]
            graph[course, default: []].insert(preqs)
        }
        
        // loop all course in graph
        for course in graph.keys {
            if !dfs(course: course) {
                return false
            }
        }
        
        return true
    }
    
    private func dfs(course: Int) -> Bool {
        // check visited
        if visited.contains(course) {
            return false
        }
        
        // check preqs from graph
        guard let preqs = graph[course] else { return true }
        
        if preqs.isEmpty { return true }
        
        visited.insert(course)
        for next in preqs {
            if !dfs(course: next) {
                return false
            }
        }
        
        // reset
        graph[course] = []
        visited.remove(course)
        return true
        
    }
}


// ------------------------------------------------------------------------------

let solution = Solution()
var answer = solution.canFinish(2, [[1,0]])
print(answer == true)

answer = solution.canFinish(2, [[1,0],[0,1]])
print(answer == false)

