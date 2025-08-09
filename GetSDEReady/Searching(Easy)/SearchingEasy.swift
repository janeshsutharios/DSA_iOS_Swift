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

// https://getsdeready.com/courses/dsa/lesson/count-negative-numbers-in-a-sorted-matrix/
// https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix/
class Solution {
    func countNegatives(_ grid: [[Int]]) -> Int {
        var totalCount = 0
        
        for row in grid {
            totalCount += countNegativesInRow(row)
        }
        
        return totalCount
    }
    
    // Counts how many negative numbers are in a single sorted row
    private func countNegativesInRow(_ arr: [Int]) -> Int {
        var low = 0
        var high = arr.count - 1
        
        // Binary search to find the first negative number
        while low <= high {
            let mid = low + (high - low) / 2
            
            if arr[mid] < 0 {
                // Might be the first negative — search left
                high = mid - 1
            } else {
                // Still non-negative — search right
                low = mid + 1
            }
        }
        
        // 'low' is now the index of the first negative element
        // If low == arr.count → no negatives in this row
        return arr.count - low
    }
}
// https://getsdeready.com/courses/dsa/lesson/check-if-array-is-sorted-and-rotated/
// https://leetcode.com/problems/check-if-array-is-sorted-and-rotated/
class Solution {
    func check(_ nums: [Int]) -> Bool {
        let count = nums.count
        var rotationBreaks = 0

        // Check for places where the array is not in non-decreasing order.
        for index in 0..<count {
            let nextIndex = (index + 1) % count  // next index but it will give 0 for last index
            // 
            if nums[index] > nums[nextIndex] {
                rotationBreaks += 1
            }
        }

        // Valid only if there's at most one break in the sorted order
        return rotationBreaks <= 1
    }
}

class Solution {
    func check(_ nums: [Int]) -> Bool {
        let n = nums.count
        
        // Special cases
        if n <= 2 { return true }
        
        // Step 1: Find pivot index (smallest element)
        let pivot = findPivot(nums)
        
        // Step 2: Check if array is sorted from pivot to end
        for i in 1..<n {
            let prev = (pivot + i - 1) % n
            let curr = (pivot + i) % n
            if nums[prev] > nums[curr] {
                return false
            }
        }
        
        return true
    }
    
    // Binary search to find index of smallest element (rotation pivot)
    private func findPivot(_ nums: [Int]) -> Int {
        var low = 0
        var high = nums.count - 1
        
        while low < high {
            let mid = low + (high - low) / 2
            if nums[mid] > nums[high] {
                // Pivot is in right half
                low = mid + 1
            } else {
                // Pivot is in left half (including mid)
                high = mid
            }
        }
        return low
    }
}
