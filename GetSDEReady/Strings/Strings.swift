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
                // Compare each character with its corresponding character in the repeating pattern
                // i % index maps the index back to the start of the substring pattern
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
