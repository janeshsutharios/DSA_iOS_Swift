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
// https://leetcode.com/problems/maximum-depth-of-binary-tree/description/
// https://getsdeready.com/courses/dsa/lesson/maximum-depth-of-binary-tree/
// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
// Constructing the tree
let root = TreeNode(3)
root.left = TreeNode(9)
root.left?.right = TreeNode(88)
root.left?.left = TreeNode(99)
root.right = TreeNode(20)
root.right?.left = TreeNode(15)
root.right?.right = TreeNode(7)

/*
 pop 3
 add 9 , 20
 pop 20
 add 15 7
 pop 7
 pop 15
 pop 9
 add 99 88
 pop 88
 pop 99
 */
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        var stack: [(node: TreeNode, depth: Int)] = [(root, 1)]
        var maxDepth = 0

        while let (node, depth) = stack.popLast() {
            print("Pop", node.val)
            maxDepth = max(maxDepth, depth)

            if let left = node.left {
                stack.append((left, depth + 1))
                print("Added Left", left.val)
            }
            if let right = node.right {
                stack.append((right, depth + 1))
                print("Added Right", right.val)
            }
        }

        return maxDepth
    }
}
let solution = Solution()
print(" op is", solution.maxDepth(root))
