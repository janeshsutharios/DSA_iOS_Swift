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
