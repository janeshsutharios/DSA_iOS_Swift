// https://getsdeready.com/courses/dsa/lesson/is-subsequence/
// https://leetcode.com/problems/is-subsequence/
class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var sIndex = s.startIndex
        var tIndex = t.startIndex
        
        while sIndex < s.endIndex && tIndex < t.endIndex {
            if s[sIndex] == t[tIndex] {
                s.formIndex(after: &sIndex)
            }
            t.formIndex(after: &tIndex)
        }
        
        return sIndex == s.endIndex
    }
}

/*class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let sChars = Array(s)
        let tChars = Array(t)
        
        var sIndex = 0
        var tIndex = 0
        
        while sIndex < sChars.count && tIndex < tChars.count {
            if sChars[sIndex] == tChars[tIndex] {
                sIndex += 1
            }
            tIndex += 1
        }
        
        return sIndex == sChars.count
    }
}
*/

// https://getsdeready.com/courses/dsa/lesson/check-if-n-and-its-double-exist/
// https://leetcode.com/problems/check-if-n-and-its-double-exist/description/
class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        var dict: [Int: Bool] = [:]  // stores seen numbers

        for num in arr {
            // check if current number has a double or half in the map
            if dict[2 * num] == true || (num % 2 == 0 && dict[num / 2] == true) {
                return true
            }
            dict[num] = true  // mark this number as seen
        }

        return false
    }
}

// https://getsdeready.com/courses/dsa/lesson/squares-of-a-sorted-array/
// https://leetcode.com/problems/squares-of-a-sorted-array/
class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        // Initialize result array with same length as nums, filled with 0s
        var result = Array(repeating: 0, count: nums.count)
        
        // Two pointers: start and end of the array
        var left = 0
        var right = nums.count - 1
        
        // Position to insert next largest square (from end to start)
        var pos = nums.count - 1

        // Loop while left <= right
        while left <= right {
            // Square both ends
            let leftSq = nums[left] * nums[left]
            let rightSq = nums[right] * nums[right]
            
            if leftSq > rightSq {
                // Place the larger square at the current position
                result[pos] = leftSq
                left += 1  // Move left pointer forward
            } else {
                result[pos] = rightSq
                right -= 1  // Move right pointer backward
            }
            pos -= 1  // Move position backward
        }

        return result  // Return the sorted squares
    }
}
// https://getsdeready.com/courses/dsa/lesson/count-of-pairs-with-the-given-sum/
// https://leetcode.com/problems/finding-pairs-with-a-certain-sum/
class FindSumPairs {
    var nums1: [Int]
    var nums2: [Int]
    var freqMap: [Int: Int]  // Maps each number in nums2 to its frequency (count)

    init(_ nums1: [Int], _ nums2: [Int]) {
        self.nums1 = nums1
        self.nums2 = nums2
        self.freqMap = [:]

        // Initialize frequency map with values from nums2
        for num in nums2 {
            freqMap[num, default: 0] += 1
        }
    }

    func add(_ index: Int, _ val: Int) {
        let oldVal = nums2[index]              // Value currently at the index
        let newVal = oldVal + val              // New value after adding

        nums2[index] = newVal                  // Update the value in nums2

        // Update frequency map: decrement old value's count
        freqMap[oldVal]! -= 1                  // Safe to force unwrap because oldVal must exist

        // If old value's frequency becomes zero, remove it for cleanliness
        if freqMap[oldVal]! == 0 {
            freqMap.removeValue(forKey: oldVal)
        }

        // Increment new value's frequency
        freqMap[newVal, default: 0] += 1
    }

    func count(_ tot: Int) -> Int {
        var result = 0

        // For each number in nums1, find how many numbers in nums2 can form tot
        for num in nums1 {
            let complement = tot - num        // What value we need from nums2
            result += freqMap[complement, default: 0] // Add its count (0 if not present)
        }
        return result
    }
}

// https://getsdeready.com/courses/dsa/lesson/minimum-size-subarray-sum-2/
// https://leetcode.com/problems/minimum-size-subarray-sum/
class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var minLength = Int.max  // Stores the minimum length found
        var windowStart = 0      // Start index of the sliding window
        var currentSum = 0       // Sum of elements in the current window
        
        for (windowEnd, value) in nums.enumerated() {
            currentSum += value  // Expand the window by adding the current value
            
            // Shrink the window from the left while the sum is sufficient
            while currentSum >= target, windowStart <= windowEnd {
                minLength = min(minLength, windowEnd - windowStart + 1)
                currentSum -= nums[windowStart]  // Remove value at window start
                windowStart += 1  // Move start forward
            }
        }

        // If minLength was never updated, return 0
        return minLength == .max ? 0 : minLength
    }
}
// https://getsdeready.com/courses/dsa/lesson/minimize-the-absolute-difference/
// https://leetcode.com/problems/minimum-absolute-difference/description/

