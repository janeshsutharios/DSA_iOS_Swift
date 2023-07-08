import UIKit

var greeting = "Hello, playground"

// Question:1  Find Fibonacci series nth number
// Method: 1 Basic Recursion
    // TC: 2^n
    // SC: 2^n
//func fib(_ n: Int) ->Int {
//    if n <= 1 {
//        return n
//    }
//    return fib(n-1) + fib(n-2)
//}
//
//print(fib(5))

// Method: 2 Dynamic Programming |
// TC: O(n)+O(1)
// SC: O(n)+ O(n)
//func fib(_ n: Int, _ dp: inout [Int]) ->Int {
//    if n <= 1 { return n }
//    if dp[n] != -1 {return dp[n]}
//    dp[n] = fib(n-1, &dp) + fib(n-2, &dp)
//    return dp[n]
//}
//var n = 5
//var dp: [Int] = Array.init(repeating: -1, count: n+1)
//print(fib(n, &dp))

// Method: 3 Best Approach Dynamic Programming ||
// TC: O(n)+O(1)
// SC: O(1)
//func fib(_ n: Int) ->Int {
//    if n <= 1 {return n}
//    var prev2 = 0
//    var prev1 = 1
//    for _ in 2...n {
//        let curr = prev1 + prev2
//        prev2 = prev1
//        prev1 = curr
//    }
//    return prev1
//}
//var n = 5
//print(fib(n))

// Quesion2 :- Get the min effort in frog jump n = 6 & heights array . Approach 1 Dynamic programming
// Approach 1: Using Dynamic programming.
// TC: O(n^2)
// SC: O(n)
//func frogJump(_ n : Int, _ height: [Int], dp: inout [Int]) -> Int {
//    if n == 0 { return 0 }
//    if dp[n] != -1 { return dp[n] }
//    var fs = frogJump(n-1, height, dp: &dp) + abs(height[n] - height[n-1])
//    var ss = Int.max // declared before to avoid out of index & not entered in if case.
//    if n > 1 {
//        ss = frogJump(n-2, height, dp: &dp) + abs(height[n] - height[n-2])
//    }
//    dp[n] = min(fs, ss)
//    return dp[n]
//}
//
//var heights: [Int] = [30, 10, 60, 10, 60, 50]
//var n = heights.count
//var dp: [Int] = Array.init(repeating: -1, count: n)
//let resultValue = frogJump(n-1, heights, dp: &dp)
//print(resultValue)
//print(dp)

// Approach 2: Using Dynamic programming with tabulization..
// TC: O(n)
// SC: O(n)
//func frogJump(_ n : Int, _ height: [Int], dp: inout [Int]) -> Int {
//       dp[0] = 0
//    for i in 1..<n {
//        var fs = dp[i-1] + abs(height[i] - height[i-1])
//        var ss = Int.max// declared before to avoid out of index & not entered in if case.
//        if i > 1 {
//            ss = dp[i-2] + abs(height[i] - height[i-2])
//        }
//        dp[i] = min(fs, ss)
//
//    }
//    return dp[n-1]// last number
//}
//
//var heights: [Int] = [30, 10, 60, 10, 60, 50]
//var n = 6
//var dp: [Int] = Array.init(repeating: -1, count: n)
//let resultValue = frogJump(n, heights, dp: &dp)
//print(resultValue)
//print(dp)
//n = 2 op = 20
//n = 3 op = 30
//n = 4 op = 20
//n = 5 op = 30
//n = 6 op = 40

// Approach 3: 



// Quesion:- Get the min effort in frog jump n = 6 & heights array . Approach 2 Tabulation

//func frogJump(_ n : Int, _ height: [Int]) -> Int {
//    var prev1 = 0
//    var prev2 = 0
//    for i in 1..<n {
//        var fs = prev1 + abs(height[i] - height[i-1])
//        var ss = Int.max
//        if i > 1 {
//            ss = prev2 + abs(height[i] - height[i-2])
//        }
//        var curr = min(fs, ss)
//        prev2 = prev1
//        prev1 = curr
//
//    }
//    return prev1
//}
//var n = 6
//var heights: [Int] = [30, 10, 60, 10, 60, 50]
//let resultValue = frogJump(n, heights)
//print(resultValue)
//print(heights)
