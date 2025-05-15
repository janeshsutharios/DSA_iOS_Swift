/// Adds one to a number represented as an array of digits.
/// - Parameter digits: An array of digits representing a non-negative integer.
/// - Returns: A new array of digits representing the number plus one.
func plusOne(_ digits: [Int]) -> [Int] {
    var result = digits
    let lastIndex = result.count - 1

    // Traverse the digits array from right to left
    for index in stride(from: lastIndex, through: 0, by: -1) {
        if result[index] < 9 {
            // If the digit is less than 9, just increment and return early
            result[index] += 1
            return result
        } else {
            // If digit is 9, set it to 0 and continue to carry over
            result[index] = 0
        }
    }

    // If all digits were 9 (e.g., [9, 9, 9]), add an extra leading 1
    // Example: [9, 9, 9] -> [1, 0, 0, 0]
    var expandedResult = [Int](repeating: 0, count: result.count + 1)
    expandedResult[0] = 1
    return expandedResult
}
//  Test with [1,9,9] [1,4,3] [9,9,9]

// https://leetcode.com/problems/check-if-array-is-sorted-and-rotated/description/
// 
class Solution {
    func check(_ nums: [Int]) -> Bool {
        let count = nums.count
        var rotationBreaks = 0

        // Check for places where the array is not in non-decreasing order.
        for index in 0..<count {
            let nextIndex = (index + 1) % count  // Wrap around to handle rotation
            //This wraps around the array using the modulus operator % to avoid going out of bounds.
            if nums[index] > nums[nextIndex] {
                rotationBreaks += 1
            }
        }
        // Valid only if there's at most one break in the sorted order
        return rotationBreaks <= 1
    }
}
/* Modulo wraps around the array using the modulus operator % to avoid going out of bounds.
| i | (i + 2) % 5 | A\[(i + 2) % 5] | B\[i] |
| - | ----------- | --------------- | ----- |
| 0 | 2           | A\[2] = 3       | 3     |
| 1 | 3           | A\[3] = 4       | 4     |
| 2 | 4           | A\[4] = 5       | 5     |
| 3 | 0           | A\[0] = 1       | 1     |
| 4 | 1           | A\[1] = 2       | 2     |
*/

//https://leetcode.com/problems/find-peak-element/
//Time: O(log n) (binary search)
//Space: O(1)
class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1

        while left < right {
            let mid = (left + right) / 2
            if nums[mid] > nums[mid + 1] {
                // Peak is in the left half (including mid)
                right = mid
            } else {
                // Peak is in the right half
                left = mid + 1
            }
        }

        // left and right have converged to a peak element index
        return left
    }
}
//https://leetcode.com/problems/sqrtx/
//Time: O(log n) (binary search)
//Space: O(1)
class Solution {
    func integerSquareRoot(_ number: Int) -> Int {
        // Special case: square root of 0 is 0
        if number == 0 { return 0 }

        var low = 1
        var high = number

        // Binary search for the integer square root
        while low <= high {
            let mid = (low + high) / 2
            let midSquared = mid * mid

            if midSquared == number {
                // Exact square root found
                return mid
            } else if midSquared < number {
                // Move right to search larger values
                low = mid + 1
            } else {
                // Move left to search smaller values
                high = mid - 1
            }
        }

        // When not a perfect square, return floor of square root
        return high
    }
}

// https://leetcode.com/problems/power-of-four/
/*
1. ((n & (n - 1)) == 0)
This checks if n is a power of 2.

Why it works: A power of 2 has only one bit set in binary. For example:

1 → 0001

2 → 0010

4 → 0100

8 → 1000

For such numbers, n & (n - 1) will be 0.
Example:

n = 4 (0100), n-1 = 3 (0011)

4 & 3 = 0000

This ensures n is a power of 2.

2. n % 3 == 1
This is a mathematical trick to filter out powers of 2 that are not powers of 4.

Observation:

Powers of 4 (like 1, 4, 16, 64...) all give remainder 1 when divided by 3

Powers of 2 that are not powers of 4 (like 2, 8, 32...) do not give remainder 1
*/
class Solution {
    // TC: O(1)
    // SC: O(1)
    func isPowerOfFour(_ n: Int) -> Bool {
        return ((n&(n-1) == 0) && (n % 3 == 1))
    }
}

//https://leetcode.com/problems/excel-sheet-column-title/description/

