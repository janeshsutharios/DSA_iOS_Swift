//: [Previous](@previous)

import Foundation

//: [Next](@next)
/*: **Heading 2** */
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

/*: **Question Create your own HashSet** */
class MyHashSet {
    private var data = [Bool?](repeating: false, count: 1000001)
    init() {}
    func add(_ key: Int) { data[key] = true }
    func remove(_ key: Int) { data[key] = nil }
    func contains(_ key: Int) -> Bool { data[key] ?? false }
}
/*: **Bitwise Solution:** --*/
class MyHashSet2 {
    private var bits =  [Int](repeating: 0, count: 1000001) // 15_626 = 1_000_000 / 64 + 1
    func add(_ key: Int) { bits[key>>6] |= 1<<(key&63) }
    func remove(_ key: Int) { bits[key>>6] &= ~(1<<(key&63)) }
    func contains(_ key: Int) -> Bool { bits[key>>6] & 1<<(key&63) != 0 }
}

// Question: - Add two number Approach#1 Recursion
private var reminderVal = 0
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil && l2 == nil && reminderVal == 0 { return nil }
    let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + reminderVal
    reminderVal = sum / 10 // ex 10/10 = 1 so add it two next iteration.
    return .init(sum % 10, addTwoNumbers(l1?.next, l2?.next))
}

// Question: - Add two number Approach#1 Iterative
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
let firstNode = ListNode(1, ListNode(2, ListNode(3)))
let secondNode = ListNode(4, ListNode(5, ListNode(6)))
let addedNumber = addTwoNumbers2(firstNode, secondNode)
//print("Added output --- ", addedNumber!.description)
// print("=---------- ", l1?.val, l2?.val, carry, sum, sum % 10)


// Question: Reverse LinkedList #Approach 1: Iterative
func reverseList1(_ head: ListNode?) -> ListNode? {
    var prev = head, currentHead = head?.next
    prev?.next = nil
    while currentHead != nil {// At end of linked list it will be nil.
        let next = currentHead!.next
        currentHead!.next = prev
        prev = currentHead
        currentHead = next
    }
    return prev
}

// Question: Reverse LinkedList #Approach 1: Recursive.
func reverseList2(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    let newHead = reverseList2(head?.next)
    var nextNode = head?.next
    nextNode?.next = head
    head?.next = nil
    return newHead
}

let linkListType = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
//print("Before Reverse  -----", linkListType.description, "||")
//let opDetail1 = reverseList1(linkListType)
let opDetail2 = reverseList2(linkListType)
//print("After Reverse ------", opDetail2!.description, "||")
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
//print("After Deleting Link list will look like--", aLinkList) //  1 -> 3

// Remove nth node from the linked list where nth is position from last node onwards.
// Approach Two pointer
// Move fast pointer till count
// Increment fast pointer till we get fast?.next == nil if we got nil just remove mid pointer...
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var fast = head
    var slow = head
    var count = n
    
    while count > 0 {
        count -= 1
        fast = fast?.next
    }
    if fast == nil { return head?.next }
    
    while slow != nil && fast != nil {
        if fast?.next == nil {
            slow?.next = slow?.next?.next
        }
        slow = slow?.next
        fast = fast?.next
    }
    
    return head
}

var aLinkList2 =  ListNode(1, ListNode(2, ListNode(3,ListNode(4, ListNode(5)))))
//let afterDeletingLL = removeNthFromEnd(aLinkList2, 2)// Remove second last
//print("removeNthFromEnd------", afterDeletingLL) //  1 -> 2 -> 3 -> 5


// Question: Create circular linkedlist
func createloop(_ head: ListNode?) {
    var temp = head
    while temp?.next != nil {
        temp=temp?.next
    }
    temp?.next=head
}

// Question: Create Loop from & to
// FIXME: BUG 
func createLinkListLoop(head: ListNode?, fromValue: Int, toValue: Int) {
    var cnta = 0
    var p1 = head
    var p2 = head// The Last Node
    while let nxtNode = p2?.next {
        p2 = nxtNode
    }
    while cnta != fromValue  {
        if cnta != fromValue  {
            p1 = p1?.next
            cnta+=1
        }
    }
    p2?.next = p1
}

