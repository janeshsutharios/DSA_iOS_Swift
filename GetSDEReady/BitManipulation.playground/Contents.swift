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
//https://leetcode.com/problems/xor-operation-in-an-array/description/
// Input: n = 5, start = 0 Output: 8
class Solution {
    func xorOperation(_ n: Int, _ start: Int) -> Int {
        var xorNumber = 0
        for i in 0..<n {
            let num = start + 2 * i// Formula given in question it self
            xorNumber ^= num
        }
        return xorNumber
    }
}