| **Step**                  | **Explanation**                                                                                               |
| ------------------------- | ------------------------------------------------------------------------------------------------------------- |
| **1. Subtract 1**         | Subtract 1 from the `columnNumber` to handle 1-based indexing (e.g., `A = 1`, `B = 2`, etc.).                 |
| **2. Modulo Operation**   | Calculate `columnNumber % 26` to get the remainder, which maps to a letter (`0 → A`, `1 → B`, ..., `25 → Z`). |
| **3. Map to Character**   | Convert the remainder to its corresponding letter using `UnicodeScalar(remainder + 65)`.                      |
| **4. Prepend the Letter** | Add the mapped letter to the result string (we prepend because we build the title from right to left).        |
| **5. Divide by 26**       | Divide `columnNumber` by 26 and repeat the process until the number becomes 0.                                |
| **Input (columnNumber)** | **Output (Excel Column Title)** |
| ------------------------ | ------------------------------- |
| `1`                      | `"A"`                           |
| `28`                     | `"AB"`                          |
| `701`                    | `"ZY"`                          |

class Solution {
// Olog(n) This is because the algorithm iterates logarithmically with base 26, as it continuously divides the input by 26 until it reaches 0
    func convertToTitle(_ columnNumber: Int) -> String {
      var result = ""
      var number = columnNumber
          while number > 0 {
            number -= 1
            let reminder = number % 26
            let char =  Character(UnicodeScalar(reminder + 65)!) 
            result = String(char) + result
            number /= 26
          }
          return result
    }
}

// https://leetcode.com/problems/reverse-integer/description/

| **Step** | `remaining` | `lastDigit` = `remaining % 10` | `reversedNumber` (before \*10 + lastDigit) | `reversedNumber` (after) |
| -------: | ----------- | ------------------------------ | ------------------------------------------ | ------------------------ |
|        1 | 123         | 3                              | 0                                          | 0 \* 10 + 3 = **3**      |
|        2 | 12          | 2                              | 3                                          | 3 \* 10 + 2 = **32**     |
|        3 | 1           | 1                              | 32                                         | 32 \* 10 + 1 = **321**   |
|        4 | 0           | —                              | —                                          | Loop ends                |


class Solution {
    func reverse(_ number: Int) -> Int {
        var reversedNumber = 0
        var remaining = number

        while remaining != 0 {
            // Get the last digit
            let lastDigit = remaining % 10

            // Add it to the reversed number (shift left by 1 digit)
            reversedNumber = reversedNumber * 10 + lastDigit

            // Remove the last digit from the remaining number
            remaining /= 10
        }

        // Check if the reversed number fits in a 32-bit signed integer
        if reversedNumber < Int32.min || reversedNumber > Int32.max {
            return 0
        }

        return reversedNumber
    }
}

//https://leetcode.com/problems/factorial-trailing-zeroes/
// 🧠 Key Insight:
// Trailing zeroes come from multiples of 10.
// Each 10 = 2 × 5, and we get plenty of 2s from even numbers.
// So, the number of 5s in the prime factorization of n! determines the number of trailing zeroes.
✅ Approach:
Count how many multiples of 5, 25, 125, ... are in n.
Each contributes more 5s to the factorial.

class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        // Initialize count to keep track of the number of trailing zeroes
        var count = 0
        
        // Initialize divisor to 5 (the smallest power of 5 we need to consider)
        var divisor = 5
        
        // Loop while the divisor is less than or equal to n
        while divisor <= n {
            // Add the number of times n can be divided by the current divisor
            count += n / divisor
            
            // Move to the next power of 5 (e.g., 5, 25, 125, ...)
            divisor *= 5
        }
        
        // Return the total count of trailing zeroes
        return count
    }
}
//https://leetcode.com/problems/fibonacci-number/description/

class Solution {
    func fib(_ n: Int) -> Int {
        if n == 0 { return 0 }
        if n == 1 { return 1 }

        var prev = 0
        var curr = 1

        for _ in 2...n {
            let next = prev + curr
            prev = curr
            curr = next
        }

        return curr
    }
}
// Or using recursion...
//TC O(2^n)
//SC O(n)
class Solution {
    func fib(_ n: Int) -> Int {
        if n == 1 || n == 0 { return n }
        return fib(n-1) + fib(n-2)
    }
}

// Sieve of Eratosthenes
https://www.geeksforgeeks.org/problems/sieve-of-eratosthenes5242/1?utm_source=geeksforgeeks&utm_medium=article_practice_tab&utm_campaign=article_practice_tabntiation
import Foundation

