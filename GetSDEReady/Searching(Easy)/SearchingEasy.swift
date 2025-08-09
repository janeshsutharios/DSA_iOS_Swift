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
// https://getsdeready.com/courses/dsa/lesson/intersection-of-two-array-ii/
// https://leetcode.com/problems/intersection-of-two-arrays-ii/
class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var counts = [Int: Int]()   // Dictionary to store frequency of elements in nums1
        var result = [Int]()        // Stores the intersection result
        
        // Step 1: Count frequency of each number in nums1
        for num in nums1 {
            counts[num, default: 0] += 1
        }
        
        // Step 2: Iterate through nums2 and check if the number exists in counts
        for num in nums2 {
            if let cnt = counts[num], cnt > 0 {
                result.append(num)   // Common element found, add to result
                counts[num]! -= 1    // Decrement count to avoid reusing element
            }
        }
        
        // Step 3: Return intersection array
        return result
    }
}

