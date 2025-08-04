// https://getsdeready.com/courses/dsa/lesson/take-gifts-from-the-richest-pile/
// https://leetcode.com/problems/take-gifts-from-the-richest-pile/
import Collections // This is Apple DSA package

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
//  heap.popMax() Optional type
//  heap.removeMax() NON_Optional type
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
