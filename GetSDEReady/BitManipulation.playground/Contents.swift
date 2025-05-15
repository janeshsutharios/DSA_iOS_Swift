//https://leetcode.com/problems/single-number/
// [2,2,1]  output 1
// [4,1,2,1,2] output 4
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var result = 0 // because 0 with any ^ will give that real number 0 ^ 3 = 3

        for num in nums {
            result ^= num
        }
        return result
    }
}
