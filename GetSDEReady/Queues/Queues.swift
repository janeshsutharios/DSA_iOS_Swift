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
// https://getsdeready.com/courses/dsa/lesson/time-needed-to-buy-tickets/
// https://leetcode.com/problems/time-needed-to-buy-tickets/
class Solution {
    func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
        var time = 0                         // Total time counter
        let target = tickets[k]             // Number of tickets person at index k needs

        for i in 0..<tickets.count {
            if i <= k {
                // If the person is before or exactly at position k,
                // they get served in all `target` rounds (or less if they have fewer tickets)
                time += min(tickets[i], target)
            } else {
                // If the person is after k,
                // they only get served in the first `target - 1` rounds because
                // person k leaves the queue after their last ticket
                time += min(tickets[i], target - 1)
            }
        }

        return time                         // Return the total time taken until person k is done
    }
}
