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
// https://leetcode.com/problems/convert-a-number-to-hexadecimal/
class Solution {
    func toHex(_ num: Int) -> String {
        // If the input number is zero, return "0"
        if num == 0 {
            return "0"
        }

        // If the number is negative, convert it to its 32-bit two's complement representation
        var value = num
        if num < 0 {
            value = Int(UInt32(bitPattern: Int32(num)))
        }

        let hexDigits = "0123456789abcdef"  // The hexadecimal digit characters
        var hexString = ""  // Store the resulting hex string

        // Repeatedly divide the number by 16 and prepend the corresponding hex digit
        while value > 0 {
            let digit = value % 16
            let hexChar = hexDigits[hexDigits.index(hexDigits.startIndex, offsetBy: digit)]
            hexString = String(hexChar) + hexString
            value /= 16
        }

        return hexString
    }
}

//https://leetcode.com/problems/bitwise-ors-of-subarrays/
// A subarray is defined as a contiguous (unbroken) sequence of elements from the array.
/*
So for array [1, 2, 3], the valid subarrays are:

[1]

[2]

[3]

[1, 2]

[2, 3]

[1, 2, 3]

But [1, 3] is not a subarray, because 2 is skipped.
---- 
 Recap with ORs from [1, 2, 3]:
Let's compute all subarray ORs manually:

Subarrays starting at index 0:

[1] → 1

[1, 2] → 1 | 2 = 3

[1, 2, 3] → 1 | 2 | 3 = 3

Starting at index 1:

[2] → 2

[2, 3] → 2 | 3 = 3

Starting at index 2:

[3] → 3

🔢 Unique ORs: {1, 2, 3} → ✅ Output: 3
*/

class Solution {
    func subarrayBitwiseORs(_ arr: [Int]) -> Int {
        // Set to store all unique bitwise OR results from subarrays
        var allResults = Set<Int>()
        
        // Set to store OR results of subarrays ending at the previous index
        var previousResults = Set<Int>()
        
        for currentValue in arr {
            // Temporary set to store OR results ending at the current index
            var currentResults = Set<Int>()
            
            // Each OR result with currentValue includes:
            // - currentValue itself (as a subarray of one element)
            // - OR with every result from the previous subarrays
            currentResults.insert(currentValue)
            for value in previousResults {
                currentResults.insert(currentValue | value)
            }
            
            // Update previous results for next iteration
            previousResults = currentResults
            
            // Merge current results into the final set
            for result in currentResults {
                allResults.insert(result)
            }
        }
        
        return allResults.count
    }
}

// https://getsdeready.com/courses/dsa/lesson/find-sum-of-different-corresponding-bits-for-all-pairs/

class Solution {
    func countBits(_ nums: [Int]) -> Int {
        var total: Int64 = 0
        let mod = 1_000_000_007
        let n = nums.count
        var copy = nums // To avoid modifying the original array

        // Loop over 31 bits (sufficient for 32-bit signed integers)
        for _ in 0..<31 {
            var set: Int64 = 0
            var unset: Int64 = 0

            // Count set and unset bits at the current least significant bit (LSB)
            for i in 0..<n {
                if (copy[i] & 1) == 1 {
                    set += 1
                } else {
                    unset += 1
                }

                // Prepare number for next round (remove LSB)
                copy[i] >>= 1
            }
            // Here we are multiplying because we have used two loop hence set * unset 
            // We also need duplicate pair hence *2 used example [1,3] [3,1]
            // For this bit position, add contribution of all differing pairs
            total += set * unset * 2
        }

        return Int(total % Int64(mod))
    }
}


