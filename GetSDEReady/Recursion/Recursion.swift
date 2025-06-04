// Question# calculate power of n n ^ x
// https://getsdeready.com/courses/dsa/lesson/power-of-four-2/
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
    //return n > 0 && (n & (n - 1)) == 0 && n % 3 == 1 // becasue 16%3 = 1
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

//https://leetcode.com/problems/fibonacci-number/ 
// https://getsdeready.com/courses/dsa/lesson/fibonacci-number-2/
// Method: #1 Loop
class Solution {
    // Best // TC: O(n)+O(1)
// SC: O(1)
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
// Method: #2 Basic Recursion
    // TC: 2^n
    // SC: 2^n
func fib(_ n: Int) ->Int {
   if n <= 1 {
       return n
   }
   return fib(n-1) + fib(n-2)
}

print(fib(5))

// Method: #3 Dynamic Programming |
// TC: O(n)+O(1)
// SC: O(1)
func fib(_ n: Int) ->Int {
   if n <= 1 {
       return n
   }
   if dp[n] != -1 {return dp[n]}
    dp[n] = fib(n-1) + fib(n-2)
   return dp[n]
}
var n = 5
var dp: [Int] = Array.init(repeating: -1, count: n+1)
print(fib(n))

// Debug
![Fibonacci Recursion](https://github.com/janeshsutharios/DSA_iOS_Swift/raw/main/GetSDEReady/Images/Fib_recursion.drawio.png)
func fibonacci(of number: Int) -> Int {
    if number <= 1 {
        return number
    }

    print("👉 Starting fibonacci(\(number))")

    let fibonacciOfPrevious = fibonacci(of: number - 1)
    print("🔄 Computed fibonacci(\(number - 1)) = \(fibonacciOfPrevious)")

    let fibonacciOfTwoBefore = fibonacci(of: number - 2)
    print("🔄 Computed fibonacci(\(number - 2)) = \(fibonacciOfTwoBefore)")

    let result = fibonacciOfPrevious + fibonacciOfTwoBefore
    print("✅ fibonacci(\(number)) = \(result)")

    return result
}

print("🎯 Final Result: fibonacci(4) = \(fibonacci(of: 4))")
/*
Stack (Top is current call)
──────────────────────────────
| fibonacci(of: 4)             |  <-- waiting for fib(3) and fib(2)
| - number = 4                 |
| - fibonacciOfPrevious = ?    |
| - fibonacciOfTwoBefore = ?   |
──────────────────────────────
| fibonacci(of: 3)             |  <-- waiting for fib(2) and fib(1)
| - number = 3                 |
| - fibonacciOfPrevious = ?    |
| - fibonacciOfTwoBefore = ?   |
──────────────────────────────
| fibonacci(of: 2)             |  <-- waiting for fib(1) and fib(0)
| - number = 2                 |
| - fibonacciOfPrevious = ?    |
| - fibonacciOfTwoBefore = ?   |
──────────────────────────────
| fibonacci(of: 1)             |  <-- Base case → returns 1
| - number = 1                 |
──────────────────────────────
| fibonacci(of: 0)             |  <-- Base case → returns 0
| - number = 0                 |
──────────────────────────────
*/


// https://leetcode.com/problems/merge-two-sorted-lists/description/
// https://getsdeready.com/courses/dsa/lesson/merge-two-sorted-lists/
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // Base cases
        guard let list1 = list1 else { return list2 }
        guard let list2 = list2 else { return list1 }

        if list1.val < list2.val {
            list1.next = mergeTwoLists(list1.next, list2)
            return list1
        } else {
            list2.next = mergeTwoLists(list1, list2.next)
            return list2
        }
    }
}

/*
func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    var list1 = list1
    var list2 = list2
    let preHead = ListNode()
    var tail = preHead
    while list1 != nil && list2 != nil {
        if list1!.val < list2!.val {
            tail.next = list1
            list1 = list1?.next
        } else {
            tail.next = list2
            list2 = list2?.next
        }
        tail = tail.next!
    }
    tail.next = list1 == nil ? list2 : list1
    return preHead.next
}*/
// https://leetcode.com/problems/power-of-two/
// https://getsdeready.com/courses/dsa/lesson/power-of-two/

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        return (n > 0) && (n & (n-1) == 0)
    }
}
// Dry run for n = 4
/*
4 = 100
3 = 011
---------
R = 000 == 0 true
Input n = 5
5 = 101
4 = 100
--------
R = 100 !=0 false
*/
// Class question Generate subset

