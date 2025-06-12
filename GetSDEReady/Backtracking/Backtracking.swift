// https://getsdeready.com/courses/dsa/lesson/binary-watch/
// https://leetcode.com/problems/binary-watch/
// Using recursion
func readBinaryWatch1(_ turnedOn: Int) -> [String] {
    var result: [String] = []

    func dfs(hour: Int, minute: Int) {
        // Base case: stop if out of bounds
        if hour >= 12 || minute >= 60 {
            return
        }

        // Check if current time has exactly `turnedOn` LEDs on
        if hour.nonzeroBitCount + minute.nonzeroBitCount == turnedOn {
            let time = "\(hour):" + String(format: "%02d", minute)
            result.append(time)
        }

        // Move to next minute
        if minute < 59 {
            dfs(hour: hour, minute: minute + 1)
        } else if hour < 11 {
            // Move to next hour and reset minute
            dfs(hour: hour + 1, minute: 0)
        }
    }

    dfs(hour: 0, minute: 0)
    return result
}
// Using loop
func readBinaryWatch(_ turnedOn: Int) -> [String] {
    var result: [String] = []
    
    // Loop through all possible hour and minute combinations
    for hour in 0..<12 {
        for minute in 0..<60 {
            // Count the total number of set bits (LEDs on)
            if hour.nonzeroBitCount + minute.nonzeroBitCount == turnedOn {
                // Format time string, minutes always with 2 digits
                let time = "\(hour):" + String(format: "%02d", minute)
                result.append(time)
            }
        }
    }
    
    return result
}
// https://getsdeready.com/courses/dsa/lesson/letter-tile-possibilities/
// https://leetcode.com/problems/letter-tile-possibilities/
// TC# O(n2⋅n!)
// SC# O(n2⋅n!)
class Solution {
    func numTilePossibilities(_ tiles: String) -> Int {
        // Dictionary to store unique sequences we've seen (used like a Set for strings)
        var sequences: [String: String] = [:]

        // Get the length of the tile string
        var len = tiles.count

        // A boolean array to track which tiles have been used in current recursion path
        var used: [Bool] = Array(repeating: false, count: tiles.count)

        // Start generating all possible sequences
        generateSequence(tiles, "", &used, &sequences)

        // Subtract 1 to exclude the empty string (we don't want to count it)
        return sequences.count - 1
    }

    // Recursive function to generate all permutations/subsequences of tiles
    func generateSequence(_ tiles: String,
                          _ current: String,
                          _ used: inout [Bool],
                          _ sequences: inout [String: String]) {

        // Add the current sequence to the dictionary (acts as a Set to avoid duplicates)
        // Even an empty string will be added initially (which we subtract later)
        sequences[current, default: ""] = current

        // Loop through each character in the input string
        for pos in 0..<tiles.count {
            // Only proceed if this character hasn't been used in the current sequence
            if !used[pos] {
                // Mark this character as used
                used[pos] = true

                // Add the character at current `pos` to the `current` sequence
                // and continue generating further
                generateSequence(
                    tiles,
                    current + String(tiles[tiles.index(tiles.startIndex, offsetBy: pos)]),
                    &used,
                    &sequences
                )

                // Backtrack: Unmark this character so it can be used in other branches
                used[pos] = false
            }
        }
    }
}
/* Using an array - same like permutation.
class Solution {
    func numTilePossibilities(_ tiles: String) -> Int {
        // Convert to sorted array of characters for easy duplicate handling
        var chars = Array(tiles).sorted()
        var used = Array(repeating: false, count: chars.count)
        var count = 0
        
        // Start backtracking
        backtrack(&chars, &used, &count)
        
        return count
    }

    // Recursive function to generate permutations
    func backtrack(_ chars: inout [Character], _ used: inout [Bool], _ count: inout Int) {
        // At each level, we've created a new valid sequence (non-empty)
        count += 1
        
        for i in 0..<chars.count {
            // Skip if this character is already used
            if used[i] {
                continue
            }

            // Skip duplicate characters unless the previous duplicate was used
            if i > 0 && chars[i] == chars[i - 1] && !used[i - 1] {
                continue
            }

            // Choose character at index i
            used[i] = true
            backtrack(&chars, &used, &count)
            used[i] = false  // backtrack
        }
    }
}

*/

