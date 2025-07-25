
// https://getsdeready.com/courses/dsa/lesson/divisor-game/
// https://leetcode.com/problems/divisor-game/description/
class Solution {
    func divisorGame(_ n: Int) -> Bool {
        //n % 2 == 0
         (n & 1) == 0  // The binary & (bitwise AND) checks the least significant bit (LSB) of n.
      //(n & 1) == 0 means: check if n is even.
    }
}
// https://getsdeready.com/courses/dsa/lesson/n-th-tribonacci-number/
// https://leetcode.com/problems/n-th-tribonacci-number/description/
class Solution {
    func tribonacci(_ n: Int) -> Int {
        if n == 0 { return 0 }
        if n == 1 || n == 2 { return 1 }

        var dp = [0, 1, 1]
        for i in 3...n {
            dp[i % 3] = dp[0] + dp[1] + dp[2]
        }
        return dp[n % 3]
    }
}

/*
class Solution {
    func tribonacci(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        guard n > 2 else { return 1 }
        
        var result = 0
        var (a, b, c) = (0, 1, 1)
        for _ in 3...n {
            result = c + b + a
            a = b
            b = c
            c = result
        }
        return result
    }
}*/

// https://getsdeready.com/courses/dsa/lesson/maximum-length-of-pair-chain/
// https://leetcode.com/problems/maximum-length-of-pair-chain/description/
class Solution {
    func findLongestChain(_ pairs: [[Int]]) -> Int {
        let sortedPairs = pairs.sorted { $0[1] < $1[1] }  // Sort by end value
        var currentEnd = Int.min
        var count = 0

        for pair in sortedPairs {
            if pair[0] > currentEnd {
                count += 1
                currentEnd = pair[1]
            }
        }

        return count
    }
}
