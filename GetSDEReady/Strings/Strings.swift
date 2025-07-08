// Question - https://getsdeready.com/courses/dsa/lesson/repeated-substring-pattern/
// Answer - https://claude.ai/public/artifacts/ec97db0e-8270-4b83-89bc-de66c54e1f60
//https://leetcode.com/problems/repeated-substring-pattern/
class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        let n = s.count                     // Total length of the string
        let chars = Array(s)               // Convert string to array of characters for easy indexing

        // Try all possible substring lengths from 1 to n/2
        for index in 1..<(n / 2 + 1) {
            // The total length must be divisible by the substring length
            // Otherwise, it cannot be repeated evenly
            if n % index != 0 {
                // we’re just saying "this length can't be valid, try next".
                // Example s = "abcabcabc"   // n = 9
                continue
            }

            var match = true               // Assume it's a match unless proven otherwise

            // Start comparing from index 'index' up to 'n-1'
            for i in index..<n {
                  // ✅ Can you cut 12 meters into 3-meter pieces? Yes! (12 % 3 == 0)
                //❌ Can you cut it into 5-meter pieces? No! (12 % 5 == 2)
                if chars[i] != chars[i % index] {
                    match = false          // Mismatch found
                    break                  // No need to continue this pattern length
                }
            }

            if match {
                return true                // Found a valid repeating pattern
            }
        }

        return false                       // No valid repeating pattern found
    }
}
// Solution #2: Swift way 
/*
class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        let doubled = s + s
        let trimmed = doubled.dropFirst().dropLast()
        return trimmed.contains(s)
    }
}
*/

// 
// https://leetcode.com/problems/valid-palindrome-ii/description/
class Solution {
    func validPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        var left = 0
        var right = chars.count - 1

        // Helper function to check if a substring is palindrome
        func isPalindrome(_ l: Int, _ r: Int) -> Bool {
            var i = l, j = r
            while i < j {
                if chars[i] != chars[j] {
                    return false
                }
                i += 1
                j -= 1
            }
            return true
        }

        while left < right {
            if chars[left] != chars[right] {
                // Try skipping either left or right character
                return isPalindrome(left + 1, right) || isPalindrome(left, right - 1)
            }
            left += 1
            right -= 1
        }

        return true
    }
}

class Solution {
    func validPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        var left = 0
        var right = chars.count - 1

        // Helper function to check if a substring is palindrome
        func isPalindrome(_ l: Int, _ r: Int) -> Bool {
            var i = l, j = r
            while i < j {
                if chars[i] != chars[j] {
                    return false
                }
                i += 1
                j -= 1
            }
            return true
        }

        while left < right {
            if chars[left] != chars[right] {
                // Try skipping either left or right character
                return isPalindrome(left + 1, right) || isPalindrome(left, right - 1)
            }
            left += 1
            right -= 1
        }

        return true
    }
}


// In this way we can find the dropped characer 
func validPalindrome(_ s: String) -> Bool {
    let chars = Array(s)
    var left = 0
    var right = chars.count - 1
    
    // Helper function to check if a substring is palindrome
    func isPalindrome(_ l: Int, _ r: Int, dropped: Character) -> Bool {
        var i = l, j = r
        while i < j {
            if chars[i] != chars[j] {
                return false
            }
            i += 1
            j -= 1
        }
        print("Found by dropping ", dropped)
        return true
    }
    
    while left < right {
        if chars[left] != chars[right] {
            // Try skipping either left or right character
            return isPalindrome(left + 1, right, dropped: chars[left]) || isPalindrome(left, right - 1, dropped: chars[right])
        }
        left += 1
        right -= 1
    }
    
    return true
}
