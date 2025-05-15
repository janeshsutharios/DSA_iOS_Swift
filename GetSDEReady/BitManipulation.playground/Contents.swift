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
//https://leetcode.com/problems/prime-number-of-set-bits-in-binary-representation/description/

class Solution {
    
    // Helper function to check if a number is prime
 private func isPrime(_ num: Int) -> Bool {
    if num <= 1 { return false }
    if num <= 3 { return true }
    let limit = Int(Double(num).squareRoot())
    for i in 2...limit {
        if num % i == 0 {
            return false
        }
    }
    return true
}

    // Main function to count numbers in [left, right] whose set bit count is prime
    func countPrimeSetBits(_ left: Int, _ right: Int) -> Int {
        var primeSetBitCount = 0
        
        for number in left...right {
            // Count set bits in the binary representation of the number
            var count = 0
            var num = number
            while num > 0 {
                if num % 2 == 1 {
                    count += 1
                }
                num /= 2
            }
            
            // If count of set bits is a prime number, increment result
            if isPrime(count) {
                primeSetBitCount += 1
            }
        }
        
        return primeSetBitCount
    }
}
