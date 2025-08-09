// https://getsdeready.com/courses/dsa/lesson/sqrtx-2/?course=573
// https://leetcode.com/problems/sqrtx/description/
class Solution {
    func mySqrt(_ x: Int) -> Int {
        // Using Binary Search
       if x < 2 { return x }
        var low = 1
        var high = x
        // Binary search on the answers:
        while low <= high {
            let mid = (low + high) / 2
            if mid * mid <= x {
                // Eliminate the left half:
                low = mid + 1
            } else {
                // Eliminate the right half:
                high = mid - 1
            }
        }
        return high
        // var i = 0
        // while i*i <= x {
        //     i += 1
        // }
        // return i-1
    }
}
