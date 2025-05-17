import Fondation
//https://leetcode.com/problems/number-of-common-factors/description/
// TC:O(log(min(a, b)) + √g), where g = gcd(a, b)
// SC: O(1)

class Solution {
    func commonFactors(_ a: Int, _ b: Int) -> Int {
        let gcd = gcd(a,b)
        return commonDivisior(gcd)
    }
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return a
    }
    // We have taken square here because f*f <= N, hence f = squareRoot(n) example 6*6 = 36
    // Instead of using square root inbuilt function use i * i <= N 
    func commonDivisior(_ n: Int) -> Int {
        let sqrt = Int(Double(n).squareRoot())
        var count = 0
        for i in 1...sqrt {
            if n % i == 0 {
                if n / i == i {
                    // only one divider i.e. 36/6 == 6
                    count += 1 // i == n/i → count only once (perfect square root)
                } else {
                    // example two divider i.e. 1 and 36
                    count += 2// i and n/i are distinct → count both
                }
            }
        }
        return count
    }
}

// Add two numbers without using airthmatic operator because bitwise operator is quite faster than airthmetic operator
// https://leetcode.com/problems/add-two-integers/
class Solution {
    // Using Loop
    func sum(_ num1: Int, _ num2: Int) -> Int {
        var num1 = num1, num2 = num2
        while num2 != 0 {
            let carry = num1 & num2 // find carry
            num1 = num1 ^ num2 // do sum
            num2 = carry << 1 // shift carry to next 
        }
       return num1// because  ^ sum operation we are storing in num1
    }
    // Using recursion 
    func sum(_ num1: Int, _ num2: Int) -> Int {
       if num2 == 0 { return num1 }
        let carry = num1 & num2
        let sumWithoutCarry = num1 ^ num2 
        return sum(sumWithoutCarry, carry << 1)
    }

}
// https://getsdeready.com/courses/dsa/lesson/product-of-factors-of-number-2/
/*
Input: N=6
Output: 36
Explanation: Factors of 6 are 1,2,3,6.Their product is (1*2*3*6)%(109+7)=36.
*/
class Solution {
    /// Returns the product of all factors of the given number `n`, modulo 1_000_000_007.
    ///
    /// - Parameter n: The input number to find the product of its factors.
    /// - Returns: The product of all factors of `n`, modulo 1_000_000_007.
    func productOfFactors(of n: Int) -> Int {
        let modulo = 1_000_000_007
        var result = 1

        // Iterate from 1 to square root of n
        for divisor in 1...Int(Double(n).squareRoot()) {
            if n % divisor == 0 {
                let pairedDivisor = n / divisor

                if divisor == pairedDivisor {
                    // divisor is the square root of n, only multiply once
                    result = (result * divisor) % modulo
                } else {
                    // Multiply both divisor and its pair
                    result = (result * divisor) % modulo
                    result = (result * pairedDivisor) % modulo
                }
            }
        }

        return result
    }
}
let solution = Solution()
print(solution.productOfFactors(of: 10))  // Output: 100
print(solution.productOfFactors(of: 16))  // Output: 1024


/*
example 625 125 
36 72 
*/
//https://getsdeready.com/courses/dsa/lesson/repeating-gcd/
// https://www.geeksforgeeks.org/problems/repeating-gcd4659/1
// TC: (log⁡(min⁡(x.y))) 
// SC: O(1)
class Solution {
    func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        }
        return gcd(b, a % b)
    }

    func repeatedGcd(_ N: Int, _ x: Int, _ y: Int) -> Int {
        return gcd(x, y)
    }
}
// TC O(n)
// SC O(1)

class Solution {
    /// Computes the product of all positive divisors of a number `n`, modulo 10^9 + 7.
    /// - Parameter n: The input number
    /// - Returns: The product of all divisors modulo 1_000_000_007
    func factorProduct(_ n: Int) -> Int {
        let mod = 1_000_000_007  // A large prime used to prevent integer overflow
        var product = 1          // Initialize product as 1 (identity for multiplication)

        var i = 1
        while i * i <= n {
            if n % i == 0 {
                let pairedDivisor = n / i
                // Multiply by the divisor i
                product = (product * i) % mod

                // If pairedDivisor is different, multiply it too
                if i != pairedDivisor {
                    product = (product * pairedDivisor) % mod
                }
            }
            i += 1
        }

        return product
    }
}

