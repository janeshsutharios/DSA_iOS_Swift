https://getsdeready.com/courses/dsa/lesson/largest-perimeter-triangle/?course=573
// https://leetcode.com/problems/largest-perimeter-triangle/description/
class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        if nums.count < 3 { return 0 }
        let sorted = nums.sorted()
        for i in stride(from: sorted.count - 3, through: 0, by: -1) {
            let a = sorted[i]
            let b = sorted[i + 1]
            let c = sorted[i + 2]
            if a + b > c {
                return a + b + c
            }
        }
        return 0
    }
}
// https://getsdeready.com/courses/dsa/lesson/longest-palindrome/
// https://leetcode.com/problems/longest-palindrome/description/
class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var freq: [Character: Int] = [:]
        var length = 0
        // Rule 1: Use all even counts completely c = 4 → use all 4 → 2 on left, 2 on right
        for char in s {
            freq[char, default: 0] += 1
            if freq[char]! % 2 == 0 {
                length += 2
            } 
        }
     //Odd But we can use one of them as the center character in the palindrome.
     // Example: bccaccb
        for value in freq.values {
            if value % 2 != 0 {
                length += 1
                break
            }
        }
        return length
    }
}
