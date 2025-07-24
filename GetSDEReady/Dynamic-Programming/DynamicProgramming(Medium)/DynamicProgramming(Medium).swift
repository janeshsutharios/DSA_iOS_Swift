
// https://getsdeready.com/courses/dsa/lesson/pascals-triangle-ii/
// https://leetcode.com/problems/pascals-triangle-ii/
class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 { return [1] }
        var row = Array(repeating: 0, count: rowIndex + 1)
        row[0] = 1

        for currentRow in 1...rowIndex {
            for position in stride(from: currentRow, through: 1, by: -1) {
                row[position] += row[position - 1]
            }
        }
        return row
    }
}
// Brute force or all values.
/*class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var pascalObject = [[Int]](repeating: [Int](), count: rowIndex+1)

        for i in 0..<rowIndex+1 {
            pascalObject[i] = [Int](repeating: 0, count: i+1)

            for j in 0..<i+1 {
                if j == 0 || j == i {
                    pascalObject[i][j] = 1
                } else {
                    pascalObject[i][j] = pascalObject[i-1][j-1] + pascalObject[i-1][j]
                }
            }
        }
        return pascalObject.last ?? []
    }
}*/


// https://getsdeready.com/courses/dsa/lesson/counting-bits/
// https://leetcode.com/problems/counting-bits/description/
// Solution #2 Using bitwise 
class Solution {

    func countBits(_ n: Int) -> [Int] {
        var output: [Int] = []
        for i in 0...n {
            output.append(nonZeroBits(i))
        }
        return output
    }
    
    func nonZeroBits(_ n: Int) -> Int  {
        var n = n
        var nonZeroBits = 0
        while n > 0 {
            nonZeroBits += n & 1// this will get how many bits have 1 in number
            n = n >> 1
        }
        return nonZeroBits
    }
} 

// Solution#1 Brute force
/*
class Solution {

    func countBits(_ n: Int) -> [Int] {
        var output: [Int] = []
        for i in 0...n {
            output.append(nonZeroBits(i))
        }
        return output
    }
    
    func nonZeroBits(_ n: Int) -> Int  {
        var n = n
        var nonZeroBits = 0
        while n > 0 {
            let reminder = n%2
            if reminder == 1 { nonZeroBits += 1}
            n = n/2
        }
        return nonZeroBits
    }
}*/

/* Solution 3 bitwise 
class Solution {
    func countBits(_ n: Int) -> [Int] {
        var result: [Int] = []
        for i in 0...n {
            result.append(i.nonzeroBitCount) // use built-in
        }
        return result
    }
*/
// https://getsdeready.com/courses/dsa/lesson/is-subsequence-2/
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
// https://getsdeready.com/courses/dsa/lesson/perfect-squares/
// https://leetcode.com/problems/perfect-squares/description/

class Solution {
    func numSquares(_ n: Int) -> Int {
        var dp = Array(repeating: Int.max, count: n + 1)
        dp[0] = 0  // Base case: 0 needs 0 numbers
        
        for i in 1...n {
            var j = 1
            // j * j is to find square
            while j * j <= i {
                // Here if number is perfect square than it will give the min number
                // Example# i = 4
                // Try 1² and 2²:
                // 1²: dp[4] = min(∞, dp[3] + 1) = min(∞, 3 + 1) = 4
                // 2²: dp[4] = min(4, dp[0] + 1) = min(4, 0 + 1) =
                dp[i] = min(dp[i], dp[i - j * j] + 1)
                j += 1
            }
        }
        
        return dp[n]
    }
}
// https://getsdeready.com/courses/dsa/lesson/minimum-cost-for-tickets/
// https://leetcode.com/problems/minimum-cost-for-tickets/description/
class Solution {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        // Use a Set for O(1) lookup to check if a day is a travel day
        var travelDays = Set(days)
        
        // Last day of travel — we only need to calculate up to this day
        let lastDay = days.last!
        
        // dp[i] = minimum cost to travel up to day i
        var dp = Array(repeating: 0, count: lastDay + 1)
        
