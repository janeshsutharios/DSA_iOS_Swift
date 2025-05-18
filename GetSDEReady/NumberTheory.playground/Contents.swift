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
// Pending.. https://getsdeready.com/courses/dsa/lesson/ncr-computations-using-inverse-modulo/

// https://getsdeready.com/courses/dsa/lesson/find-all-factorial-numbers-less-than-or-equal-to-n/
// Input: N = 6 Output: 1 2 6 Explanation: The first three factorial numbers are less than equal to N but the fourth factorial number 24 is greater than N. So we print only first three factorial numbers.
class Solution {
    
    /// Returns an array of all factorial numbers less than or equal to the given limit.
    ///
    /// - Parameter limit: The maximum value up to which factorial numbers should be included.
    /// - Returns: An array of factorial numbers less than or equal to `limit`.
    static func factorialNumbers(upto limit: Int) -> [Int] {
        var factorialList: [Int] = []
        var currentFactorial = 1
        var number = 1

        // Keep generating factorials until the next one exceeds the limit
        while currentFactorial <= limit {
            factorialList.append(currentFactorial)
            number += 1
            currentFactorial *= number
        }

        return factorialList
    }
}


// https://getsdeready.com/courses/dsa/lesson/gcd-lcm-and-distributive-property/
/*
Input: x = 15, y = 20, z = 100
Output: 60
Explanation: GCD(LCM(15,20), LCM(15,100)) =GCD(60,300)=60.
*/
class Solution {

    /// Computes the Greatest Common Divisor (GCD) using the Euclidean algorithm.
    ///
    /// - Parameters:
    ///   - a: First integer
    ///   - b: Second integer
    /// - Returns: The GCD of a and b
    static func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        }
        return gcd(b, a % b)
    }

    /// Computes the Least Common Multiple (LCM) using GCD.
    ///
    /// - Parameters:
    ///   - a: First integer
    ///   - b: Second integer
    /// - Returns: The LCM of a and b
    static func lcm(_ a: Int, _ b: Int) -> Int {
        return (a * b) / gcd(a, b)
    }

    /// Finds GCD of LCM(x, y) and LCM(x, z).
    ///
    /// - Parameters:
    ///   - x: First integer
    ///   - y: Second integer
    ///   - z: Third integer
    /// - Returns: GCD(LCM(x, y), LCM(x, z))
    static func findValue(x: Int, y: Int, z: Int) -> Int {
        let lcmXY = lcm(x, y)
        let lcmXZ = lcm(x, z)
        return gcd(lcmXY, lcmXZ)
    }
}

// https://getsdeready.com/courses/dsa/lesson/product-of-prime-factors/
class Solution {
    
    /// Computes the product of all **distinct prime factors** of a given number.
    ///
    /// - Parameter number: The integer for which to compute the product of prime factors.
    /// - Returns: The product of all unique prime factors of the number.
    static func primeProduct(of number: Int) -> Int {
        var remaining = number
        var productOfPrimes = 1
        
        for factor in 2...Int(Double(remaining).squareRoot()) {
            if remaining % factor == 0 {
                productOfPrimes *= factor
                while remaining % factor == 0 {
                    remaining /= factor
                }
            }
        }
        
        // If what's left is a prime greater than sqrt(original number)
        if remaining > 1 {
            productOfPrimes *= remaining
        }
        
        return productOfPrimes
    }
}

// https://getsdeready.com/courses/dsa/lesson/find-prime-numbers-in-a-range/

class Solution {

    /// Returns a list of prime numbers in the range [start, end].
    ///
    /// - Parameters:
    ///   - start: The lower bound of the range.
    ///   - end: The upper bound of the range.
    /// - Returns: An array of prime numbers between start and end (inclusive).
    func primeRange(from start: Int, to end: Int) -> [Int] {
        var primes: [Int] = []
        
        for number in start...end {
            if isPrime(number) {
                primes.append(number)
            }
        }
        
        return primes
    }

    /// Checks whether a number is prime.
    ///
    /// - Parameter number: The number to check.
    /// - Returns: `true` if the number is prime, `false` otherwise.
    private func isPrime(_ number: Int) -> Bool {
        if number <= 1 { return false }
        if number == 2 { return true }

        for i in 2...Int(Double(number).squareRoot()) {
            if number % i == 0 {
                return false
            }
        }
        
        return true
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
//https://getsdeready.com/courses/dsa/lesson/find-prime-numbers-in-a-range/
// TC: O((N - M + 1) * sqrt(N))
// SC: O(1)

class PrimeRangeFinder {
    
    /// Returns a list of prime numbers in the range [start...end].
    func primeNumbers(inRange start: Int, to end: Int) -> [Int] {
        var primes: [Int] = []

        for number in start...end {
            if isPrime(number) {
                primes.append(number)
            }
        }

        return primes
    }

    /// Checks if a number is prime using divisor count logic.
    private func isPrime(_ n: Int) -> Bool {
        if n < 2 { return false } // 0 and 1 are not prime

        var divisorCount = 0

        for i in 1...Int(sqrt(Double(n))) {
            if n % i == 0 {
                divisorCount += 1  // i is a divisor
                if i != n / i {
                    divisorCount += 1  // n/i is also a divisor
                }
            }
        }

        return divisorCount == 2  // Only 1 and n are divisors
    }
}

