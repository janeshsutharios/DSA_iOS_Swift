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
