/// Adds one to a number represented as an array of digits.
/// - Parameter digits: An array of digits representing a non-negative integer.
/// - Returns: A new array of digits representing the number plus one.
func plusOne(_ digits: [Int]) -> [Int] {
    var result = digits
    let lastIndex = result.count - 1

    // Traverse the digits array from right to left
    for index in stride(from: lastIndex, through: 0, by: -1) {
        if result[index] < 9 {
            // If the digit is less than 9, just increment and return early
            result[index] += 1
            return result
        } else {
            // If digit is 9, set it to 0 and continue to carry over
            result[index] = 0
        }
    }

    // If all digits were 9 (e.g., [9, 9, 9]), add an extra leading 1
    // Example: [9, 9, 9] -> [1, 0, 0, 0]
    var expandedResult = [Int](repeating: 0, count: result.count + 1)
    expandedResult[0] = 1
    return expandedResult
}
//  Test with [1,9,9] [1,4,3] [9,9,9]

// https://leetcode.com/problems/check-if-array-is-sorted-and-rotated/description/
// 
class Solution {
    func check(_ nums: [Int]) -> Bool {
        let count = nums.count
        var rotationBreaks = 0

        // Check for places where the array is not in non-decreasing order.
        for index in 0..<count {
            let nextIndex = (index + 1) % count  // Wrap around to handle rotation
            //This wraps around the array using the modulus operator % to avoid going out of bounds.
            if nums[index] > nums[nextIndex] {
                rotationBreaks += 1
            }
        }
        // Valid only if there's at most one break in the sorted order
        return rotationBreaks <= 1
    }
}
/* Modulo wraps around the array using the modulus operator % to avoid going out of bounds.
| i | (i + 2) % 5 | A\[(i + 2) % 5] | B\[i] |
| - | ----------- | --------------- | ----- |
| 0 | 2           | A\[2] = 3       | 3     |
| 1 | 3           | A\[3] = 4       | 4     |
| 2 | 4           | A\[4] = 5       | 5     |
| 3 | 0           | A\[0] = 1       | 1     |
| 4 | 1           | A\[1] = 2       | 2     |
*/

//https://leetcode.com/problems/find-peak-element/
//Time: O(log n) (binary search)
//Space: O(1)
class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1

        while left < right {
            let mid = (left + right) / 2
            if nums[mid] > nums[mid + 1] {
                // Peak is in the left half (including mid)
                right = mid
            } else {
                // Peak is in the right half
                left = mid + 1
            }
        }

        // left and right have converged to a peak element index
        return left
    }
}
//https://leetcode.com/problems/sqrtx/
//Time: O(log n) (binary search)
//Space: O(1)
class Solution {
    func integerSquareRoot(_ number: Int) -> Int {
        // Special case: square root of 0 is 0
        if number == 0 { return 0 }

        var low = 1
        var high = number

        // Binary search for the integer square root
        while low <= high {
            let mid = (low + high) / 2
            let midSquared = mid * mid

            if midSquared == number {
                // Exact square root found
                return mid
            } else if midSquared < number {
                // Move right to search larger values
                low = mid + 1
            } else {
                // Move left to search smaller values
                high = mid - 1
            }
        }

        // When not a perfect square, return floor of square root
        return high
    }
}