class Solution {
    func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
        let sorted = arr.sorted()
        var minDiff = Int.max
        var result = [[Int]]()

        for i in 1..<sorted.count {
            let diff = sorted[i] - sorted[i - 1]
            
            if diff < minDiff {
                minDiff = diff
                result = [[sorted[i - 1], sorted[i]]]
            } else if diff == minDiff {
                result.append([sorted[i - 1], sorted[i]])
            }
        }

        return result
    }
}

// https://getsdeready.com/courses/dsa/lesson/container-with-most-water/
// https://leetcode.com/problems/container-with-most-water/
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var maxArea = 0

        while left < right {
            let minHeight = min(height[left], height[right])
            let width = right - left
            let area = minHeight * width
            maxArea = max(maxArea, area)

            // Move the pointer with the smaller height
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }

        return maxArea
    }
}
// https://leetcode.com/discuss/post/241808/google-onsite-two-sum-closest-to-target-qmjzs/
// https://getsdeready.com/courses/dsa/lesson/given-two-sorted-arrays-number-x-find-pair-whose-sum-closest-x/
class Solution {
    func twoSumClosest(_ nums: [Int], _ target: Int) -> [Int] {
        let sorted = nums.sorted()
        var left = 0, right = sorted.count - 1
        var closestSum = Int.max
        var result: [Int] = []

        while left < right {
            let sum = sorted[left] + sorted[right]
            let diff = abs(sum - target)

            if diff < abs(closestSum - target) {
                closestSum = sum
                result = [sorted[left], sorted[right]]
            }

            if sum < target {
                left += 1
            } else {
                right -= 1
            }
        }

        return result
    }
}
// https://getsdeready.com/courses/dsa/lesson/trapping-rain-water/
// https://leetcode.com/problems/trapping-rain-water/description/
class Solution {
    func trap(_ elevationMap: [Int]) -> Int {
        var leftIndex = 0
        var rightIndex = elevationMap.count - 1
        var maxLeftHeight = elevationMap[leftIndex]
        var maxRightHeight = elevationMap[rightIndex]
        var totalTrappedWater = 0
        
        while leftIndex < rightIndex {
            if elevationMap[leftIndex] < elevationMap[rightIndex] {
                maxLeftHeight = max(maxLeftHeight, elevationMap[leftIndex])
                totalTrappedWater += maxLeftHeight - elevationMap[leftIndex]
                leftIndex += 1
            } else {
                maxRightHeight = max(maxRightHeight, elevationMap[rightIndex])
                totalTrappedWater += maxRightHeight - elevationMap[rightIndex]
                rightIndex -= 1
            }
        }
        
        return totalTrappedWater
    }
}

// https://getsdeready.com/courses/dsa/lesson/longest-chunked-palindrome-decomposition/
// https://leetcode.com/problems/longest-chunked-palindrome-decomposition/description/
class Solution {
    func longestDecomposition(_ text: String) -> Int {
        // Initialize the result counter
        var res = 0
        
        // Convert the input string to an array for easier indexing
        let textArray = Array(text)
        let n = textArray.count
        
        // Initialize pointers for the left and right ends of the string
        var left = 0
        var right = n - 1
        
        // Strings to build segments from left and right
        var lStr = ""
        var rStr = ""

        // Process the string from both ends towards the center
        while left <= right {
            // Build the left segment by appending characters from the left pointer
            lStr.append(textArray[left])
            
            // Build the right segment by prepending characters from the right pointer
            // (This maintains the correct order for comparison)
            rStr = String(textArray[right]) + rStr
            
            // When the left and right segments match
            if lStr == rStr {
                // If pointers meet at the same character, count as 1 segment
                // Otherwise count as 2 segments (one from left, one from right)
                res += left == right ? 1 : 2
                
                // Reset the segments for new comparisons
                lStr = ""
                rStr = ""
            }
            
            // Move the pointers towards the center
            left += 1
            right -= 1
        }
        
        // If there are any remaining characters that didn't form matching pairs
        // (This counts as one additional segment in the middle)
        if !lStr.isEmpty || !rStr.isEmpty {
            res += 1
        }
        
        // Return the total count of segments
        return res
    }
}
