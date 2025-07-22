
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
