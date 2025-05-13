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
// Add two numbers without using airthmatic operator 
// https://leetcode.com/problems/add-two-integers/description/
class Solution {
    /* Using Loop
    func sum(_ num1: Int, _ num2: Int) -> Int {
        var num1 = num1, num2 = num2
        while num2 != 0 {
            let carry = num1 & num2 // find carry
            num1 = num1 ^ num2 // do sumWithoutCarry
            num2 = carry << 1 // shift carry to next head
        }
       return num1// because  ^ sum operation we are storing in num1
    }*/
    // Using recursion 
    func sum(_ num1: Int, _ num2: Int) -> Int {
       if num2 == 0 { return num1 }
        let carry = num1 & num2
        let sumWithoutCarry = num1 ^ num2 
        return sum(sumWithoutCarry, carry << 1)
    }

}
// TC O(n)
// SC O(1)

class Solution {
    // Function to compute the product of all divisors of a number 'n' modulo 10^9 + 7
    func factorProduct(_ n: Int) -> Int {
        let mod = 1_000_000_007  // A large prime number to prevent overflow
        var product: Int = 1  // Initialize the product to 1 (neutral element for multiplication)
        
        // Loop through all numbers from 1 to sqrt(n)
        var i = 1
        while i * i <= n {
            // Check if 'i' is a divisor of 'n'
            if n % i == 0 {
                let pairedDivisor = n / i  // Find the paired divisor 'n / i'
                
                // If 'i' and 'pairedDivisor' are the same (i.e., n is a perfect square)
                if i == pairedDivisor {
                    // Multiply only once if both divisors are the same (e.g., 4 for n = 16)
                    product = (product * i) % mod
                } else {
                    // If divisors are different, multiply both 'i' and 'pairedDivisor'
                    product = (product * i) % mod
                    product = (product * pairedDivisor) % mod
                }
            }
            i += 1  // Move to the next possible divisor
        }
        
        // Return the product modulo 10^9 + 7
        return product
    }
}




