// Question# calculate power of n n ^ x
// Example 2 power 5 = 2*2*2*2*2 = 32
// Solution #1 using Loop
// TC O(n) & SC O(1)
func powerOf(_ x: Int, _ n: Int) -> Int {
      var result = x
      for _ in 1..<n {
          result *= x
      }
      return result
}

// Solution #2  using Recursion
// TC O(N) & OC O(n)
func powerOf(_ x: Int, _ n: Int) -> Int {
    if n <= 1 {return x}
    return x * powerOf(x, n-1)
}

 print(powerOf(2,5)) // output 32
 
// Solution #3  using Recursion + divide
// Example 2power64 can be written as 2power32 X 2power32. hence we will do half*half
// TC & OC = O(log(n))

func powerOf(_ x: Int, _ n: Int) -> Int {
    if n == 0 { return 1 }

    let half = powerOf(x, n / 2)
    var result = half * half

    if n % 2 == 1 { // because if n = 65 then 2 power 32 X 2 power 32 X 2 = 2 power 65
    // this can be also return as n & 1 == 1
        result *= x
    }

    return result
}
// Power of four 
// https://leetcode.com/problems/power-of-four/description/
//Input: n = 16
//Output: true
class Solution {
    func isPowerOfFour(_ n: Int) -> Bool {
     return n > 0 && (n & (n-1) == 0 )  && (n & 0x55555555) != 0
    }
}
/* Explanation */
/*
func getPowerOfFour(num: Int) -> Int {
    if num == 0 {
        return 1
    }
    return 4 * getPowerOfFour(num: num-1)
}
print("getPowerOfFour", getPowerOfFour(num: 3))

So the digits at odd number will be turned on & trip off power of two

0x55555555 is hexadecimal---> 1010101010101010101010101010101
1010101010101010101010101010101
current------------> 1 00000001 1
current------------> 4 00000100 100
current-----------> 16 00010000 10000
current-----------> 64 01000000 1000000

// Swiftier solution 
func isPowerOfFour(_ n: Int) -> Bool {
        guard n != 1 else { return true }
        return n.nonzeroBitCount == 1 && n.trailingZeroBitCount % 2 == 0
    }

*/
