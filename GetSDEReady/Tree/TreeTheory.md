# 🌳 Tree Traversal: DFS vs BFS in Swift

This guide explains **DFS** (Depth-First Search) and **BFS** (Breadth-First Search) with Swift examples, an example tree, and a comparison table.

---

## 🔰 Example Binary Tree

We'll use the following tree for demonstration:

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

## 👋 Contribution

Feel free to fork and contribute more traversal types like:
- In-order, Post-order
- Zigzag BFS
- Visual diagrams (e.g., Graphviz)
