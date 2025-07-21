https://leetcode.com/problems/sort-list/description/
// Important question because it covers many sub problems
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
 /*
class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        guard let head = head, head.next != nil else { return head }

        // Count length of list
        var length = 0
        var node: ListNode? = head
        while node != nil {
            length += 1
            node = node?.next
        }

        let dummy = ListNode(0, head)
        var size = 1

        while size < length {
            var prev: ListNode? = dummy
            var curr: ListNode? = dummy.next

            while curr != nil {
                // Split into two sorted parts
                let left = curr
                let right = split(left, size)
                curr = split(right, size)
                
                // Merge and connect
                let merged = merge(left, right)
                prev?.next = merged.head
                prev = merged.tail
            }
            size *= 2
        }

        return dummy.next
    }

    // Splits the list after n nodes, returns the head of the second half
    private func split(_ head: ListNode?, _ n: Int) -> ListNode? {
        var current = head
        for _ in 1..<n {
            if current?.next == nil { break }
            current = current?.next
        }

        let rest = current?.next
        current?.next = nil // Break the list
        return rest
    }

    // Merges two sorted lists and returns (head, tail)
    private func merge(_ l1: ListNode?, _ l2: ListNode?) -> (head: ListNode?, tail: ListNode?) {
        let dummy = ListNode(0)
        var tail = dummy
        var l1 = l1
        var l2 = l2

        while let node1 = l1, let node2 = l2 {
            if node1.val < node2.val {
                tail.next = node1
                l1 = node1.next
            } else {
                tail.next = node2
                l2 = node2.next
            }
            tail = tail.next!
        }

        tail.next = l1 ?? l2

        while tail.next != nil {
            tail = tail.next!
        }

        return (dummy.next, tail)
    }
}
*/
// Using recursion.. 
class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        // Base case: empty list or single node
        guard let head = head, head.next != nil else {
            return head
        }

        // Split the list into two halves
        let mid = getMiddle(head)
        let rightHalf = mid.next
        mid.next = nil // break into two parts

        // Recursively sort each half
        let sortedLeft = sortList(head)
        let sortedRight = sortList(rightHalf)

        // Merge sorted halves
        return mergeSortedLists(sortedLeft, sortedRight)
    }

    // MARK: - Helpers

    /// Finds the middle node using slow/fast pointer technique
    private func getMiddle(_ head: ListNode?) -> ListNode {
        var slow = head
        var fast = head?.next

        while fast != nil, fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        return slow!
    }

    /// Merges two sorted linked lists and returns the head of the result
    private func mergeSortedLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        var current: ListNode? = dummy
        var l1 = l1, l2 = l2

        while let node1 = l1, let node2 = l2 {
            if node1.val < node2.val {
                current?.next = node1
                l1 = node1.next
            } else {
                current?.next = node2
                l2 = node2.next
            }
            current = current?.next
        }

        current?.next = l1 ?? l2
        return dummy.next
    }
}


// https://getsdeready.com/courses/dsa/lesson/design-hashmap/
// https://leetcode.com/problems/design-hashmap/

class MyHashMap {
    private let size = 1009 // Prime number to reduce collisions
    private var buckets: [[(key: Int, val: Int)]] // Example values [(key: 1009, val: 20), (key: 2018, val: 30)]
    
    init() {
        buckets = Array(repeating: [], count: size)
    }

    private func hash(_ key: Int) -> Int {
        return key % size
    }

    func put(_ key: Int, _ value: Int) {
        let index = hash(key)
        for i in 0..<buckets[index].count {
            let pair = buckets[index][i]
            if pair.key == key {
                buckets[index][i].val = value
                return
            }
        }
        buckets[index].append((key: key, val: value))
    }

    func get(_ key: Int) -> Int {
        let index = hash(key)
        for pair in buckets[index] {
            if pair.key == key {
                return pair.val
            }
        }
        return -1
    }

