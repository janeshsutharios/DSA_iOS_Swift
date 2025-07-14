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
