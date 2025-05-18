// https://getsdeready.com/courses/dsa/lesson/plus-one/
/// Adds one to a number represented as an array of digits.
/// - Parameter digits: An array of digits representing a non-negative integer.
/// - Returns: A new array of digits representing the number plus one.
func plusOne(_ digits: [Int]) -> [Int] {
    var result = digits
    let lastIndex = result.count - 1

    // Traverse the digits array from right to left
    for index in stride(from: lastIndex, through: 0, by: -1) {
        if result[index] < 9 {
            // If the digit is less than 9, just increment and return early
            result[index] += 1
            return result
        } else {
            // If digit is 9, set it to 0 and continue to carry over
            result[index] = 0
        }
    }

    // If all digits were 9 (e.g., [9, 9, 9]), add an extra leading 1
    // Example: [9, 9, 9] -> [1, 0, 0, 0]
    var expandedResult = [Int](repeating: 0, count: result.count + 1)
    expandedResult[0] = 1
    return expandedResult
}
//  Test with [1,9,9] [1,4,3] [9,9,9]

// https://getsdeready.com/courses/dsa/lesson/sqrtx/
// https://leetcode.com/problems/sqrtx/
//Time: O(log n) (binary search)
//Space: O(1)
class Solution {
    func integerSquareRoot(_ number: Int) -> Int {
        // Special case: square root of 0 is 0
        if number == 0 { return 0 }

        var low = 1
        var high = number

        // Binary search for the integer square root
        while low <= high {
            let mid = (low + high) / 2
            let midSquared = mid * mid

            if midSquared == number {
                // Exact square root found
                return mid
            } else if midSquared < number {
                // Move right to search larger values
                low = mid + 1
            } else {
                // Move left to search smaller values
                high = mid - 1
            }
        }

        // When not a perfect square, return floor of square root
        return high
    }
}

// https://leetcode.com/problems/power-of-four/
// https://getsdeready.com/courses/dsa/lesson/power-of-four/
/*
1. ((n & (n - 1)) == 0)
This checks if n is a power of 2.

Why it works: A power of 2 has only one bit set in binary. For example:

1 → 0001

2 → 0010

4 → 0100

8 → 1000

For such numbers, n & (n - 1) will be 0.
Example:

n = 4 (0100), n-1 = 3 (0011)

4 & 3 = 0000

This ensures n is a power of 2.

2. n % 3 == 1
This is a mathematical trick to filter out powers of 2 that are not powers of 4.

Observation:

Powers of 4 (like 1, 4, 16, 64...) all give remainder 1 when divided by 3

Powers of 2 that are not powers of 4 (like 2, 8, 32...) do not give remainder 1
*/
class Solution {
    // TC: O(1)
    // SC: O(1)
    func isPowerOfFour(_ n: Int) -> Bool {
        return ((n&(n-1) == 0) && (n % 3 == 1))
    }
}

//https://leetcode.com/problems/excel-sheet-column-title/description/

| **Step**                  | **Explanation**                                                                                               |
| ------------------------- | ------------------------------------------------------------------------------------------------------------- |
| **1. Subtract 1**         | Subtract 1 from the `columnNumber` to handle 1-based indexing (e.g., `A = 1`, `B = 2`, etc.).                 |
| **2. Modulo Operation**   | Calculate `columnNumber % 26` to get the remainder, which maps to a letter (`0 → A`, `1 → B`, ..., `25 → Z`). |
| **3. Map to Character**   | Convert the remainder to its corresponding letter using `UnicodeScalar(remainder + 65)`.                      |
| **4. Prepend the Letter** | Add the mapped letter to the result string (we prepend because we build the title from right to left).        |
| **5. Divide by 26**       | Divide `columnNumber` by 26 and repeat the process until the number becomes 0.                                |
| **Input (columnNumber)** | **Output (Excel Column Title)** |
| ------------------------ | ------------------------------- |
| `1`                      | `"A"`                           |
| `28`                     | `"AB"`                          |
| `701`                    | `"ZY"`                          |

// https://getsdeready.com/courses/dsa/lesson/excel-sheet-column-title/
class Solution {
// Olog(n) This is because the algorithm iterates logarithmically with base 26, as it continuously divides the input by 26 until it reaches 0
    func convertToTitle(_ columnNumber: Int) -> String {
      var result = ""
      var number = columnNumber
          while number > 0 {
            number -= 1
            let reminder = number % 26
            let char =  Character(UnicodeScalar(reminder + 65)!) 
            result = String(char) + result
            number /= 26
          }
          return result
    }
}

// https://leetcode.com/problems/reverse-integer/description/
// https://getsdeready.com/courses/dsa/lesson/reverse-integer/
| **Step** | `remaining` | `lastDigit` = `remaining % 10` | `reversedNumber` (before \*10 + lastDigit) | `reversedNumber` (after) |
| -------: | ----------- | ------------------------------ | ------------------------------------------ | ------------------------ |
|        1 | 123         | 3                              | 0                                          | 0 \* 10 + 3 = **3**      |
|        2 | 12          | 2                              | 3                                          | 3 \* 10 + 2 = **32**     |
|        3 | 1           | 1                              | 32                                         | 32 \* 10 + 1 = **321**   |
|        4 | 0           | —                              | —                                          | Loop ends                |


