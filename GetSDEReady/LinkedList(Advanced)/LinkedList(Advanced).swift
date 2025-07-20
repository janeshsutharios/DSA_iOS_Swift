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
// https://getsdeready.com/courses/dsa/lesson/linked-list-cycle/ already solved..
