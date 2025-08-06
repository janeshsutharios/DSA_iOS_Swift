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

// https://getsdeready.com/courses/dsa/lesson/maximum-sum-with-exactly-k-elements/
// https://leetcode.com/problems/maximum-sum-with-exactly-k-elements/description/
class Solution {

    func maximizeSum(_ nums: [Int], _ k: Int) -> Int {
        guard k > 0, !nums.isEmpty else { return 0 }
        let max = nums.max()!
         // Apply formula: k*x + (k * (k - 1)) / 2
         let total = k*max + (k * (k - 1)) / 2
         return total
    }
}

// Brute force
// class Solution {
//     func maximizeSum(_ nums: [Int], _ k: Int) -> Int {
//        var nums = nums
//        var sum = nums.max()! 
//        var numMax = nums.max()!
//        var k = k
//        while k > 1 {
//         numMax += 1
//         sum += numMax
//         k -= 1
//        }
//        return sum
//     }
// }

// https://getsdeready.com/courses/dsa/lesson/minimum-moves-to-convert-string/
// https://leetcode.com/problems/minimum-moves-to-convert-string/
class Solution {
    func minimumMoves(_ s: String) -> Int {
        let chars = Array(s)
        var moves = 0
        var index = 0
        let n = chars.count
        
        while index < n {
            if chars[index] == "X" {
                moves += 1
                index += 3  // Skip next two characters
            } else {
                index += 1
            }
        }
        return moves
    }
}

