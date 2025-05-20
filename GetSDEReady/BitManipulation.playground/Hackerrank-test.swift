// https://www.hackerrank.com/contests/get-sde-ready-bit-manipulation/challenges/flipping-bits/problem
// Flipping all bits of given n

func flippingBits(n: Int) -> Int {
    return n ^ 0xFFFFFFFF
}
// Explanation 
/*
 0xFFFFFFFF - 
Binary: 11111111 11111111 11111111 11111111
Decimal: 4294967295
*/

// Solution #2
    return ~n

// Solution #3
/// Flips all 32 bits of a given 32-bit integer.
/// - Parameter n: The input integer.
/// - Returns: The integer with all 32 bits flipped.
func flippingBits(n: Int) -> Int {
    var flippedValue = 0

    // Iterate through all 32 bits
    for bitPosition in 0..<32 {
        // Extract the bit at the current position
        let originalBit = (n >> bitPosition) & 1

        // Flip the bit: 0 becomes 1, 1 becomes 0
        let invertedBit = originalBit ^ 1

        // Set the flipped bit in the correct position of the result
        flippedValue |= (invertedBit << bitPosition)
    }
    return flippedValue
}

// https://www.hackerrank.com/contests/get-sde-ready-bit-manipulation/challenges/sum-vs-xor/
/// Returns the count of integers `x` such that `0 ≤ x < n` and `n + x == n ^ x`.
///
/// For the sum and XOR of `n` and `x` to be equal, no bit position should produce a carry.
/// This is only possible when `n` has a `0` in that bit position, allowing `x` to be either `0` or `1`.
///
/// - Parameter n: A non-negative integer.
/// - Returns: The total number of integers `x` that satisfy `n + x == n ^ x`.
func sumXor(n: Int) -> Int {
    // Special case: for n = 0, only x = 0 satisfies the condition
    if n == 0 {
        return 1
    }
    var numberOfZeroBits = 0
    var current = n
    // Count the number of bits that are 0 in the binary representation of `n`
    while current > 0 {
        if (current & 1) == 0 {
            numberOfZeroBits += 1
        }
        current >>= 1
    }

    // For each 0 bit, x has two choices (0 or 1), so total = 2^numberOfZeroBits
    return 1 << numberOfZeroBits
}
// Explanation: 
// Formula is --> (n+i)=(n^i)+2*(n&i)
/* Dry run 
n = 5 -->Binary--> 0101
numberOfZeroBits = 0
current = 5
#Iteration 1:---------------
current = 5 (binary 0101)
(current & 1) = (0101 & 0001) = 1 (LSB is 1)
So, zero bit? No

numberOfZeroBits stays 0

Right shift: current >>= 1 → current = 2 (binary 0010)

#Iteration 2:---------------
current = 2 (binary 0010)

(current & 1) = (0010 & 0001) = 0 (LSB is 0)

Zero bit? Yes

Increment numberOfZeroBits → numberOfZeroBits = 1

Right shift: current >>= 1 → current = 1 (binary 0001)

#Iteration 3:---------------
current = 1 (binary 0001)

(current & 1) = 1

Zero bit? No

numberOfZeroBits stays 1

Right shift: current >>= 1 → current = 0

Loop ends because current = 0
Calculation:
numberOfZeroBits = 1

Return 1 << numberOfZeroBits = 1 << 1 = 2

Interpretation
The answer is 2, meaning there are 2 values of 𝑥 x that satisfy 𝑛 + 𝑥 = 𝑛 ⊕ 𝑥 n+x=n⊕x for 𝑛 = 5 n=5.
*/


