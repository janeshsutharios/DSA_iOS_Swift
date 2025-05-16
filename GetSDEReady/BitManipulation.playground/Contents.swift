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
//https://leetcode.com/problems/sum-of-all-subset-xor-totals/description/
/// A solution to calculate the sum of XOR totals for all subsets of an array.
class Solution {
    
    /// Computes the sum of XORs of all subsets of the given array.
    ///
    /// - Parameter nums: An array of integers.
    /// - Returns: The total sum of XORs of all possible subsets.
    ///
    /// ### Explanation:
    /// - XOR is sensitive to odd/even occurrences.
    /// - Every bit that appears in `nums` (i.e., in the OR of all elements) will affect exactly half of the subsets.
    /// - Each bit appears in `2^(n-1)` subsets (where `n` is the number of elements).
    /// - XOR aggregates the contributions of bits over subsets.
    /// - So, multiplying the OR of all numbers by `2^(n-1)` gives the total XOR subset sum.
    func subsetXORSum(_ nums: [Int]) -> Int {
        var result = 0
        
        // Compute the bitwise OR of all numbers
        for num in nums {
            result |= num
        }
        
        // Multiply the OR result by 2^(n - 1) using bit shift
        return result << (nums.count - 1)
    }
}
