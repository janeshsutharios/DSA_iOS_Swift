// https://getsdeready.com/courses/dsa/lesson/check-if-n-and-its-double-exist-2/
//https://leetcode.com/problems/check-if-n-and-its-double-exist/
class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        var dict: [Int: Bool] = [:]  // stores seen numbers

        for num in arr {
            // check if current number has a double or half in the map
            if dict[2 * num] == true || (num % 2 == 0 && dict[num / 2] == true) {
                return true
            }
            dict[num] = true  // mark this number as seen
        }

        return false
    }
}
