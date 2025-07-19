// https://getsdeready.com/courses/dsa/lesson/merge-two-sorted-lists-2/
// https://leetcode.com/problems/merge-two-sorted-lists/description/
// Solution #1 Using Loop
class Solution {
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var list1 = list1
        var list2 = list2
        let preHead = ListNode()
        var tail = preHead
        while list1 != nil && list2 != nil {
            if list1!.val < list2!.val {
                tail.next = list1
                list1 = list1?.next
            } else {
                tail.next = list2
                list2 = list2?.next
            }
            tail = tail.next!
        }
        tail.next = list1 == nil ? list2 : list1
        return preHead.next
    }
}
// Solution #1 Using Recursion
/*
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // Base cases
        guard let list1 = list1 else { return list2 }
        guard let list2 = list2 else { return list1 }
        
        if list1.val < list2.val {
            list1.next = mergeTwoLists(list1.next, list2)
            return list1
        } else {
            list2.next = mergeTwoLists(list1, list2.next)
            return list2
        }
    }
}
*/


// https://getsdeready.com/courses/dsa/lesson/palindrome-linked-list/
// https://leetcode.com/problems/palindrome-linked-list/description/
class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        
        // Step 1: Find the midpoint using slow and fast pointers
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        // Step 2: Reverse the second half of the list
        var prev: ListNode? = nil
        var current = slow
        while current != nil {
            let nextNode = current?.next
            current?.next = prev
            prev = current
            current = nextNode
        }

        // Step 3: Compare the first and the reversed second half
        var firstHalf = head
        var secondHalf = prev
        while secondHalf != nil {
            if firstHalf?.val != secondHalf?.val {
                return false
            }
            firstHalf = firstHalf?.next
            secondHalf = secondHalf?.next
        }

        return true
    }
}

// https://getsdeready.com/courses/dsa/lesson/intersection-of-two-linked-lists/
// https://leetcode.com/problems/intersection-of-two-linked-lists/
class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var pointerA = headA
        var pointerB = headB
        
        // Traverse both lists
        while pointerA !== pointerB {
            pointerA = pointerA == nil ? headB : pointerA?.next
            pointerB = pointerB == nil ? headA : pointerB?.next
        }
        
        // Either both are nil (no intersection) or both meet at intersection
        return pointerA
    }
}

// https://getsdeready.com/courses/dsa/lesson/middle-of-the-linked-list/
// https://leetcode.com/problems/middle-of-the-linked-list/description/
class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var fastNode = head
        var slowNode = head

        while fastNode != nil && fastNode?.next != nil {
            fastNode = fastNode?.next?.next
            slowNode = slowNode?.next
        }

        return slowNode
    }
}