//https://getsdeready.com/courses/dsa/lesson/sieve-of-eratosthenes-6/
/// Returns an array of all prime numbers up to and including `limit`
/// using the Sieve of Eratosthenes algorithm.
func findPrimes(upTo limit: Int) -> [Int] {
    // Edge case: No prime numbers below 2
    guard limit >= 2 else { return [] }

    // Create a boolean array to track prime status of numbers from 0 to limit
    // Initially, assume all numbers are prime
    var isPrime = [Bool](repeating: true, count: limit + 1)
    
    // 0 and 1 are not prime
    isPrime[0] = false
    isPrime[1] = false

    // Loop from 2 up to the square root of the limit
    // because any non-prime number `n` has at least one factor less than or equal to √n
    for number in 2...Int(Double(limit).squareRoot()) {
        if isPrime[number] {
            // Mark all multiples of `number` as not prime, starting from number * number
            for multiple in stride(from: number * number, through: limit, by: number) {
                isPrime[multiple] = false
            }
        }
    }

    // Collect all numbers still marked as prime
    var primes: [Int] = []
    for number in 2...limit {
        if isPrime[number] {
            primes.append(number)
        }
    }

    return primes
}

// Returns `true` if the given number is a factorial of some integer, otherwise `false`.
//https://www.geeksforgeeks.org/problems/factorial-number2446/1?utm_source=geeksforgeeks&utm_medium=ml_article_practice_tab&utm_campaign=article_practice_tab
func isFactorial(_ number: Int) -> Int {
    guard number >= 1 else { return -1}

    var factorial = 1
    var n = 1

    while factorial <= number {
        factorial *= n
        if factorial == number {
            return n
        }
        n += 1
    }

    return -1
}

print(isFactorial(24)) // gives 4

// https://getsdeready.com/courses/dsa/lesson/gcd-lcm/
// Input: A = 5 , B = 10 Output: 10 5 LCM of 5 and 10 is 10, while their GCD is 5.
class Solution {
    
    /// Returns the LCM and GCD of two integers as a tuple (lcm, gcd).
    static func lcmAndGcd(_ a: Int, _ b: Int) -> (lcm: Int, gcd: Int) {
        let gcd = findGCD(a, b)
        let lcm = findLCM(a, b, gcd)
        return (lcm, gcd)
    }

    /// Uses the Euclidean algorithm to find the greatest common divisor (GCD).
    private static func findGCD(_ m: Int, _ n: Int) -> Int {
        if m == 0 {
            return n
        }
        return findGCD(n % m, m)
    }

    /// Computes the least common multiple (LCM) using GCD.
    private static func findLCM(_ m: Int, _ n: Int, _ gcd: Int) -> Int {
        return (m * n) / gcd
    }
}
// https://getsdeready.com/courses/dsa/lesson/prime-numbers-and-primality-check/
/* Input: N = 100 Output: 2 5
Explanation: 2 and 5 are the unique prime factors of 100*/
class Solution {
    
    /// Returns a list of all **distinct prime factors** of the given number `n`.
    func allPrimeFactors(of n: Int) -> [Int] {
        var number = n
        var primeFactors: [Int] = []
        var lastPrime = 0

        // Check divisibility from 2 up to sqrt(number)
        for divisor in 2...Int(Double(number).squareRoot()) {
            while number % divisor == 0 {
                if divisor != lastPrime {
                    primeFactors.append(divisor)
                }
                lastPrime = divisor
                number /= divisor
            }
        }

        // If remaining number is a prime > sqrt(n)
        if number > 1 {
            primeFactors.append(number)
        }

        return primeFactors
    }
}
// Pending.. https://getsdeready.com/courses/dsa/lesson/modulo-arithmetic/
// Pending.. https://getsdeready.com/courses/dsa/lesson/binary-exponentiation/




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
