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




