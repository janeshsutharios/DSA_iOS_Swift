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
