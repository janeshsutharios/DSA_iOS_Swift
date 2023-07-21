//: # Linked Lists
//: Linked List Class Declaration:

// Creating Node for link List
public class Node<T> {
    var item: T
    var next: Node?
    init(_ item: T) {
        self.item = item
    }
}

// For printing LinkedList
extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(item)"
        }
        return "\(item) -> " + String(describing: next) + " "// String(describing.. make recursive call
    }
}

//  Definition for singly-linked list.
public final class SingleLinkedList<T> {
    
    private(set) var head: Node<T>?
    private var count = 0// We are dynamic updating from add delete operations.
    
    /** Initialize LinkList data structure here. */
    init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    /// Computed property to iterate through the linked list and return the last node in the list (if any)
    public var last: Node<T>? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        return node
    }
    /// Computed property to iterate through the linked list and return the total number of nodes
    public var nodesCount: Int {
        return count
        // Or we can also use below manual method
//        guard var node = head else {
//            return 0
//        }
//
//        var count = 1
//        while let next = node.next {
//            node = next
//            count += 1
//        }
//        return count
    }
     // accessIndexFrom subscript
    public subscript(index: Int) -> T {
        return self.node(at: index).item
    }
    /// Function to return the node at a specific index. Crashes if index is out of bounds (0...self.count)
    ///
    /// - Parameter index: Integer value of the node's index to be returned
    /// - Returns: LinkedListNode
    public func node(at index: Int) -> Node<T> {
        assert(head != nil, "List is empty")
        assert(index >= 0, "index must be greater than 0")
        
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            
            assert(node != nil, "index is out of bounds.")
            return node!
        }
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: T) {
        let node = Node(val)
        node.next = head
        head = node
        count += 1
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: T) {
        if count == 0 {
            addAtHead(val)
            return
        }
        
        var current = head
        while let nextNode = current?.next {
            current = nextNode
        }
        let node = Node(val)
        current?.next = node
        count += 1
    }
    
    
    /// Append a copy of a LinkedList to the end of the list.
    ///
    /// - Parameter list: The list to be copied and appended.
    public func append(_ list: SingleLinkedList) {
        var nodeToCopy = list.head
        while let node = nodeToCopy {
            addAtTail(node.item)
            nodeToCopy = node.next
        }
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: T) {
        if index > count { return }
        if index == 0 {
            addAtHead(val)
            return
        }
        
        var current = head
        var prev: Node<T>?
        for _ in 0..<index {
            prev = current
            current = current?.next
        }
        let node = Node(val)
        prev?.next = node
        node.next = current
        count += 1
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        if index >= count { return }
        count -= 1
        if index == 0 {// Deleting head
            head = head?.next
            return
        }
        
        var current = head
        var prev: Node<T>?
        for _ in 0..<index {
            prev = current
            current = current?.next
        }
        prev?.next = current?.next
    }
    
    /// Function to remove all nodes/value from the list
    public func removeAll() {
        head = nil
    }
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> T {
        if index >= count { return -1 as! T }
        var node = head
        for _ in 0..<index {
            node = node?.next
        }
        return node!.item
    }
    
    func printLinkList() ->String {
        return head?.description ?? "Empty"
    }
}

let llist = SingleLinkedList<Int>()
llist.addAtTail(1)
llist.addAtTail(2)
llist.addAtTail(3)
print("Link List Basic Operations.. ")
print("---------------------------------------")
print("Link List printing ", llist.printLinkList()) // 1->2->3
print("isEmpty", llist.isEmpty) // 1->2->3
print("Last Node", llist.last?.description ?? "") // 1->2->3
print("getAtIndex", llist.get(5)) // 1->2->3
print("Number of nodes", llist.nodesCount)
print("---------------------------------------")


// ListNode
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

extension ListNode: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(val)"
        }
        return "\(val) -> " + String(describing: next) + " "
    }
}

// Link List basic calls ends

private var reminderVal = 0
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil && l2 == nil && reminderVal == 0 { return nil }
    let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + reminderVal
    reminderVal = sum / 10 // ex 10/10 = 1 so add it two next iteration.
    return .init(sum % 10, addTwoNumbers(l1?.next, l2?.next))
}

let firstNode = ListNode(1, ListNode(2, ListNode(3)))
let secondNode = ListNode(4, ListNode(5, ListNode(6)))

func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1
    var l2 = l2
    var prev = ListNode()
    var carry = 0
    let head = prev
    
    while l1 != nil || l2 != nil || carry != 0 {
        let cur = ListNode()
        let sum = (l2 == nil ? 0 : l2!.val) + (l1 == nil ? 0 : l1!.val) + carry
        cur.val = sum % 10
        carry = sum / 10
        prev.next = cur
        prev = cur
        l1 = l1 == nil ? l1: l1?.next
        l2 = l2 == nil ? l2: l2?.next
    }
    return head.next
}

let addedNumber = addTwoNumbers2(firstNode, secondNode)
print("Added output --- ", addedNumber!.description)
// print("=---------- ", l1?.val, l2?.val, carry, sum, sum % 10)

func reverseList1(_ head: ListNode?) -> ListNode? {
    
    var prev = head, node = head?.next
    prev?.next = nil
    
    while node != nil {
        let next = node!.next
        node!.next = prev
        prev = node
        node = next
    }
    
    return prev
}

func reverseList2(_ head: ListNode?) -> ListNode? {
    if (head == nil) || (head?.next == nil) {
      return head
    }
    let temp = reverseList2(head?.next)
    head?.next?.next = head
    head?.next = nil
    return temp
}

print("1  -----", firstNode.description, "||")
let opDetail1 = reverseList2(firstNode)
//let opDetail2 = reverseList2(opDetail1)
print("2 ------", opDetail1!.description, "||")
//print("3 ------", opDetail2!.description, "||")

// Question: Delete Middle node

func deleteMiddle(_ head: ListNode?) -> ListNode? {
     if head?.next == nil {
         return nil
     }
     var slowPointer = head // 1X time mover
     var fastPointer = head// 2X mover
     var prevNode: ListNode?// This is middle - 1 Node
     while fastPointer?.next != nil {
         fastPointer = fastPointer?.next?.next
         prevNode = slowPointer
         slowPointer = slowPointer?.next
     }
     prevNode?.next = slowPointer?.next// middle Node - 1 next's is middle + 1 node
     return head
 }

var aLinkList = ListNode(1, ListNode(2, ListNode(3)))
aLinkList = deleteMiddle(aLinkList)!
print("After Deleting Link list will look like--", aLinkList) //  1 -> 3


class MyHashSet {
     private var data = [Bool?](repeating: false, count: 1000001)
     init() {}
     func add(_ key: Int) { data[key] = true }
     func remove(_ key: Int) { data[key] = nil }
     func contains(_ key: Int) -> Bool { data[key] ?? false }
}
// Bitwise Solution: --
class MyHashSet2 {
    private var bits =  [Int](repeating: 0, count: 1000001) // 15_626 = 1_000_000 / 64 + 1
    func add(_ key: Int) { bits[key>>6] |= 1<<(key&63) }
    func remove(_ key: Int) { bits[key>>6] &= ~(1<<(key&63)) }
    func contains(_ key: Int) -> Bool { bits[key>>6] & 1<<(key&63) != 0 }
}
