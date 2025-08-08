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

// https://getsdeready.com/courses/dsa/lesson/maximize-sum-of-array-after-k-negations/
// https://leetcode.com/problems/maximize-sum-of-array-after-k-negations/description/
class Solution {
    func largestSumAfterKNegations(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums.sorted()
        var remaining = k

        // Step 1: Negate negative values as much as possible
        for i in 0..<nums.count {
            if remaining > 0 && nums[i] < 0 {
                nums[i] = -nums[i]
                remaining -= 1
            }
        }

        // Step 2: If remaining is odd, flip the smallest absolute number
        if remaining % 2 == 1 {
            // We'll flip the minimum element in the array
            nums.sort()
            nums[0] = -nums[0]
        }

        // Step 3: Return the total sum
        return nums.reduce(0, +)
    }
}

// https://getsdeready.com/courses/dsa/lesson/assign-mice-to-holes/?course=573
// https://www.geeksforgeeks.org/problems/assign-mice-holes3053/0
Step-by-Step Greedy Matching (Sorted Pairing)
Sort Mice & Holes
Mice  = [2, 4]
Holes = [1, 7]
Pair them in sorted order
Mouse at 2 → Hole at 1 → Distance = |2 - 1| = 1
Mouse at 4 → Hole at 7 → Distance = |4 - 7| = 3
Max time any mouse takes = max(1, 3) = 3
func assignMiceToHoles(_ mice: [Int], _ holes: [Int]) -> Int {
    let sortedMice = mice.sorted()
    let sortedHoles = holes.sorted()

    var maxTime = 0
    for (mouse, hole) in zip(sortedMice, sortedHoles) {
        let distance = abs(mouse - hole)
        maxTime = max(maxTime, distance)
    }

    return maxTime
}

// https://getsdeready.com/courses/dsa/lesson/seats/
//https://getsdeready.com/courses/dsa/lesson/seats/
Step 1
Index:   0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
String:  . . . . x . . x x .  .  .  x  .  .

Step 2
// Occupied seats (x) are at indices:
positions = [4, 7, 8, 12]

Step 3
midIndex = 2
median = positions[2] = 8
midIndex = 2
median = positions[2] = 8

Step 4: Move all x’s to consecutive positions around median
We calculate new target positions for all x’s by placing them from median - midIndex to median + (count - midIndex - 1).
That range:
start = 8 - 2 = 6
targets = [6, 7, 8, 9]
| i | original pos | target | moves |
| - | ------------ | ------ | ----- |
| 0 | 4            | 6      | 2     |
| 1 | 7            | 7      | 0     |
| 2 | 8            | 8      | 0     |
| 3 | 12           | 9      | 3     |
Sum = 2 + 0 + 0 + 3 = 5
Visualization of Moves:
Initial:
....x..xx...x..

Target:
......xxxx.....
We moved:
    x at index 4 → index 6 (2 moves)

    x at index 7 → index 7 (0 moves)

    x at index 8 → index 8 (0 moves)

    x at index 12 → index 9 (3 moves)

Efficiently centered the group around index 8. ✅
class Solution {
    func seats(_ A: inout String) -> Int {
        let mod = 10000003
        let chars = Array(A)
        var positions = [Int]()

        // Step 1: Collect indices of all occupied seats
        for (i, char) in chars.enumerated() {
            if char == "x" {
                positions.append(i)
            }
        }

        // Step 2: Edge case - no occupied seat
        if positions.isEmpty { return 0 }

        // Step 3: Median logic
        let midIndex = positions.count / 2
        let median = positions[midIndex]

        // Step 4: Calculate total moves
        var totalMoves = 0
        for (i, pos) in positions.enumerated() {
            let target = median - midIndex + i
            totalMoves = (totalMoves + abs(pos - target)) % mod
        }

        return totalMoves
    }
}

// https://getsdeready.com/courses/dsa/lesson/meeting-rooms/?course=573
// https://www.interviewbit.com/problems/meeting-rooms/
class Solution {
    func minMeetingRooms(_ A: [[Int]]) -> Int {
        // If there are no meetings, no rooms are needed
        if A.isEmpty { return 0 }

        // Extract start times and end times into separate arrays and sort them
        let starts = A.map { $0[0] }.sorted()  // Sorted list of all start times
        let ends = A.map { $0[1] }.sorted()    // Sorted list of all end times

        var roomsNeeded = 0       // Minimum number of meeting rooms required
        var endPointer = 0        // Pointer to track the earliest ending meeting

        // Iterate through all meetings by their start time
        for start in starts {
            if start < ends[endPointer] {
                // Current meeting starts before the earliest one ends
                // → Need a new room
                roomsNeeded += 1
            } else {
                // Current meeting can reuse a room that has just been freed
                endPointer += 1
            }
        }

        return roomsNeeded
    }
}

