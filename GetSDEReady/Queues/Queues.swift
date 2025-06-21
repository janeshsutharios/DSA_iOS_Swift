// https://getsdeready.com/courses/dsa/lesson/first-unique-character-in-a-string/
// https://leetcode.com/problems/first-unique-character-in-a-string/
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var frequency: [Character: Int] = [:]

        // 1. Count frequency of each character
        for char in s {
            frequency[char, default: 0] += 1
        }

        // 2. Find first character with frequency 1
        for (index, char) in s.enumerated() {
            if frequency[char] == 1 {
                return index
            }
        }

        // 3. No unique character found
        return -1
    }
}