// https://getsdeready.com/courses/dsa/lesson/generate-parantheses/
// https://leetcode.com/problems/generate-parentheses/description/
class Solution {
     func generateParenthesis(_ n: Int) -> [String] {
        var output = [String]()
        var stack: [(String, Int, Int)] = []
        stack.append(("", 0, 0))  // (current, open, close)
        
        while !stack.isEmpty {
            let (current, open, close) = stack.removeLast()
            
            if current.count == n * 2 {
                output.append(current)
                continue
            }
            
            if open < n {
                stack.append((current + "(", open + 1, close))
            }
            if close < open {
                stack.append((current + ")", open, close + 1))
            }
        }
        
        return output
    }
    /*
    func generateParenthesis(_ n: Int) -> [String] {
        var output = [String]()
        backtrack("", 0, 0, n) { output.append($0) }
        return output
    }
    
    func backtrack(_ current: String,_ open: Int,_ end: Int,_ max: Int, _ result: (String)->Void) {
        if current.count == max * 2 {
            result(current)
            return
        }
        
        if open < max { backtrack(current + "(", open + 1, end, max, result) }
        if end < open  { backtrack(current + ")", open, end + 1, max, result) }
    }*/
}
// https://getsdeready.com/courses/dsa/lesson/unique-paths-iii/
// https://leetcode.com/problems/unique-paths-iii/description/

func uniquePathsIII(_ grid: [[Int]]) -> Int {
    var grid = grid
    let rows = grid.count
    let cols = grid[0].count
    var totalEmpty = 0
    var startRow = 0, startCol = 0

    // Step 1: Count all empty cells and locate the start cell (1)
    for r in 0..<rows {
        for c in 0..<cols {
            if grid[r][c] == 0 {
                totalEmpty += 1  // count the number of cells we must walk on
            } else if grid[r][c] == 1 {
                startRow = r
                startCol = c     // save start cell location
            }
        }
    }

    var result = 0

    // Step 2: DFS Helper Function
    func dfs(_ r: Int, _ c: Int, _ remain: Int) {
        // If out of bounds or hitting a wall (-1), stop
        if r < 0 || c < 0 || r >= rows || c >= cols || grid[r][c] == -1 {
            return
        }

        // If we reach the end cell (2)
        if grid[r][c] == 2 {
            if remain == -1 {  // If we visited all empty cells exactly once
                result += 1
            }
            return
        }

        // Save current cell value and mark it visited
        let temp = grid[r][c]
        grid[r][c] = -1  // mark as visited by turning it into obstacle

        // Recurse in 4 directions
        dfs(r + 1, c, remain - 1) // down
        dfs(r - 1, c, remain - 1) // up
        dfs(r, c + 1, remain - 1) // right
        dfs(r, c - 1, remain - 1) // left

        // Backtrack: restore original value
        grid[r][c] = temp
    }

    // We include starting point, so we start with totalEmpty (empty cells) only
    dfs(startRow, startCol, totalEmpty)

    return result
}
/*
(0,0)
  ├── (0,1)
  │     ├── (0,2)
  │     │     ├── (1,2)  ✅ (end with all cells visited)
  │     │     └── (1,1) ─→ blocked (not all visited yet)
  │     └── (1,1)
  │           └── (1,2)  \U0001f6ab invalid (missed a cell)
  └── (1,0)
        └── (1,1)
              └── (1,2)  ✅ (end with all visited)

*/
// https://getsdeready.com/courses/dsa/lesson/n-queens/
// https://leetcode.com/problems/n-queens/description/
class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var result: [[String]] = []
        var board = Array(repeating: Array(repeating: ".", count: n), count: n)
        
        backtrack(&board, 0, n, &result)
        return result
    }
    
    private func backtrack(_ board: inout [[String]], _ row: Int, _ n: Int, _ result: inout [[String]]) {
        // Base case: if we've placed queens in all rows, we found a solution
        if row == n {
            let solution = board.map { $0.joined() }
            result.append(solution)
            return
        }
        
        // Try placing a queen in each column of the current row
        for col in 0..<n {
            if isSafePlace(board, row, col, n) {
                // Place queen
                board[row][col] = "Q"
                
                // Recursively try to place queens in the next row
                backtrack(&board, row + 1, n, &result)
                
                // Backtrack: remove the queen
                board[row][col] = "."
            }
        }
    }
    
    private func isSafePlace(_ board: [[String]], _ row: Int, _ col: Int, _ n: Int) -> Bool {
        // Check column (no need to check rows below current row as we haven't placed queens there yet)
        for i in 0..<row {
            if board[i][col] == "Q" {
                return false
            }
        }
        
        // Check upper-left diagonal
        var i = row - 1
        var j = col - 1
        while i >= 0 && j >= 0 {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j -= 1
        }
        
        // Check upper-right diagonal
        i = row - 1
        j = col + 1
        while i >= 0 && j < n {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j += 1
        }
        
        return true
    }
}