// Question: Get Linked List loop length
func detectloopLength(head: ListNode?) ->Int {
    var slow=head
    var fast=head
    while slow != nil && fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        if slow === fast {
            return countlength(n: slow!)
        }
    }
    return 0
}

// Question: Find total Nodes in the Linked List
func countlength(n: ListNode)->Int {
    var counter = 1
    var temp = n
    while temp.next !== n {
        counter+=1
        temp = temp.next!
    }
    return counter
}

var linkListForCycle =  ListNode(1, ListNode(2, ListNode(3,ListNode(4, ListNode(5)))))
// Pending:createLinkListLoop(head: linkListForCycle, fromValue: 2, toValue: 4)

let loopLength = detectloopLength(head: linkListForCycle)
//print("The length of the linked list loop is ",loopLength)


// Question: Detect if link list has a cycle in it?

func hasCycle(_ head: ListNode?) -> Bool {
    var slow = head
    var fast = head?.next
    
    while slow != nil, fast != nil {
        guard slow !== fast else { return true }
        
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    return false
}

// Quetion find the starting point where the linked list loop is started.

func detectCycleStartingNode(_ head: ListNode?) -> ListNode? {
    guard head?.next != nil else { return nil }
    var slow = head
    var fast = head
    // Two pointer approach where fast is moving two time faster than slow.
    while slow?.next != nil || fast?.next?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        guard slow !== fast else { break }
    }
    
    slow = head// point slow to head because we will start from head onwards and find where slow === fast <Because the first loop is exited there only>
    while slow !== fast {
        slow = slow?.next
        fast = fast?.next
    }
    return slow
}

// Question: ODD Even Link List sorting
func oddEvenList(_ head: ListNode?) -> ListNode? {
    var oddHead = head
    var evenHead = head?.next
    var evenOrignalHead = head?.next
    while evenHead != nil && evenHead?.next != nil {
        oddHead?.next = evenHead?.next // Step A
        oddHead = oddHead?.next // Step B
        evenHead?.next = oddHead?.next// Step C
        evenHead = evenHead?.next// Step D
    }
    oddHead?.next = evenOrignalHead // Step E
    return head
}
/*Example
Input: head = [1,2,3,4,5]
Output: [1,3,5,2,4]*/

let oddEvenLinkedList = ListNode(1, ListNode(2, ListNode(3,ListNode(4, ListNode(5)))))
let oddEvenSort = oddEvenList(oddEvenLinkedList)!
//print("After oddEvenSort LinkList is--- ", oddEvenSort)// 1->3->5->2->4


// Question: -  Sort Linked list #Approach--MergeSort.
func sortList(_ head: ListNode?) -> ListNode? {
    if head?.next == nil { return head }
    
    var slow = head
    var fast = head?.next
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    let leftHalf = head
    let rightHalf = slow?.next
    
    slow?.next = nil// to make exact left half(break link list into two parts.)
    
    var currLeft = sortList(leftHalf)
    var currRight = sortList(rightHalf)
    
    let answer = ListNode(-1)
    var curr: ListNode? = answer
    
    while currLeft != nil || currRight != nil {
        if currLeft?.val ?? Int.max <= currRight?.val ?? Int.max {
            curr?.next = currLeft
            currLeft = currLeft?.next
        } else {
            curr?.next = currRight
            currRight = currRight?.next
        }
        
        curr = curr?.next
    }
    return answer.next
}

let unsortedLinkList = ListNode(5, ListNode(11, ListNode(10,ListNode(1, ListNode(5)))))
let afterSort = sortList(unsortedLinkList)!
//print("After sort LinkList cycle is--- ", afterSort)// 1->5->5->10->11

// Question check is the linked list is palidrome.
func isPalindrome(_ head: ListNode?) -> Bool {
    if head == nil {
        return true
    }
    var headCopy = head
    var middleNode = findMiddle(head)
    middleNode = reverseList2(middleNode)
    while middleNode != nil {
        if headCopy?.val != middleNode?.val {
            return false
        }
        headCopy = headCopy?.next
        middleNode = middleNode?.next
    }
    return true
}
// Question: Find Middle Nde from Linked list.
func findMiddle(_ head: ListNode?) -> ListNode? {
    var slow = head, fast = head
    while fast?.next != nil && fast != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    return slow
}

