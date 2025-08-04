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