        // Iterate through each day up to the last travel day
        for day in 1...lastDay {
            // If it's not a travel day, just copy the previous cost
            if !travelDays.contains(day) {
                dp[day] = dp[day - 1]
            } else {
                // If it is a travel day, compute the min cost among three options:
                
                // 1-day pass: add cost[0] to cost until previous day
                let cost1 = dp[max(0, day - 1)] + costs[0]
                
                // 7-day pass: add cost[1] to cost until 7 days ago
                let cost7 = dp[max(0, day - 7)] + costs[1]
                
                // 30-day pass: add cost[2] to cost until 30 days ago
                let cost30 = dp[max(0, day - 30)] + costs[2]
                
                // Take the minimum among the three
                dp[day] = min(cost1, cost7, cost30)
            }
        }
        
        // The answer is the minimum cost to cover all travel up to lastDay
        return dp[lastDay]
    }
}
// https://leetcode.com/problems/minimum-path-sum/description/
// https://getsdeready.com/courses/dsa/lesson/min-sum-path-in-matrix/
// Intution # maintain dp which consist of min either down or right
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var dp = grid  // We'll reuse the grid itself to save space
        
                
        // Fill first column
        for i in 1..<rows {
            dp[i][0] += dp[i - 1][0]
        }
        // Fill first row
        for j in 1..<cols {
            dp[0][j] += dp[0][j - 1]
        }

        // Fill the rest of the grid
        for i in 1..<rows {
            for j in 1..<cols {
                dp[i][j] += min(dp[i - 1][j], dp[i][j - 1])
            }
        }
        
        return dp[rows - 1][cols - 1]
    }
}
/*
// Space optimised Solition
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count               // Number of rows
        let n = grid[0].count            // Number of columns
        var dp = Array(repeating: 0, count: n)  // 1D DP array to store min path sums for the current row

        for i in 0..<m {
            for j in 0..<n {
                if i == 0 && j == 0 {
                    // Starting cell (top-left), just take grid value
                    dp[j] = grid[0][0]
                } else if i == 0 {
                    // First row, can only come from the left
                    dp[j] = dp[j - 1] + grid[i][j]
                } else if j == 0 {
                    // First column, can only come from the top (same column in previous row)
                    dp[j] = dp[j] + grid[i][j]
                } else {
                    // In the middle of the grid, choose min of top or left
                    dp[j] = min(dp[j], dp[j - 1]) + grid[i][j]
                }
            }
        }

        return dp[n - 1]  // Bottom-right value is the answer
    }
}
// https://getsdeready.com/courses/dsa/lesson/longest-palindromic-subsequence/
// https://leetcode.com/problems/longest-palindromic-subsequence/
// https://claude.ai/public/artifacts/c76aee2e-8620-4be8-b35c-501ad7a65cec
*/
// Optimised solution 
// class Solution {
//     func longestPalindromeSubseq(_ s: String) -> Int {
//         let s = Array(s)
//         let n = s.count
//         var dp = Array(repeating: 0, count: n)
//         var dpPrev = Array(repeating: 0, count: n)

//         for i in stride(from: n - 1, through: 0, by: -1) {
//             dp[i] = 1  // A single character is always a palindrome of length 1
//             for j in i + 1..<n {
//                 if s[i] == s[j] {
//                     dp[j] = dpPrev[j - 1] + 2
//                 } else {
//                     dp[j] = max(dpPrev[j], dp[j - 1])
//                 }
//             }
//             dpPrev = dp  // Move current row to previous row for next iteration
//         }
//         return dp[n - 1]
//     }
// }
class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        let chars = Array(s)
        let n = chars.count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)

        // Base case: every single character is a palindrome of length 1
        for i in 0..<n {
            dp[i][i] = 1
        }

        // Build up from substrings of length 2 to n
        for length in 2...n {
            for i in 0...(n - length) {
                let j = i + length - 1

                if chars[i] == chars[j] {
                    // Characters match: extend the inner palindrome
                    if length == 2 {
                        dp[i][j] = 2  // e.g., "aa"
                    } else {
                        dp[i][j] = dp[i + 1][j - 1] + 2
                    }
                } else {
                    // Characters don't match: take max of removing one end
                    dp[i][j] = max(dp[i + 1][j], dp[i][j - 1])
                }
            }
        }

        return dp[0][n - 1]  // Result is for the entire string
    }
}
// https://getsdeready.com/courses/dsa/lesson/longest-common-subsequence/
// https://claude.ai/public/artifacts/3e37b750-ca75-4285-bb46-d40cc03a7469
// https://leetcode.com/problems/longest-common-subsequence/description/
// Time Complexity: O(m × n)
// Space Complexity: O(n)

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let chars1 = Array(text1)
        let chars2 = Array(text2)
        let m = chars1.count
        let n = chars2.count
        
        // Create a 2D DP table with (m+1) x (n+1)
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

        for i in 1...m {
            for j in 1...n {
                if chars1[i - 1] == chars2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        
        return dp[m][n]
    }
}

