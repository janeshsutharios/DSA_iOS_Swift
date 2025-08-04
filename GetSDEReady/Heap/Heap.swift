import Collections // This is Apple DSA package

//  heap.popMax() Optional type
//  heap.removeMax() NON_Optional type

-----------

// https://getsdeready.com/courses/dsa/lesson/take-gifts-from-the-richest-pile/
// https://leetcode.com/problems/take-gifts-from-the-richest-pile/
class Solution {
    func pickGifts(_ gifts: [Int], _ k: Int) -> Int {
        var heap = Heap<Int>(), totalGifts = 0
        for ele in gifts {
            heap.insert(ele)
        }
        var i = 0
        while i < k {
            let max = heap.removeMax()
            let remainingGifts = Int(floor(sqrt(Double(max))))
            heap.insert(remainingGifts)
             i += 1
        } 

        while !heap.isEmpty {
          totalGifts += heap.removeMax()
        }
        return totalGifts    
    }
}
/*
import Collections
import Foundation

class Solution {
    func pickGifts(_ gifts: [Int], _ k: Int) -> Int {
        var heap = Heap<Int>()
        heap.insert(contentsOf: gifts)
        
        for i in 0..<k {
            if let mx = heap.popMax() {
                let sq = Int(Double(mx).squareRoot())
                heap.insert(sq)
            }
        }
        
        return heap.unordered.reduce(0, +)
    }
}
*/

// https://getsdeready.com/courses/dsa/lesson/delete-greatest-value-in-each-row/
// https://leetcode.com/problems/delete-greatest-value-in-each-row/description/
class Solution {
    func deleteGreatestValue(_ grid: [[Int]]) -> Int {
        var sortedGrid = grid.map { $0.sorted() }  // Sort each row
        let m = sortedGrid.count       // number of rows
        let n = sortedGrid[0].count    // number of columns (assumed same length)
        
        var result = 0
        
        // Traverse column-wise (since rows are sorted ascending)
        // Think about verticle scanning.
        for col in 0..<n {
            var maxVal = 0
            for row in 0..<m {
                maxVal = max(maxVal, sortedGrid[row][col])
            }
            result += maxVal
        }
        
        return result
    }
}

// https://getsdeready.com/courses/dsa/lesson/make-array-zero-by-subtracting-equal-amounts/
// https://leetcode.com/problems/make-array-zero-by-subtracting-equal-amounts/description/
class Solution {
    
    func minimumOperations(_ nums: [Int]) -> Int {
        // Simple: as we have to chose number from array from low to high hence Set is perfectly store non - dup values.
        var unique = Set<Int>()
        
        for num in nums {
            if num != 0 {
                unique.insert(num)
            }
        }
        return unique.count
    }
}

// https://getsdeready.com/courses/dsa/lesson/minimum-amount-of-time-to-fill-cups/
// https://leetcode.com/problems/minimum-amount-of-time-to-fill-cups/

class Solution {
    func fillCups(_ amount: [Int]) -> Int {
        var heap = Heap(amount)
        var result = 0
        
        while let cup1 = heap.popMax(), cup1 > 0 {
            let cup2 = heap.popMax()! - 1
            heap.insert(cup1 - 1)
            heap.insert(cup2)
            result += 1
        }
        return result
    }
}

// https://getsdeready.com/courses/dsa/lesson/kth-largest-element-in-an-array/
// https://leetcode.com/problems/kth-largest-element-in-an-array/
struct MinHeap<T: Comparable> {
    var elements: [T] = []

    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }
    var peek: T? { elements.first }

    mutating func insert(_ value: T) {
        elements.append(value)
        siftUp(from: elements.count - 1)
    }

    @discardableResult
    mutating func remove() -> T? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let value = elements.removeLast()
        siftDown(from: 0)
        return value
    }

    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && elements[child] < elements[parent] {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    private mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent
            if left < elements.count && elements[left] < elements[candidate] {
                candidate = left
            }
            if right < elements.count && elements[right] < elements[candidate] {
                candidate = right
            }
            if candidate == parent { break }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var heap = MinHeap<Int>()
        for num in nums {
            heap.insert(num)
            
            if heap.count > k {
                heap.remove()
            }
        }
        return heap.peek!
        
    }
}

// https://getsdeready.com/courses/dsa/lesson/merge-k-sorted-lists/
// https://leetcode.com/problems/merge-k-sorted-lists/

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
import Foundation
import Collections

extension ListNode: Comparable {
    public static func < (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val < rhs.val
    }

    public static func > (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val > rhs.val
    }

    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs === rhs
    }   
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else { return nil }

        var heap = Heap<ListNode>()

        for list in lists {
            if let head = list {
                heap.insert(head)
            }
        }

        let dummy = ListNode(0)
        var current: ListNode? = dummy

        while let minimum = heap.popMin() {
            current?.next = minimum
            current = current?.next

            if let next = minimum.next {
                heap.insert(next)
            }
        }

        return dummy.next
    }
}

// https://getsdeready.com/courses/dsa/lesson/b-closest-points-to-origin/
// https://leetcode.com/problems/k-closest-points-to-origin/description/

class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        // Max-heap to keep track of the k closest points
        var maxHeap = CustomHeap<(distance: Int, point: [Int])>(sort: { $0.distance > $1.distance })
        
        for point in points {
            let dist = point[0] * point[0] + point[1] * point[1]
            
            if maxHeap.count < k {
                maxHeap.insert((dist, point))
            } else if dist < maxHeap.peek()!.distance {
                maxHeap.remove()
                maxHeap.insert((dist, point))
            }
        }
        
        return maxHeap.map { $0.point }
    }
}

// Helper Heap implementation
struct CustomHeap<T> {
    private var elements = [T]()
    private let sort: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func peek() -> T? {
        return elements.first
    }
    
    mutating func insert(_ value: T) {
        elements.append(value)
        siftUp(from: elements.count - 1)
    }
    
    @discardableResult
    mutating func remove() -> T? {
        guard !elements.isEmpty else { return nil }
        
        if elements.count == 1 {
            return elements.removeLast()
        } else {
            let value = elements[0]
            elements[0] = elements.removeLast()
            siftDown(from: 0)
            return value
        }
    }
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(of: child)
        
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(of: child)
        }
    }
    
    private mutating func siftDown(from index: Int) {
        var parent = index
        
        while true {
            let left = leftChildIndex(of: parent)
            let right = rightChildIndex(of: parent)
            var candidate = parent
            
            if left < elements.count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            
            if right < elements.count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            
            if candidate == parent {
                return
            }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }
    
    private func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }
}

// For getting the array of points
extension CustomHeap {
    func map<U>(_ transform: (T) -> U) -> [U] {
        return elements.map(transform)
    }
}

/*class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        return points
        .sorted { ($0[0] * $0[0] + $0[1] * $0[1]) < ($1[0] * $1[0] + $1[1] * $1[1]) }
        .prefix(k)
        .map { $0 }
    }
 }*/



/*class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
 
        // Store tuples of (distance, point)
        var distances: [(Int, [Int])] = []
 
        for point in points {
            let x = point[0]
            let y = point[1]
            let distance = x * x + y * y  // No need for sqrt
             distances.append((distance, point))
        }
 
         // Sort by distance
          let sorted = distances.sorted { $0.0 < $1.0 }
 
        // Extract first k points
        let result = sorted.prefix(k).map { $0.1 }
        return result
 }
 }
 */