/// Generates all prime numbers up to a given limit `n` using the Sieve of Eratosthenes algorithm.
func sieveOfEratosthenes(upTo n: Int) -> [Int] {
    // Edge case: No primes below 2
    guard n >= 2 else { return [] }

    // Step 1: Initialize a Boolean array to track primality
    var isPrime = Array(repeating: true, count: n + 1)
    isPrime[0] = false
    isPrime[1] = false

    // Step 2: Mark non-primes using sieve logic
    for i in 2...Int(sqrt(Double(n))) {
        if isPrime[i] {
            // Mark all multiples of i as non-prime
            for multiple in stride(from: i * i, through: n, by: i) {
                isPrime[multiple] = false
            }
        }
    }

    // Step 3: Collect all prime numbers
    var primes: [Int] = []
    for i in 2...n {
        if isPrime[i] {
            primes.append(i)
        }
    }

    return primes
}
let primesUpTo100 = sieveOfEratosthenes(upTo: 100)
print(primesUpTo100)
// Output: [2, 3, 5, 7, 11, 13, 17,

//: Factorial Numbers Less Than or Equal to N
class FactorialHelper {
    /// Returns a list of all factorial numbers less than or equal to `n`.
    /// A factorial number is of the form: 1!, 2!, 3!, ...
    func factorialNumbers(lessThanOrEqualTo n: Int) -> [Int] {
        var result: [Int] = []
        var factorial = 1
        var i = 1

        // Generate factorials until the value exceeds n
        while factorial <= n {
            result.append(factorial)
            i += 1
            factorial *= i
        }

        return result
    }
}

//: GCD, LCM, and Custom Value Calculation
//https://getsdeready.com/courses/dsa/lesson/gcd-lcm-and-distributive-property/

class NumberHelper {
    
    /// Calculates the Greatest Common Divisor (GCD) of two integers using the Euclidean algorithm.
    static func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        }
        return gcd(b, a % b)
    }

    /// Calculates the Least Common Multiple (LCM) of two integers.
    static func lcm(_ a: Int, _ b: Int) -> Int {
        return (a * b) / gcd(a, b)
    }

    /// Computes: GCD(LCM(x, y), LCM(x, z))
    static func findValue(x: Int, y: Int, z: Int) -> Int {
        let lcmXY = lcm(x, y)
        let lcmXZ = lcm(x, z)
        return gcd(lcmXY, lcmXZ)
    }
}
//https://getsdeready.com/courses/dsa/lesson/product-of-prime-factors/


| Step | Current Value | Divisor Tried | Is Divisible? | Result After Division | Prime Factor Found? |
| ---- | ------------- | ------------- | ------------- | --------------------- | ------------------- |
| 1    | 500           | 2             | ✅ Yes         | 250                   | ✅ 2                 |
| 2    | 250           | 2             | ✅ Yes         | 125                   | ✅ 2                 |
| 3    | 125           | 2             | ❌ No          | —                     | —                   |
| 4    | 125           | 3             | ❌ No          | —                     | —                   |
| 5    | 125           | 5             | ✅ Yes         | 25                    | ✅ 5                 |
| 6    | 25            | 5             | ✅ Yes         | 5                     | ✅ 5                 |
| 7    | 5             | 5             | ✅ Yes         | 1                     | ✅ 5                 |

Step-by-Step Prime Factorization of 500
We start with N = 500
We’ll divide it by the smallest prime numbers: 2, 3, 5, 7, ..., repeatedly.

✅ Step 1: Try dividing by 2
500 ÷ 2 = 250
250 ÷ 2 = 125
125 ÷ 2 = not divisible → stop here

So 2 appears twice in the factorization.

500 = 2 × 2 × 125
✅ Step 2: Try dividing by 3
125 ÷ 3 = not divisible → skip

✅ Step 3: Try dividing by 5
125 ÷ 5 = 25
25 ÷ 5 = 5
5 ÷ 5 = 1

Now we’re done — fully divided.

So 5 appears three times.

class PrimeProductCalculator {
    
    /// Returns the product of all **distinct prime factors** of `n`.
    func productOfDistinctPrimeFactors(of n: Int) -> Int {
        var n = n
        var product = 1
        
        // Check for each number from 2 up to sqrt(n)
        for i in 2...Int(sqrt(Double(n))) {
            if n % i == 0 {
                // If `i` is a prime factor, include it once
                product *= i
                
                // Divide all powers of this prime factor out of `n`
                while n % i == 0 {
                    n /= i
                }
            }
        }
        
        // If `n` is still greater than 1, it's a prime number itself
        if n > 1 {
            product *= n
        }
        /*
        n = 13 (which is prime)
Loop checks 2 and 3 — no match

So product is still 1

But 13 is a valid prime factor of itself

👉 We check:

swift
Copy
Edit
if n > 1 {
    product *= 13  // Adds the missing prime factor
}
        */
        return product
    }
}

