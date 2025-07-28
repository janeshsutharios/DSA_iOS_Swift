# 🌳 Tree Traversal: DFS vs BFS in Swift

This guide explains **DFS** (Depth-First Search) and **BFS** (Breadth-First Search) with Swift examples, an example tree, and a comparison table.

---

## 🔰 Example Binary Tree

We'll use the following tree for demonstration:[1, 2, 3, 4, 5, 6]

```
        1
       / \
      2   3
     / \  /
    4  5 6

```

### TreeNode Definition in Swift
```swift
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}
```

---

## 🔎 Depth-First Search (DFS)

### ✅ Pre-order DFS (Recursive)
```swift
func dfsRecursive(_ node: TreeNode?) {
    guard let node = node else { return }
    print(node.val)
    dfsRecursive(node.left)
    dfsRecursive(node.right)
}
```

### ✅ Pre-order DFS (Iterative using Stack)
```swift
func dfsIterative(_ root: TreeNode?) {
    guard let root = root else { return }
    var stack: [TreeNode] = [root]
    while let node = stack.popLast() {
        print(node.val)
        if let right = node.right { stack.append(right) }
        if let left = node.left { stack.append(left) }
    }
}
```

---

## 📶 Breadth-First Search (BFS)

### ✅ Level Order BFS (Iterative using Queue)
```swift
func bfs(_ root: TreeNode?) {
    guard let root = root else { return }
    var queue: [TreeNode] = [root]
    while !queue.isEmpty {
        let node = queue.removeFirst()
        print(node.val)
        if let left = node.left { queue.append(left) }
        if let right = node.right { queue.append(right) }
    }
}
```

---

## 🔁 Output for Tree Above

| Traversal Type | Output Sequence       |
|----------------|-----------------------|
| DFS (Recursive)| 1 → 2 → 4 → 5 → 3 → 6 |
| DFS (Iterative)| 1 → 2 → 4 → 5 → 3 → 6 |
| BFS            | 1 → 2 → 3 → 4 → 5 → 6 |

---

## 🧠 DFS vs BFS Comparison Table

| Feature           | DFS                          | BFS                         |
|-------------------|-------------------------------|------------------------------|
| Data Structure     | Stack                        | Queue                        |
| Recursive Option   | ✅ Yes (natural)             | ❌ No                        |
| Iterative Option   | ✅ Yes                       | ✅ Yes                       |
| Order              | Depth-first (deep first)     | Level-order (wide first)     |
| Use Cases          | Tree comparison, backtracking| Shortest path, level info    |
| Memory Efficient?  | Yes for sparse trees         | Yes for narrow/shallow trees |

---

## 🧠 Mnemonics

```
DFS = Stack = Recursion ✅
BFS = Queue = Iterative ✅
```

---

## 🧪 Test It

Try these functions on:

```swift
let root = TreeNode(1,
    TreeNode(2, TreeNode(4), TreeNode(5)),
    TreeNode(3, nil, TreeNode(6))
)

dfsRecursive(root)     // DFS
dfsIterative(root)     // DFS
bfs(root)              // BFS
```

---

## 📚 LeetCode Practice Links

- [Same Tree (Easy)](https://leetcode.com/problems/same-tree/)
- [Binary Tree Preorder Traversal (Easy)](https://leetcode.com/problems/binary-tree-preorder-traversal/)
- [Binary Tree Level Order Traversal (Medium)](https://leetcode.com/problems/binary-tree-level-order-traversal/)

---

----------------------

# 🌳 Leetcode 100 — Same Tree

## 🔗 Problem Link
[Leetcode - Same Tree](https://leetcode.com/problems/same-tree/)

---

## 📘 Problem Description

Given the roots of two binary trees `p` and `q`, write a function to check if they are the same or not.

Two binary trees are considered the same if:
- They are structurally identical.
- The corresponding nodes have the same value.

---

## 🧪 Examples

### Example 1

**Input:**
```
p = [1,2,3]
q = [1,2,3]
```

**Output:**
```
true
```

**Visual Representation:**

```
    1           1
   / \         / \
  2   3       2   3
```

### Example 2

**Input:**
```
p = [1,2]
q = [1,null,2]
```

**Output:**
```
false
```

---

## ✅ Solution Approaches

### ✅ 1. DFS — Recursive (Pre-order)

```swift
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        if p == nil || q == nil || p?.val != q?.val {
            return false
        }
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}
```

- **Type:** DFS using recursion
- **Traversal:** Pre-order
- **Space Complexity:** O(h) due to recursion stack
- **Time Complexity:** O(n)

---

### ✅ 2. DFS — Iterative Using Stack

```swift
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var stack: [(node1: TreeNode?, node2: TreeNode?)] = [(node1: p, node2: q)]

        while let current = stack.popLast() {
            let (node1, node2) = current

            if node1 == nil && node2 == nil {
                continue
            }

            if node1 == nil || node2 == nil || node1!.val != node2!.val {
                return false
            }

            stack.append((node1: node1?.right, node2: node2?.right))
            stack.append((node1: node1?.left, node2: node2?.left))
        }

        return true
    }
}
```

- **Type:** DFS using stack
- **Traversal:** Pre-order (right pushed before left)
- **Space Complexity:** O(n)
- **Time Complexity:** O(n)

---

### ✅ 3. BFS — Iterative Using Queue

```swift
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var queue: [(node1: TreeNode?, node2: TreeNode?)] = [(node1: p, node2: q)]

        while !queue.isEmpty {
            let (node1, node2) = queue.removeFirst()

            if node1 == nil && node2 == nil {
                continue
            }

            if node1 == nil || node2 == nil || node1!.val != node2!.val {
                return false
            }

            queue.append((node1: node1?.left, node2: node2?.left))
            queue.append((node1: node1?.right, node2: node2?.right))
        }

        return true
    }
}
```

- **Type:** BFS using queue
- **Traversal:** Level-order
- **Space Complexity:** O(n)
- **Time Complexity:** O(n)

---

## 🧠 DFS vs BFS Summary

| Type        | Mechanism   | Data Structure | Order       | Recursive | Use Case                   |
|-------------|-------------|----------------|-------------|-----------|----------------------------|
| DFS         | Depth First | Stack / Recursion | Pre/In/Post | Yes       | Best for subtree comparison |
| BFS         | Breadth First | Queue         | Level-wise  | No        | Level-order traversal       |

> ✅ **Important:**
> - DFS (recursive or stack) is natural for problems like tree comparison.
> - BFS is better for level-wise traversal or shortest path problems.

---

## 📌 Learning Note

```text
DFS = Stack = Recursion
BFS = Queue = Iterative
```

Use named tuples like:
```swift
var queue: [(node1: TreeNode?, node2: TreeNode?)] = [(node1: p, node2: q)]
```

For better readability and self-documenting code.

---

## 🔚 Conclusion

This problem is great for understanding how to **traverse two trees in sync**. Whether you use recursion, a stack, or a queue, your goal is to **walk both trees node-by-node** and ensure structure and values match exactly.

You now know 3 solid ways to solve the Same Tree problem — pick the one that fits your coding style or the constraints of the system you are building!