class Solution {
    func reverse(_ number: Int) -> Int {
        var reversedNumber = 0
        var remaining = number

        while remaining != 0 {
            // Get the last digit
            let lastDigit = remaining % 10

            // Add it to the reversed number (shift left by 1 digit)
            reversedNumber = reversedNumber * 10 + lastDigit

            // Remove the last digit from the remaining number
            remaining /= 10
        }

        // Check if the reversed number fits in a 32-bit signed integer
        if reversedNumber < Int32.min || reversedNumber > Int32.max {
            return 0
        }

        return reversedNumber
    }
}

// https://leetcode.com/problems/factorial-trailing-zeroes/
// https://getsdeready.com/courses/dsa/lesson/factorial-trailing-zeroes/
// 🧠 Key Insight:
// Trailing zeroes come from multiples of 10.
// Each 10 = 2 × 5, and we get plenty of 2s from even numbers.
// So, the number of 5s in the prime factorization of n! determines the number of trailing zeroes.
✅ Approach:
Count how many multiples of 5, 25, 125, ... are in n.
Each contributes more 5s to the factorial.

class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        // Initialize count to keep track of the number of trailing zeroes
        var count = 0
        
        // Initialize divisor to 5 (the smallest power of 5 we need to consider)
        var divisor = 5
        
        // Loop while the divisor is less than or equal to n
        while divisor <= n {
            // Add the number of times n can be divided by the current divisor
            count += n / divisor
            
            // Move to the next power of 5 (e.g., 5, 25, 125, ...)
            divisor *= 5
        }
        
        // Return the total count of trailing zeroes
        return count
    }
}
// https://leetcode.com/problems/fibonacci-number/description/
// https://getsdeready.com/courses/dsa/lesson/fibonacci-number/
class Solution {
    func fib(_ n: Int) -> Int {
        if n == 0 { return 0 }
        if n == 1 { return 1 }

        var prev = 0
        var curr = 1

        for _ in 2...n {
            let next = prev + curr
            prev = curr
            curr = next
        }

        return curr
    }
}
// Or using recursion...
//TC O(2^n)
//SC O(n)
class Solution {
    func fib(_ n: Int) -> Int {
        if n == 1 || n == 0 { return n }
        return fib(n-1) + fib(n-2)
    }
}

// https://getsdeready.com/courses/dsa/lesson/check-if-it-is-a-straight-line/
// https://leetcode.com/problems/check-if-it-is-a-straight-line/description/
class Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        let x0 = coordinates[0][0]
       let y0 = coordinates[0][1]
        let x1 = coordinates[1][0]
        let y1 = coordinates[1][1]

        for i in 2..<coordinates.count {
            let x = coordinates[i][0]
            let y = coordinates[i][1]
            if (x1-x0) * (y-y0) != (x - x0) * (y1-y0) {
                return false
            }
        }
        return true
    }
}

// https://getsdeready.com/courses/dsa/lesson/count-days-spent-together/
// https://leetcode.com/problems/count-days-spent-together/description/
class Solution {
    // Array representing the number of days in each month (non-leap year)
    let daysOfMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    // Function to count the number of overlapping days between Alice and Bob's available time
    func countDaysTogether(_ arriveAlice: String, _ leaveAlice: String, _ arriveBob: String, _ leaveBob: String) -> Int {
        // Convert Alice's arrival and departure dates to total days of the year
        let arriveAliceDays = getDays(arriveAlice)
        let leaveAliceDays = getDays(leaveAlice)
        
        // Convert Bob's arrival and departure dates to total days of the year
        let arriveBobDays = getDays(arriveBob)
        let leaveBobDays = getDays(leaveBob)
        
        // If their time periods do not overlap, return 0
        if leaveAliceDays < arriveBobDays || leaveBobDays < arriveAliceDays {
            return 0
        }
        
        // Calculate the overlap period by finding the maximum start date and minimum end date
        return abs(max(arriveAliceDays, arriveBobDays) - min(leaveAliceDays, leaveBobDays)) + 1
    }
    
    // Helper function to calculate the total number of days from the start of the year for a given date (MMDD)
    private func getDays(_ date: String) -> Int {
        // Extract the month (MM) and day (DD) from the date string
        let month = Int(date.prefix(2))!
        let day = Int(date.suffix(2))!
        
        // Initialize a variable to count the total number of days
        var totalDays = 0
        
        // Add the days of each month up to the given month (excluding the current month)
        for i in 0..<month-1 {
            totalDays += daysOfMonth[i]
        }
        
        // Add the days of the current month
        totalDays += day
        
        // Return the total number of days
        return totalDays
    }
}

