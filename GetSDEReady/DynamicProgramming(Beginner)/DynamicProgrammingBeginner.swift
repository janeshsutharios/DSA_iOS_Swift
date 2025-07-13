// https://getsdeready.com/courses/dsa/lesson/pascals-triangle/
// https://leetcode.com/problems/pascals-triangle/
// Solution #1  loop
class Solution {
    // Time : o(n^2) double loop
    // Space o(n^2) 2D array.
    func generate(_ numRows: Int) -> [[Int]] {
        var pascalObject = [[Int]](repeating: [Int](), count: numRows)

        for i in 0..<numRows {
            pascalObject[i] = [Int](repeating: 0, count: i+1)

            for j in 0..<i+1 {
                if j == 0 || j == i {
                    pascalObject[i][j] = 1
                } else {
                    pascalObject[i][j] = pascalObject[i-1][j-1] + pascalObject[i-1][j]
                }
            }
        }

        return pascalObject
    }
}
