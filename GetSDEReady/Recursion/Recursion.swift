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
