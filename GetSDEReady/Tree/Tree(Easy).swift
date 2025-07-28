// https://getsdeready.com/courses/dsa/lesson/same-tree/
// https://leetcode.com/problems/same-tree/
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var queues:[(node1: TreeNode?, node2: TreeNode?)] = [(node1: p, node2: q)]
        
        while !queues.isEmpty {
            let (node1, node2) = queues.removeFirst()
            
            if node1 == nil && node2 == nil { continue }
            
            if  node1 == nil || node2 == nil || node1?.val != node2?.val {
                return false
            }
            
            queues.append((node1: node1?.left, node2: node2?.left))
            queues.append((node1: node1?.right, node2: node2?.right))
        }
        
        return true
    }
}