var palindromeLinkedList = ListNode(5, ListNode(1, ListNode(10,ListNode(1, ListNode(5)))))

let isPalindrom = isPalindrome(palindromeLinkedList)
//print("LinkList isPalindrom --- ", isPalindrom) // true


// Question: Add one to linked list:
/* Adds one to a linked lists and return the head
 node of resultant list */
func addOneUtil(_ head: ListNode?) -> ListNode? {
    let res = head // res is head node of the resultant list
    var temp: ListNode?
    var headCopy = head
    var carry = 1, sum = 0
    
    while headCopy != nil {
        // Calculate value of next digit in resultant list. The next digit is sum of following things (i) Carry (ii) Next digit of head list (if there is a next digit)
        sum = carry + headCopy!.val
        
        // update carry for next calculation
        carry = (sum >= 10) ? 1 : 0
        
        // update sum if it's greater than 10
        sum = sum % 10
        
        // Create a new node with sum as data
        headCopy?.val = sum
        
        // Move head and second pointers to next nodes
        temp = headCopy
        headCopy = headCopy?.next
    }
    
    // if some carry is still there, add a new node to result list. example 999+1 = 1000 where 0 is new node.
    if carry > 0 {
        temp?.next = ListNode(carry)
    }
    return res// return head of the resultant list
}

// Question Add One to the linkedList items
// This function mainly uses addOneUtil().
/**
 Below are the steps :
 
 Reverse given linked list. For example, 1-> 9-> 9 -> 9 is converted to 9-> 9 -> 9 ->1.
 Start traversing linked list from leftmost node and add 1 to it. If there is a carry, move to the next node. Keep moving to the next node while there is a carry.
 Reverse modified linked list and return head.
 */
func addOne(_ head: ListNode?) -> ListNode? {
    var headCopy = head
    // Reverse linked list
    headCopy = reverseList2(headCopy)
    // Add one from left to right of reversed list
    headCopy = addOneUtil(headCopy)
    // Reverse the modified list
    return reverseList2(headCopy)
}

var linkListForAddOne =  ListNode(9, ListNode(9, ListNode(9)))
let addedOneList = addOne(linkListForAddOne)
//print("addedOne to the linkedList  --", addedOneList!)// 1->0->0->0

// Question # Get IntersectionNode
func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    if headA == nil || headB == nil { return nil }
    var a = headA, b = headB
    // Where a & b node has same reference means it's a intersaction point
    while a !== b {
        a = a == nil ? headB : a?.next
        b = b == nil ? headA : b?.next
        // print("Dry run Value of a--", a, " Value of b ---", b)
    }
    // print("a", a, "b", b)
    return a
}

// Example for No intersection Array
//         let intersecOne =  ListNode(1, ListNode(2))
//         let intersecTwo = ListNode(1)
let interSect = ListNode(3, ListNode(4))
let intersecOne = ListNode(1, ListNode(2, interSect))
let intersecTwo = ListNode(2, interSect)
// Example: Intersection @3 Node
let foundIntersectionNode = getIntersectionNode(intersecOne, intersecTwo)
//print("Found Intersection Node--->", foundIntersectionNode!) // 3->4

// TC: O(n)
// SC: O(n)
// Question Sort Linked List based on 0's 1's 2s...
func sortList012(_ head: ListNode?) {
    var count = [ 0, 0, 0 ]
    // Count the number of 0's, 1's, and 2's in the
    // linked list
    var current = head
    while current != nil {
        count[current!.val]+=1// Filling respective index like count of 0's 1's & 2's
        current = current?.next
    }
    // Overwrite the linked list with the sorted
    // elements
    current = head
    var i = 0
    while current != nil {
        if count[i] == 0 {
            i+=1
        } else {
            current?.val = i
            count[i]-=1
            current = current?.next
        }
    }
}

let zeroOneTwoLinkedList = ListNode(1, ListNode(2, ListNode(0,ListNode(2, ListNode(0)))))
sortList012(zeroOneTwoLinkedList)
//print("sorted by 0,1,2", zeroOneTwoLinkedList)
