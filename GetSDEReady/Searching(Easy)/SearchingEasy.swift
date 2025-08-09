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

// https://getsdeready.com/courses/dsa/lesson/binary-search/
// https://leetcode.com/problems/binary-search/
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count - 1
        // Divide the array until we got mid element as target element.
        while low <= high {
            let mid = (low + high) / 2
            if nums[mid] == target {
                return mid
            } else if target > nums[mid] {// If target is greater increase low pointer
                low = mid + 1
            } else {// If target is lesser decrease high pointer
                high = mid - 1
            }
        }
        return -1
    }
}
/**
func findElementUsingBinarySearchUsingRecursion(nums: [Int], target: Int, low: inout Int, high: inout Int) -> Int {
    if low > high { return -1 }// Base case.
    var mid = (low + high) / 2
    if nums[mid] == target {
        return mid
    } else if target > nums[mid] {// If target is greater increase low pointer
        low = mid + 1
    } else {// If target is lesser decrease high pointer
        high = mid - 1
    }
    // Divide the array until we got mid element as target element.
    return findElementUsingBinarySearchUsingRecursion(nums: nums, target: target, low: &low, high: &high)
}
*/