/// Recursively generates and prints all subsets (subsequences) of a given string.
/// - Parameters:
///   - input: The remaining string to process.
///   - currentSubset: The current subset built so far (default is empty).
func generateAllSubsets(of input: String, currentSubset: String = "") {
    // Base case: if input is empty, print the accumulated subset
    if input.isEmpty {
        print("Subset →", currentSubset)
        return
    }

    // Get the first character and the rest of the string
    let firstChar = input.first!
    let remaining = String(input.dropFirst())

    // Recursive case 1: include the first character in the subset
    generateAllSubsets(of: remaining, currentSubset: currentSubset + String(firstChar))

    // Recursive case 2: exclude the first character from the subset
    generateAllSubsets(of: remaining, currentSubset: currentSubset)
}
/*

                                       (input: "abc", currentSubset: "")
                             _____________/                                  \______________
                            /                                                             \
           (input: "bc", currentSubset: "a")                           (input: "bc", currentSubset: "")
                 ___________/           \___________                       ____________/           \___________
                /                                   \                     /                                     \
(input: "c", currentSubset: "ab")   (input: "c", currentSubset: "a")   (input: "c", currentSubset: "b")   (input: "c", currentSubset: "")
         _____/         \_____             _____/         \_____           _____/         \_____             _____/         \_____
        /                     \           /                     \         /                     \           /                     \
(input: "", "abc")   (input: "", "ab")  (input: "", "ac")   (input: "", "a")  (input: "", "bc")   (input: "", "b")  (input: "", "c")   (input: "", "")
     ✅ print "abc"  ✅ print "ab"    ✅ print "ac"  ✅ print "a"    ✅ print "bc"  ✅ print "b"    ✅ print "c"  ✅ print ""

                       
 */
// Example usage
generateAllSubsets(of: "abc")

/* Outut is total 8
Subset → abc
Subset → ab
Subset → ac
Subset → a
Subset → bc
Subset → b
Subset → c
Subset → 
*/
// All unique permutations
// https://getsdeready.com/courses/dsa/lesson/all-unique-permutations/

func permuteUnique(_ nums: [Int]) -> [[Int]] {
    var allUniquePermutations: [[Int]] = []         // Stores all unique permutations
    var sortedNums = nums.sorted()                  // Sort input to group duplicates together
    var isUsed = Array(repeating: false, count: nums.count) // Track which elements are used in the current path
    var currentPermutation: [Int] = []              // Current permutation being built
    
    // Helper function using backtracking
    func backtrack(_ currentPermutation: inout [Int]) {
        // If the current permutation is complete, add it to results
        if currentPermutation.count == sortedNums.count {
            allUniquePermutations.append(currentPermutation)
            return
        }
        
        for index in 0..<sortedNums.count {
            // Skip if number at index is already used in the current permutation
            if isUsed[index] {
                continue
            }
            
            // Skip duplicates: if current number is the same as previous and previous hasn't been used in this path
            if index > 0 && sortedNums[index] == sortedNums[index - 1] && !isUsed[index - 1] {
                continue
            }
            
            // Include this number in current path
            isUsed[index] = true
            currentPermutation.append(sortedNums[index])
            
            // Continue building the permutation
            backtrack(&currentPermutation)
            
            // Backtrack: remove last number and mark as unused
            currentPermutation.removeLast()
            isUsed[index] = false
        }
    }
    
    // Start the backtracking process
    backtrack(&currentPermutation)
    
    return allUniquePermutations
}
// Solution #2 using Dictionary
class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []

        // Dictionary to store the frequency of each number
        var frequencyMap: [Int: Int] = [:]
        for number in nums {
            frequencyMap[number, default: 0] += 1
        }

        // Recursive backtracking function
        func backtrack(currentPermutation: inout [Int], totalLength: Int) {
            // Base case: if the current permutation is complete, add to result
            if currentPermutation.count == totalLength {
                result.append(currentPermutation)
                return
            }

            // Iterate over all available numbers in the frequency map
            for (number, count) in frequencyMap {
                if count == 0 {
                    continue  // Skip if this number is already fully used
                }

                // Choose the current number
                currentPermutation.append(number)
                frequencyMap[number]! -= 1

                // Recurse with the current choice
                backtrack(currentPermutation: &currentPermutation, totalLength: totalLength)

                // Backtrack: undo the choice
                currentPermutation.removeLast()
                frequencyMap[number]! += 1
            }
        }

        // Start the recursive backtracking with an empty list
        var current: [Int] = []
        backtrack(currentPermutation: &current, totalLength: nums.count)

        return result
    }
}
// https://getsdeready.com/courses/dsa/lesson/combination-sum/
// https://leetcode.com/problems/combination-sum/description/   
// Hand draw eecursion https://github.com/janeshsutharios/DSA_iOS_Swift/blob/main/GetSDEReady/Images/combination-sum.pdf
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var res = [[Int]]()
    var current: [Int] = []
    dfs(0, &current, 0)

    func dfs(_ i: Int, _ cur: inout [Int], _ total: Int) {
        if total == target {
            res.append(cur)
           // print(" res is -------- ", res)
            print("RCurrent--------- ", i, cur)
            return
        }

        if i >= candidates.count || total > target {
            print("Out------ ", i, cur)
            return
        } else {
            print("In------ ", i, cur)
        }

        // Include candidates[i]
        cur.append(candidates[i])
        dfs(i, &cur, total + candidates[i])
        cur.removeLast()

        // Skip candidates[i]
        dfs(i + 1, &cur, total)
    }
    return res
}
print("combination sum, ", combinationSum([1,2], 3))                  
                       