// // Example usage and test
// let solution = Solution()

// // Test with N = 4
// let result4 = solution.solveNQueens(4)
// print("Solutions for N = 4:")
// for (index, sol) in result4.enumerated() {
//     print("Solution \(index + 1):")
//     for row in sol {
//         print(row)
//     }
//     print()
// }

// // Test with N = 8 (classic 8-queens problem)
// let result8 = solution.solveNQueens(8)
// print("Number of solutions for N = 8: \(result8.count)")

// // Display first solution for N = 8
// if !result8.isEmpty {
//     print("First solution for N = 8:")
//     for row in result8[0] {
//         print(row)
//     }
// }
// class Solution {
//     // Helper function to check if placing a queen at position (row,col) is safe
//     private func isSafePlace(_ n: Int, _ nQueens: [String], _ row: Int, _ col: Int) -> Bool {
//         // Check if there's any queen in the same column above current position
//         for i in 0..<n {
//             if Array(nQueens[i])[col] == "Q" {
//                 return false
//             }
//         }
        
//         // Check upper-left diagonal for any queen
//         var i = row - 1
//         var j = col - 1
//         while i >= 0 && j >= 0 {
//             if Array(nQueens[i])[j] == "Q" {
//                 return false
//             }
//             i -= 1
//             j -= 1
//         }
        
//         // Check upper-right diagonal for any queen
//         i = row - 1
//         j = col + 1
//         while i >= 0 && j < n {
//             if Array(nQueens[i])[j] == "Q" {
//                 return false
//             }
//             i -= 1
//             j += 1
//         }
        
//         // If no conflicts found, position is safe
//         return true
//     }
    
//     // Recursive helper function to solve N-Queens problem
//     private func solveNQueens(_ n: Int, _ output: inout [[String]], _ nQueens: inout [String], _ row: Int) {
//         // Base case: if we've placed queens in all rows, we found a valid solution
//         if row == n {
//             output.append(nQueens)
//             return
//         }
        
//         // Try placing queen in each column of current row
//         for col in 0..<n {
//             // If current position is safe
//             if isSafePlace(n, nQueens, row, col) {
//                 // Place queen
//                 var rowArray = Array(nQueens[row])
//                 rowArray[col] = "Q"
//                 nQueens[row] = String(rowArray)
                
//                 // Recursively solve for next row
//                 solveNQueens(n, &output, &nQueens, row + 1)
                
//                 // Backtrack: remove queen for trying next position
//                 rowArray[col] = "."
//                 nQueens[row] = String(rowArray)
//             }
//         }
//     }
    
//     // Main function to solve N-Queens problem
//     func solveNQueens(_ n: Int) -> [[String]] {
//         var output: [[String]] = []  // Stores all valid solutions
//         var nQueens = Array(repeating: String(repeating: ".", count: n), count: n) // Initialize empty board
//         solveNQueens(n, &output, &nQueens, 0) // Start solving from row 0
//         return output
//     }
// }

// https://leetcode.com/problems/n-queens-ii/
class Solution {
    func totalNQueens(_ n: Int) -> Int {
        // Arrays to mark column, diagonal, and anti-diagonal occupancy
        var col = Array(repeating: false, count: n)
        var diag = Array(repeating: false, count: 2 * n - 1)
        var antiDiag = Array(repeating: false, count: 2 * n - 1)
        
        // Start the recursive backtracking
        return solve(&col, &diag, &antiDiag, 0)
    }
    
    // Recursive function to place queens row by row
    private func solve(_ col: inout [Bool],
                       _ diag: inout [Bool],
                       _ antiDiag: inout [Bool],
                       _ row: Int) -> Int {
        
        let n = col.count
        var count = 0
        
        // All queens are placed
        if row == n {
            return 1
        }
        
        for column in 0..<n {
            let d = row + column          // Diagonal index
            let ad = row - column + n - 1 // Anti-diagonal index
            
            // Check if position is safe
            if !col[column] && !diag[d] && !antiDiag[ad] {
                // Place the queen
                col[column] = true
                diag[d] = true
                antiDiag[ad] = true
                
                // Recurse to next row
                count += solve(&col, &diag, &antiDiag, row + 1)
                
                // Backtrack
                col[column] = false
                diag[d] = false
                antiDiag[ad] = false
            }
        }
        
        return count
    }
}


