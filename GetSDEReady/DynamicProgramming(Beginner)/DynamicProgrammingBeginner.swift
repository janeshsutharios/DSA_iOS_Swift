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
// Multi buy/sell (122)	✅ Yes	DP required	Must use DP
// Cooldown/Fee (309/714)	✅ Yes	DP required	Complex transaction rules
