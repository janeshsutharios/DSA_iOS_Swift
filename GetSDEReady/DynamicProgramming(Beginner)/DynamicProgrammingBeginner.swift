// https://getsdeready.com/courses/dsa/lesson/pascals-triangle/
// https://leetcode.com/problems/pascals-triangle/
// Solution #1  loop
class Solution {
    // Time : o(n^2) double loop
    // Space o(n^2) 2D array.
    func generate(_ numRows: Int) -> [[Int]] {
        var pascalObject = [[Int]](repeating: [Int](), count: numRows)

        for i in 0..<numRows {
            pascalObject[i] = [Int](repeating: 0, count: i+1)

            for j in 0..<i+1 {
                if j == 0 || j == i {
                    pascalObject[i][j] = 1
                } else {
                    pascalObject[i][j] = pascalObject[i-1][j-1] + pascalObject[i-1][j]
                }
            }
        }

        return pascalObject
    }
} 

// https://getsdeready.com/courses/dsa/lesson/best-time-to-buy-and-sell-stock/
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
class Solution {
    
    func maxProfit(_ prices: [Int]) -> Int {
        var buyPrice = Int.max
        var maxProfit = 0

        for price in prices {
            if price < minPrice {
                minPrice = price      // new best buy day
            } else {
                maxProfit = max(maxProfit, price - minPrice) // possible sell today
            }
        }
        
        // for i in prices.indices {
        //     buyPrice = min(prices[i], buyPrice)
        //     maxProfit = max(prices[i] - buyPrice, maxProfit)
        // }
        return maxProfit
    }
}
// Cooldown/Fee (309/714)	✅ Yes	DP required	Complex transaction rules
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var sum = 0
        for i in 0..<prices.count - 1{
            if prices[i] < prices[i+1] {
                sum += prices[i+1] - prices[i]
            }

        }
        return sum
    }
}

// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        // Track lowest prices and best profits for two transactions
        var firstBuyCost = Int.max        // Min cost of first stock
        var firstSellProfit = 0           // Max profit after first sell

        var secondBuyEffectiveCost = Int.max  // Min cost after first profit used
        var secondSellTotalProfit = 0         // Max total profit after second sell

        for price in prices {
            // Minimize the cost of first buy
            firstBuyCost = min(firstBuyCost, price)

            // Maximize profit from first transaction
            firstSellProfit = max(firstSellProfit, price - firstBuyCost)

            // Minimize the effective cost of second buy (adjusted using firstSellProfit)
            secondBuyEffectiveCost = min(secondBuyEffectiveCost, price - firstSellProfit)

            // Maximize total profit after second sell
            secondSellTotalProfit = max(secondSellTotalProfit, price - secondBuyEffectiveCost)
        }

        return secondSellTotalProfit
    }
}

// https://getsdeready.com/courses/dsa/lesson/fibbonacci-number/
// https://leetcode.com/problems/fibonacci-number/description/
class Solution {
    // Best // TC: O(n)+O(1)
    // SC: O(1) It uses dynamic programming with storing values of prev2 & prev1
    func fib(_ n: Int) -> Int {
     if n <= 1 {return n}
    var prev2 = 0
    var prev1 = 1
    for _ in 2...n {
        let curr = prev1 + prev2
        prev2 = prev1
        prev1 = curr
    }
    return prev1
    }
}

// https://getsdeready.com/courses/dsa/lesson/house-robber/
// https://leetcode.com/problems/house-robber/description/
class Solution {
    func rob(_ houses: [Int]) -> Int {
        guard !houses.isEmpty else { return 0 }

        var maxLootWithPreviousHouse = 0   // equivalent to prev1
        var maxLootSkippingPrevious = 0    // equivalent to prev2

        for houseValue in houses {
            let temp = maxLootWithPreviousHouse

            // Choose max between:
            // 1. Skipping this house (maxLootWithPreviousHouse)
            // 2. Robbing this house and skipping the previous (maxLootSkippingPrevious + houseValue)
            maxLootWithPreviousHouse = max(maxLootSkippingPrevious + houseValue, maxLootWithPreviousHouse)

            maxLootSkippingPrevious = temp
        }

        return maxLootWithPreviousHouse
    }
}

    /*func rob(_ nums: [Int]) -> Int {
        // Edge case: If there are no houses, return 0
        if nums.isEmpty {
            return 0
        }
        
        // Edge case: If there is only one house, return the amount in that house
        if nums.count == 1 {
            return nums[0]
        }
        
        // Create an array to store the maximum amount of money that can be robbed up to each house
        var dp = [Int](repeating: 0, count: nums.count)
        
        // Base cases:
        dp[0] = nums[0] // If there's only one house, the max amount is the amount in that house
        dp[1] = max(nums[0], nums[1]) // If there are two houses, take the maximum of the two
        
        // Iterate through the houses starting from the third house
        for i in 2..<nums.count {
            // For each house, choose between robbing this house and adding its value to the maximum amount up to house i-2
            // or not robbing this house and taking the maximum amount up to house i-1
            dp[i] = max(dp[i-1], dp[i-2] + nums[i])
        }
        
        // The last element in the dp array contains the maximum amount that can be robbed from all houses
        return dp[nums.count - 1]
    }
}*/

