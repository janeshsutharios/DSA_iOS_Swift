//https://leetcode.com/problems/single-number/
//https://getsdeready.com/courses/dsa/lesson/single-number/
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

//https://leetcode.com/problems/sum-of-all-subset-xor-totals/description/
//https://getsdeready.com/courses/dsa/lesson/sum-of-all-subset-xor-totals/
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

//https://getsdeready.com/courses/dsa/lesson/convert-a-number-to-hexadecimal/
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
//https://leetcode.com/problems/prime-number-of-set-bits-in-binary-representation/description/
//https://getsdeready.com/courses/dsa/lesson/prime-number-of-set-bits-in-binary-representation/
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

// https://leetcode.com/problems/xor-queries-of-a-subarray/
// https://getsdeready.com/courses/dsa/lesson/xor-queries-of-a-subarray/
/*
| Concept         | Purpose                                          |
| --------------- | ------------------------------------------------ |
| Prefix XOR      | Precompute cumulative XORs for fast queries      |
| XOR trick       | `prefix[R] ^ prefix[L - 1]` gives subarray XOR   |
| Edge case `L=0` | Use `prefix[R]` directly                         |
| Time Complexity | O(n + q), much faster than O(n \* q) brute-force |
![XOR Queries Diagram](https://github.com/janeshsutharios/DSA_iOS_Swift/raw/main/GetSDEReady/Images/Xor-Queries.jpg)
*/
class Solution {
    func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
        var curr = 0
        var v: [Int] = []
        var ans: [Int] = []

        // Build prefix XOR array
        for i in 0..<arr.count {
            curr ^= arr[i]
            v.append(curr)
        }

        // Answer each query using prefix XOR
        for i in 0..<queries.count {
            let start = queries[i][0]
            let end = queries[i][1]

            let tempAns: Int
            if start == 0 {
                tempAns = v[end]
            } else {
                tempAns = v[end] ^ v[start - 1]
            }

            ans.append(tempAns)
        }

        return ans
    }
}

//https://getsdeready.com/courses/dsa/lesson/total-hamming-distance/
// https://leetcode.com/problems/total-hamming-distance/description/
/*
Input: nums = [4,14,2]
Output: 6
Explanation: In binary representation, the 4 is 0100, 14 is 1110, and 2 is 0010 (just
showing the four bits relevant in this case).
The answer will be:
HammingDistance(4, 14) + HammingDistance(4, 2) + HammingDistance(14, 2) = 2 + 2 + 2 = 6.
*/
class Solution {

    /// Computes the total Hamming distance between all pairs in the array.
    ///
    /// - Parameter nums: An array of integers.
    /// - Returns: The sum of Hamming distances for all possible pairs.
    func totalHammingDistance(_ nums: [Int]) -> Int {
        let count = nums.count
        var totalDistance = 0

        // Iterate over each bit position (0 to 31 for 32-bit integers)
        for bitPosition in 0..<32 {
            var countOfZeros = 0
            var countOfOnes = 0

            // Count how many numbers have 0 or 1 at the current bit position
            for num in nums {
                if (num & (1 << bitPosition)) == 0 {
                    countOfZeros += 1
                } else {
                    countOfOnes += 1
                }
            }

            // For each bit position, number of differing pairs = zeros * ones
            totalDistance += countOfZeros * countOfOnes
        }

        return totalDistance
    }
}

// https://getsdeready.com/courses/dsa/lesson/single-number-ii/
// https://leetcode.com/problems/single-number-ii/
/*
Input: [2, 2, 3, 2]
Binary:
2 = 10
3 = 11
| Step | `num` | `ones` | `twos` | Explanation                                     |
| ---- | ----- | ------ | ------ | ----------------------------------------------- |
| 1    | 2     | 10     | 00     | First time: add to `ones`                       |
| 2    | 2     | 00     | 10     | Second time: remove from `ones`, move to `twos` |
| 3    | 3     | 11     | 00     | `3` is new → added to `ones`                    |
| 4    | 2     | 01     | 00     | Third time: `2` bits cleared from both          |
Result: ones = 11 → 3
We don’t care which numbers appeared — just how many times each bit appeared.

If we track bits that appeared:
once, we store them in ones
twice, we store them in twos
If a bit appears the third time, it should be removed from both.
*/
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        // `ones` will hold bits that have appeared exactly once
        // `twos` will hold bits that have appeared exactly twice
        var ones = 0, twos = 0
        
        // Iterate through each number in the array
        for n in nums {
            // Update `ones` with bits that have appeared exactly once.
            // `ones` is updated by toggling bits of `n` that are not in `twos`
            ones = ones ^ n & ~twos
            
            // Update `twos` with bits that have appeared exactly twice.
            // `twos` is updated by toggling bits of `n` that are not in `ones`
            twos = twos ^ n & ~ones
        }
        
        // `ones` now holds the bits of the number that appears exactly once
        return ones
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

// https://getsdeready.com/courses/dsa/lesson/divide-two-integers/
// https://leetcode.com/problems/divide-two-integers/description/
// Input: dividend = 10, divisor = 3 Output: 3
class Solution {
func divide(_ dividend: Int, _ divisor: Int) -> Int {
    // Handle edge cases
    if divisor == 0 {
        fatalError("Divisor cannot be zero")
    }
    if dividend == 0 {
        return 0
    }
    if dividend == Int(Int32.min) && divisor == -1 {
        return Int(Int32.max) // Handle overflow case
    }

    // Determine the sign of the result
    let negative = (dividend < 0) != (divisor < 0)

    // Work with positive values
    var dividend = abs(dividend)
    let divisor = abs(divisor)

    var quotient = 0
    // Find the largest multiple of divisor that fits into dividend
    // Loop #A
    for i in stride(from: 31, through: 0, by: -1) {
        if (dividend >> i) >= divisor {
            quotient += 1 << i
            dividend -= divisor << i
        }
    }

    // Apply the sign to the result
    if negative {
        quotient = -quotient
    }

    // Clamp the result to the 32-bit signed integer range
    return max(min(quotient, Int(Int32.max)), Int(Int32.min))
}

// // Example usage
// let dividend = 10
// let divisor = 3
// print(divide(dividend, divisor))  // Output: 3

}
/*
  // Loop #A simulates division by finding the largest multiple of divisor that fits into the current dividend, starting from 2³¹ down to 2⁰:

🔍 Let’s say:
dividend = 20, divisor = 3

Try: Is 20 >> i ≥ 3?

When i = 2, 20 >> 2 = 5, and 5 ≥ 3 → true

So we subtract 3 << 2 = 12 from dividend (20 - 12 = 8)

Add 1 << 2 = 4 to quotient → now quotient = 4

Next, loop again. i = 1: 8 >> 1 = 4 ≥ 3 → yes

Subtract 3 << 1 = 6 → dividend now 2

Add 1 << 1 = 2 to quotient → quotient = 6

i = 0: 2 >> 0 = 2 < 3 → skip

👉 Final quotient = 6
*/
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