// https://leetcode.com/problems/minimum-sum-of-four-digit-number-after-splitting-digits/description/
// https://getsdeready.com/courses/dsa/lesson/minimum-sum-of-four-digit-number-after-splitting-digits/
class Solution {
    func minimumSum(_ num: Int) -> Int {
        // Initialize an array of 4 integers to hold the digits
        var digits = [Int](repeating: 0, count: 4)
        var n = num
        var i = 0

        // Extract digits from the number using modulus and division
        while n > 0 {
            digits[i] = n % 10  // Take the last digit
            n /= 10             // Remove the last digit
            i += 1
        }

        // Sort the digits to make the smallest possible numbers
        digits.sort()

        // Combine digits to form two numbers with smallest possible sum
        // For example: digits = [2, 2, 3, 9] → 23 + 29 = 52
        let num1 = digits[0] * 10 + digits[2]
        let num2 = digits[1] * 10 + digits[3]

        return num1 + num2
    }
}
// OR swifty way 
/*

class Solution {
    func minimumSum(_ num: Int) -> Int {
        // Convert the number to a string, map each character to Int, then sort the digits
        let digits = String(num)
            .compactMap { $0.wholeNumberValue }
            .sorted()

        // Form two numbers by combining digits:
        // - First number: smallest digit + third smallest digit
        // - Second number: second smallest + largest digit
        let num1 = digits[0] * 10 + digits[2]
        let num2 = digits[1] * 10 + digits[3]

        // Return the sum of the two new numbers
        return num1 + num2
    }
}
*/

// https://getsdeready.com/courses/dsa/lesson/day-of-the-year/
// https://leetcode.com/problems/day-of-the-year/description/
class Solution {
    func dayOfYear(_ date: String) -> Int {
        let parts = date.split(separator: "-")
        let year = Int(parts[0])!
        let month = Int(parts[1])!
        let day = Int(parts[2])!

        var daysInMonth = [31, 28, 31, 30, 31, 30,
                           31, 31, 30, 31, 30, 31]

        // Check for leap year
        if (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0) {
            daysInMonth[1] = 29
        }

        var dayOfYear = 0

        for i in 0..<month-1 {
            dayOfYear += daysInMonth[i]
        }

        dayOfYear += day

        return dayOfYear
    }
}

// https://getsdeready.com/courses/dsa/lesson/subtract-the-product-and-sum-of-digits-of-an-integer/
// https://leetcode.com/problems/subtract-the-product-and-sum-of-digits-of-an-integer/description/

class Solution {
    func subtractProductAndSum(_ n: Int) -> Int {
        var number = n
        var product = 1
        var sum = 0

        while number > 0 {
            let digit = number % 10
            product *= digit
            sum += digit
            number /= 10
        }

        return product - sum
    }
}

// https://leetcode.com/problems/check-if-array-is-sorted-and-rotated/description/
// 
class Solution {
    func check(_ nums: [Int]) -> Bool {
        let count = nums.count
        var rotationBreaks = 0

        // Check for places where the array is not in non-decreasing order.
        for index in 0..<count {
            let nextIndex = (index + 1) % count  // Wrap around to handle rotation
            //This wraps around the array using the modulus operator % to avoid going out of bounds.
            if nums[index] > nums[nextIndex] {
                rotationBreaks += 1
            }
        }
        // Valid only if there's at most one break in the sorted order
        return rotationBreaks <= 1
    }
}
/* Modulo wraps around the array using the modulus operator % to avoid going out of bounds.
| i | (i + 2) % 5 | A\[(i + 2) % 5] | B\[i] |
| - | ----------- | --------------- | ----- |
| 0 | 2           | A\[2] = 3       | 3     |
| 1 | 3           | A\[3] = 4       | 4     |
| 2 | 4           | A\[4] = 5       | 5     |
| 3 | 0           | A\[0] = 1       | 1     |
| 4 | 1           | A\[1] = 2       | 2     |
*/

//https://leetcode.com/problems/find-peak-element/
//Time: O(log n) (binary search)
//Space: O(1)
class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1

        while left < right {
            let mid = (left + right) / 2
            if nums[mid] > nums[mid + 1] {
                // Peak is in the left half (including mid)
                right = mid
            } else {
                // Peak is in the right half
                left = mid + 1
            }
        }

        // left and right have converged to a peak element index
        return left
    }
}

// https://getsdeready.com/courses/dsa/lesson/prime-arrangements/
// https://leetcode.com/problems/prime-arrangements/description/
class Solution {
    let modulos = 1_000_000_007
    func countPrimes(_ n: Int) -> Int { // https://leetcode.com/problems/count-primes/
        var primes: [Int] = [2]
        var i: Int = 3
        ext: while i <= n {
            for x in primes {
                if x * x > i {
                    break
                }
                if i % x == 0 {
                    i += 2
                    continue ext
                }
            }
            primes.append(i)
            i += 2
        }
        return n < 2 ? 0 : primes.count
    }
    func xfactorial(_ n: Int) -> Int {
        if n < 1 {
            return 1
        }
        var result: Int = 1
        for i in 1...n {
            result = (result * i) % modulos
        }
        return result
    }
    func numPrimeArrangements(_ n: Int) -> Int {
        let primesCount = countPrimes(n)
        return xfactorial(primesCount) * xfactorial(n - primesCount) % modulos
    }
}