// https://getsdeready.com/courses/dsa/lesson/climbing-stairs/
// https://leetcode.com/problems/climbing-stairs/description/
class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 0 || n == 1 {
            return 1
        }

        var prev1 = 1
        var prev2 = 1

        for _ in 2...n {
            let temp = prev1
            prev1 = prev2 + temp
            prev2 = temp
        }

        return prev1
    }
}
/*
class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 0 || n == 1 {
            return 1
        }

        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1

        for i in 2...n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }

        return dp[n]
    }
}
*/

// https://getsdeready.com/courses/dsa/lesson/length-of-longest-fibonacci-subsequence/
// https://leetcode.com/problems/length-of-longest-fibonacci-subsequence/description/
// https://github.com/janeshsutharios/DSA_Swift/blob/main/GetSDEReady/Images/873.%20Length%20of%20Longest%20Fibonacci%20Subsequence.jpeg
class Solution {
    func lenLongestFibSubseq(_ arr: [Int]) -> Int {
        var n = arr.count
        var numSet: Set<Int> = []
        for num in arr {
            numSet.insert(num)
        }
        
        var maxLen = 0
       // Try all possible first two numbers of sequence
        for i in 0..<n {
            for j in i+1..<n {
              // Start with first two numbers
                var currentNum = arr[j]
                var nextFiboNum = arr[i] + arr[j]
                var len = 2
                // Keep finding next Fibonacci number
                while numSet.contains(nextFiboNum) {// O(1) lookup
                // Update values for next iteration
                    var temp = nextFiboNum
                    nextFiboNum += currentNum
                    currentNum = temp
                    len += 1
                    maxLen = max(maxLen, len)
                }
            }
        }
        return maxLen
    }
}
// https://getsdeready.com/courses/dsa/lesson/min-jumps-array/
// https://leetcode.com/problems/jump-game/
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var m = 0
        for (index, item) in nums.enumerated() {
            // If index is greater means frong has jumped beyond the array
            if index > m  {
                return false
            }
            m = max(m, index + item)
        }
        return true
    }
}
// 
// https://leetcode.com/problems/jump-game-ii/description/
class Solution {
    func jump(_ nums: [Int]) -> Int {
        var jumps = 0               // Count of jumps made so far
        var curEnd = 0              // The end index of the current jump window
        var curFarthest = 0         // The farthest index we can reach in the current window
        
        // We loop until the second last index, because once we reach the last index, we don't need to jump further
        for i in 0..<nums.count - 1 {
            // Update the farthest we can reach from this position
            curFarthest = max(curFarthest, i + nums[i])
            
            // If we have reached the end of the current jump window
            if i == curEnd {
                jumps += 1               // Make a jump
                curEnd = curFarthest     // Update the end of the next jump window
            }
        }
        return jumps     // Return the total jumps needed to reach the end
    }
}
// https://getsdeready.com/courses/dsa/lesson/longest-increasing-subsequence/
// https://leetcode.com/problems/longest-increasing-subsequence/
class Solution {
    // Intution just keep an array which have shorter number then this & return max of number
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        // Array to store the length of the LIS ending at each index
        var dp = [Int](repeating: 1, count: nums.count)
        
        for i in 1..<nums.count {
            // Check all previous elements to find the longest subsequence ending at i
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        // The length of the longest increasing subsequence will be the maximum value in dp array
        return dp.max() ?? 0
    }
}
// https://getsdeready.com/courses/dsa/lesson/pascals-triangle-ii/
// https://leetcode.com/problems/pascals-triangle-ii/
class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 { return [1] }
        var row = Array(repeating: 0, count: rowIndex + 1)
        row[0] = 1

        for currentRow in 1...rowIndex {
            for position in stride(from: currentRow, through: 1, by: -1) {
                row[position] += row[position - 1]
            }
        }
        return row
    }
}
// Brute force or all values.
/*class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var pascalObject = [[Int]](repeating: [Int](), count: rowIndex+1)

        for i in 0..<rowIndex+1 {
            pascalObject[i] = [Int](repeating: 0, count: i+1)

            for j in 0..<i+1 {
                if j == 0 || j == i {
                    pascalObject[i][j] = 1
                } else {
                    pascalObject[i][j] = pascalObject[i-1][j-1] + pascalObject[i-1][j]
                }
            }
        }
        return pascalObject.last ?? []
    }
}*/