/*
class Solution {
        func totalNQueens(_ n: Int) -> Int {
        let op = solveNQueens(n)
        return op.count
       }
    func solveNQueens(_ n: Int) -> [[String]] {
        var result: [[String]] = []
        var board = Array(repeating: Array(repeating: ".", count: n), count: n)
        
        backtrack(&board, 0, n, &result)
        return result
    }
    
    private func backtrack(_ board: inout [[String]], _ row: Int, _ n: Int, _ result: inout [[String]]) {
        // Base case: if we've placed queens in all rows, we found a solution
        if row == n {
            let solution = board.map { $0.joined() }
            result.append(solution)
            return
        }
        
        // Try placing a queen in each column of the current row
        for col in 0..<n {
            if isSafePlace(board, row, col, n) {
                // Place queen
                board[row][col] = "Q"
                
                // Recursively try to place queens in the next row
                backtrack(&board, row + 1, n, &result)
                
                // Backtrack: remove the queen
                board[row][col] = "."
            }
        }
    }
    
    private func isSafePlace(_ board: [[String]], _ row: Int, _ col: Int, _ n: Int) -> Bool {
        // Check column (no need to check rows below current row as we haven't placed queens there yet)
        for i in 0..<row {
            if board[i][col] == "Q" {
                return false
            }
        }
        
        // Check upper-left diagonal
        var i = row - 1
        var j = col - 1
        while i >= 0 && j >= 0 {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j -= 1
        }
        
        // Check upper-right diagonal
        i = row - 1
        j = col + 1
        while i >= 0 && j < n {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j += 1
        }
        
        return true
    }
}
*/
// https://getsdeready.com/courses/dsa/lesson/permutations-ii/
// https://leetcode.com/problems/permutations-ii/
 class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var allUniquePermutations: [[Int]] = []         // Stores all unique permutations
        var sortedNums = nums.sorted()                  // Sort input to group duplicates together
        var isUsed = Array(repeating: false, count: nums.count) // Track which elements are used in the current path
        var currentPermutation: [Int] = []              // Current permutation being built
        
        // Helper function using backtracking
        func backtrack(_ currentPermutation: inout [Int]) {
            // If the current permutation is complete, add it to results
            if currentPermutation.count == sortedNums.count {
                allUniquePermutations.append(currentPermutation)
                return
            }
            
            for index in 0..<sortedNums.count {
                // Skip if number at index is already used in the current permutation
                if isUsed[index] {
                    continue
                }
                
                // Skip duplicates: if current number is the same as previous and previous hasn't been used in this path
                if index > 0 && sortedNums[index] == sortedNums[index - 1] && !isUsed[index - 1] {
                    continue
                }

                // Include this number in current path
                isUsed[index] = true
                currentPermutation.append(sortedNums[index])
                
                // Continue building the permutation
                backtrack(&currentPermutation)
                
                // Backtrack: remove last number and mark as unused
                currentPermutation.removeLast()
                isUsed[index] = false
            }
        }

        // Start the backtracking process
        backtrack(&currentPermutation)

        return allUniquePermutations
    }
}

// https://getsdeready.com/courses/dsa/lesson/palindrome-partitioning/
// https://leetcode.com/problems/palindrome-partitioning/description/
class Solution {
    func partition(_ s: String) -> [[String]] {
        var result: [[String]] = [] // To store all valid palindrome partitions
        var currentPartition: [String] = [] // To build a single partition

        // Helper function to check if a string is a palindrome
        func isPalindrome(_ str: String) -> Bool {
            return str == String(str.reversed())
        }

        // Backtracking function
        func backtrack(_ start: Int) {
            // If we've reached the end of the string, add the current partition to the result
            if start == s.count {
                result.append(currentPartition)
                return
            }

            // Explore all possible substrings starting from `start`
            for end in start..<s.count {
                let startIndex = s.index(s.startIndex, offsetBy: start)
                let endIndex = s.index(s.startIndex, offsetBy: end)
                let substring = String(s[startIndex...endIndex])

                // Proceed only if the substring is a palindrome
                if isPalindrome(substring) {
                    currentPartition.append(substring) // Choose the substring
                    backtrack(end + 1) // Explore further with the rest of the string
                    currentPartition.removeLast() // Backtrack by removing the last choice
                }
            }
        }

        backtrack(0) // Start backtracking from the beginning of the string
        return result
    }
}

// // Example usage:
// let solution = Solution()
// let s = "aab"
// print(solution.partition(s)) 
// // Output: [["a", "a", "b"], ["aa", "b"]]