/*
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let t1 = Array(text1)
        let t2 = Array(text2)
        let m = t1.count
        let n = t2.count

        var previous = Array(repeating: 0, count: n + 1)
        var current = Array(repeating: 0, count: n + 1)

        for i in 1...m {
            for j in 1...n {
                if t1[i - 1] == t2[j - 1] {
                    current[j] = 1 + previous[j - 1]
                } else {
                    current[j] = max(previous[j], current[j - 1])
                }
            }
            swap(&previous, &current)
        }

        return previous[n]
    }
}
*/
/*
class Solution {
    private func lcsHelper(_ i: Int, _ j: Int, _ t1: [Character], _ t2: [Character], _ memo: inout [[Int?]]) -> Int {
        // Base case: reached the end of either string
        if i == t1.count || j == t2.count {
            return 0
        }

        // Return memoized value if available
        if let mem = memo[i][j] {
            return mem
        }

        let result: Int
        if t1[i] == t2[j] {
            // Characters match: move both pointers forward
            result = 1 + lcsHelper(i + 1, j + 1, t1, t2, &memo)
        } else {
            // Characters don't match: take max of skipping one from either string
            result = max(
                lcsHelper(i + 1, j, t1, t2, &memo),
                lcsHelper(i, j + 1, t1, t2, &memo)
            )
        }

        // Memoize the result
        memo[i][j] = result
        return result
    }

    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let t1 = Array(text1)
        let t2 = Array(text2)
        
        // Create memo table initialized with nil
        var memo: [[Int?]] = Array(repeating: Array(repeating: nil, count: t2.count), count: t1.count)

        return lcsHelper(0, 0, t1, t2, &memo)
    }
}
*/
// Sotion using string index
/*
class Solution {
    private func dp(_ ind1: String.Index,_ ind2: String.Index,_ text1: String,_ text2: String,_ memo: inout [String.Index: [String.Index: Int]]) -> Int {
        // Base case: if we reach the end of either string
        guard ind1 != text1.endIndex && ind2 != text2.endIndex else {
            return 0
        }

        // Return memoized result if available
        if let mem = memo[ind1]?[ind2] {
            return mem
        }

        let result: Int
        // If characters match, move both indices
        if text1[ind1] == text2[ind2] {
            result = 1 + dp(text1.index(after: ind1),text2.index(after: ind2),text1,text2,&memo)
        } else {
            // Otherwise, explore both possibilities
            result = max(
                dp(ind1, text2.index(after: ind2), text1, text2, &memo),
                dp(text1.index(after: ind1), ind2, text1, text2, &memo)
            )
        }

        // Store the result in the memoization dictionary
        memo[ind1, default: [:]][ind2] = result
        return result
    }

    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var memo = [String.Index: [String.Index: Int]]()
        return dp(text1.startIndex, text2.startIndex, text1, text2, &memo)
    }
}
*/

// https://getsdeready.com/courses/dsa/lesson/longest-increasing-subsequence-2/
// https://leetcode.com/problems/longest-increasing-subsequence/
// 
class Solution {
    // Intution just keep an array which have shorter number then this & return max of number
    // DP Solution
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        // Array to store the length of the LIS ending at each index
        var dp = [Int](repeating: 1, count: nums.count)
        
        for i in 1..<nums.count {
            // Check all previous elements to find the longest subsequence ending at i
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        // The length of the longest increasing subsequence will be the maximum value in dp array
        return dp.max() ?? 0
    }
    /*
    // Binary search
    func lengthOfLIS(_ nums: [Int]) -> Int {
    var tails = [Int]()

    for num in nums {
        var left = 0, right = tails.count
        while left < right {
            let mid = (left + right) / 2
            if tails[mid] < num {
                left = mid + 1
            } else {
                right = mid
            }
        }

        if left == tails.count {
            tails.append(num)
        } else {
            tails[left] = num
        }
    }

    return tails.count
}
*/


