// https://getsdeready.com/courses/dsa/lesson/is-subsequence/
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