    func remove(_ key: Int) {
        let index = hash(key)
        buckets[index] = buckets[index].filter { pair in
            return pair.key != key
        }
    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */

// https://getsdeready.com/courses/dsa/lesson/remove-duplicates-from-sorted-list/
// https://leetcode.com/problems/remove-duplicates-from-sorted-list/description/
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var node = head
        while let next = node?.next {
            if node!.val == next.val {
                node!.next = next.next
            } else {
                node = next
            }
        }
        return head
    }
}
// https://getsdeready.com/courses/dsa/lesson/linked-list-cycle/ already solved check in Beginner..



// https://getsdeready.com/courses/dsa/lesson/flatten-a-multilevel-doubly-linked-list/
// https://leetcode.com/problems/flatten-a-multilevel-doubly-linked-list/
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var prev: Node?
 *     public var next: Node?
 *     public var child: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.prev = nil
 *         self.next = nil
 *         self.child  = nil
 *     }
 * }
 */

class Solution {
    func flatten(_ head: Node?) -> Node? {
        guard let head = head else { return nil }

        var stack: [Node] = [head]
        var prev: Node? = nil

        while !stack.isEmpty {
            let curr = stack.removeLast()

            // Link prev and curr
            if let prev = prev {
                prev.next = curr
                curr.prev = prev
            }

            // Push next and child to stack (next goes first, so child is processed first)
            if let next = curr.next {
                stack.append(next)
            }

            if let child = curr.child {
                stack.append(child)
                curr.child = nil  // Important: remove child after flattening
            }

            // Move prev to curr
            prev = curr
        }

        return head
    }
}

// https://getsdeready.com/courses/dsa/lesson/remove-duplicates-from-sorted-list-ii/
// https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        // Create a dummy node to handle edge cases easily.
        let dummy = ListNode(0)
        dummy.next = head
        // `prev` will point to the last node before the sequence of duplicates.
        var prev = dummy
        // `current` is used to traverse the linked list.
        var current = head
        
        while current != nil {
            // Check if the current node has a duplicate.
            if current?.next != nil && current?.val == current?.next?.val {
                // Move current until the end of duplicates sequence.
                while current?.next != nil && current?.val == current?.next?.val {
                    current = current?.next
                }
                // Skip all duplicates.
                prev.next = current?.next
            } else {
                // No duplicates detected, move prev to the next node.
                prev = current!
            }
            // Move current to the next node.
            current = current?.next
        }
        
        // Return the next of dummy node, which is the head of the modified list.
        return dummy.next
    }
}
/*
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0, head)
        var prev: ListNode? = dummy
        var curr = head

        while curr != nil {
            var hasDuplicate = false

            while curr?.next != nil && curr?.val == curr?.next?.val {
                hasDuplicate = true
                curr = curr?.next
            }

            if hasDuplicate {
                // skip all duplicates
                prev?.next = curr?.next
            } else {
                prev = curr
            }

            curr = curr?.next
        }

        return dummy.next
    }
}
*/
// https://getsdeready.com/courses/dsa/lesson/design-a-text-editor/
// https://leetcode.com/problems/design-a-text-editor/description/
class TextEditor {
    private var left: [Character]
    private var right: [Character]

    init() {
        left = []
        right = []
    }

    func addText(_ text: String) {
        for char in text {
            left.append(char)
        }
    }

    func deleteText(_ k: Int) -> Int {
        let count = min(k, left.count)
        for _ in 0..<count {
            left.removeLast()
        }
        return count
    }

    func cursorLeft(_ k: Int) -> String {
        let steps = min(k, left.count)
        for _ in 0..<steps {
            right.append(left.removeLast())
        }
        return last10()
    }

    func cursorRight(_ k: Int) -> String {
        let steps = min(k, right.count)
        for _ in 0..<steps {
            left.append(right.removeLast())
        }
        return last10()
    }

    private func last10() -> String {
        let last10Chars = left.suffix(10)
        return String(last10Chars)
    }
}


/**
 * Your TextEditor object will be instantiated and called as such:
 * let obj = TextEditor()
 * obj.addText(text)
 * let ret_2: Int = obj.deleteText(k)
 * let ret_3: String = obj.cursorLeft(k)
 * let ret_4: String = obj.cursorRight(k)
 */
