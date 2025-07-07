// Prefix sum explained... 

let arr = [2, 4, 5, 7]
var prefix = [Int](repeating: 0, count: arr.count)
prefix[0] = arr[0]

for i in 1..<arr.count {
    prefix[i] = prefix[i - 1] + arr[i]
}

// Now, get sum from index 1 to 3:
let l = 1
let r = 3
let sum = l == 0 ? prefix[r] : prefix[r] - prefix[l - 1]
print(sum)  // Output: 16
💡 Why use Prefix Sum?
Imagine you want to find the sum from index 1 to 3 in arr:

# Without prefix sum: arr[1] + arr[2] + arr[3] = 4 + 5 + 7 = 16 (O(k) time)

# With prefix sum:
prefix[3] - prefix[0] = 18 - 2 = 16  ✅ (O(1) time)
So, sum of elements from index L to R is:

if L == 0:
    sum = prefix[R]
else:
    sum = prefix[R] - prefix[L - 1]


// https://getsdeready.com/courses/dsa/lesson/two-sum/
// https://leetcode.com/problems/two-sum/description/
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dictionary = [Int:Int]()
        for (index, number) in nums.enumerated() {
            if let foundIndexFromDict = dictionary[target - number] {
                return [foundIndexFromDict, index]
            }
            dictionary[number] = index
        }
        return []
    }
}
/*
Approach #2 : Using Two pointers: –
Step 1: First sort array then
Step 2: If arr[left] + arr[right] > sum, we will decrement the right pointer.
Step 3: If arr[left] + arr[right] < sum, we will increment the left pointer.
Step 4: if arr[left] + arr[right] == sum, we will return the result.

// TC: O(N)
// SC: O(1)
func twoSum(arr: inout [Int], target: Int) ->[Int] {
    arr.sort()
    var left = 0
    var right = arr.count - 1
    while (left < right) {
        let sum = arr[left] + arr[right]
        if (sum == target) {
            return [left, right]
        } else if sum < target {
            left+=1
        } else {
            right-=1
        }
    }
    return []
}

var twoSumArr = [2, 6, 5, 8, 11]
let target = 14
let ans = twoSum(arr: &twoSumArr, target: target)
print("two sum index found-->", ans, twoSumArr[ans[0]], twoSumArr[ans[1]])
*/
// https://getsdeready.com/courses/dsa/lesson/find-the-difference/
// https://leetcode.com/problems/find-the-difference/description/

class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var dict: [Character: Int] = [:]

        for char in s {
            dict[char, default: 0] += 1
        }
        for char in t {
            if let value = dict[char], value != 0 {
                dict[char]! -= 1
            } else {
                return char
           }

        }
        return Character(" ")
    }
}
// https://getsdeready.com/courses/dsa/lesson/fair-candy-swap-2/
// https://leetcode.com/problems/fair-candy-swap/description/
class Solution {
    // Intution # 
    /*
    Input: aliceSizes = [1,1], bobSizes = [2,2]
    Means sumA = 2 & sumB = 4
    hence 3,3 would be ideal dividing candies
    So A will give 1 candy & B will give 2 candy


    2 * (b - a) == sumB - sumA
    => b - a = (sumB - sumA)/2
    => b = a + delta

    sumA - a + b == sumB - b + a
    */

    func fairCandySwap(_ A: [Int], _ B: [Int]) -> [Int] {
        let sumA = A.reduce(0, +)
        let sumB = B.reduce(0, +)
        let delta = (sumB - sumA) / 2  // b = a + delta

        // Store B's elements in a dictionary for O(1) lookup
        var mapB = [Int: Bool]()
        for b in B {
            mapB[b] = true
        }

        for a in A {
            let b = a + delta
            if mapB[b] == true {
                return [a, b]
            }
        }

        return []
    }
}

/*
class Solution {
    
    func fairCandySwap(_ aliceSizes: [Int], _ bobSizes: [Int]) -> [Int] {
        // Step 1: Calculate the total number of candies each person has
        let sumA = aliceSizes.reduce(0, +)
        let sumB = bobSizes.reduce(0, +)
        
        // Step 2: Calculate the difference to balance both
        // We need to find x from Alice and y from Bob such that:
        // sumA - x + y == sumB - y + x
        // Simplifies to: x - y == (sumA - sumB) / 2
        // Therefore: y = x + (sumB - sumA) / 2
        let delta = (sumB - sumA) / 2  // This is the amount Bob's candy needs to be larger than Alice's

        // Step 3: Create a set for Bob’s candies for O(1) lookup
        let setB = Set(bobSizes)
        
        // Step 4: Loop through each candy size Alice has
        for x in aliceSizes {
            let y = x + delta  // The required candy size from Bob
            if setB.contains(y) {
                // Found a pair (x from Alice, y from Bob) such that swapping them balances the total
                return [x, y]
            }
        }
        
        // According to problem constraints, a solution always exists,
        // so this line would not be reached in valid test cases
        return []
    }
}
*/
/*
\U0001f3af Example
A = [1, 1]
B = [2, 2]
Total of A = 1 + 1 = 2
Total of B = 2 + 2 = 4

To make them equal, we want both to become 3 (average of 2 and 4).

So we look for a pair:

If Alice gives 1 and receives 2, then:

Alice: 2 - 1 + 2 = 3

Bob: 4 - 2 + 1 = 3
✅ Success!

So the answer is [1, 2].
*/
// https://getsdeready.com/courses/dsa/lesson/maximum-number-of-balloons/
// https://leetcode.com/problems/maximum-number-of-balloons/description/
class Solution {
    func maxNumberOfBalloons(_ text: String) -> Int {
        var bCounts = 0
        var aCounts = 0
        var lCounts = 0
        var oCounts = 0
        var nCounts = 0

        for (_, char) in text.enumerated() {
            switch (char) {
                case "b":
                    bCounts = bCounts + 1
                case "a":
                    aCounts = aCounts + 1
                case "l":
                    lCounts = lCounts + 1
                case "o":
                    oCounts = oCounts + 1
                case "n":
                    nCounts = nCounts + 1
                default:
                    continue
            }
        }

        let ans = min(bCounts,aCounts,lCounts/2,oCounts/2,nCounts)
        return ans
    }
}

// https://getsdeready.com/courses/dsa/lesson/subarray-with-0-sum/ 
class Solution
    func zeroSumSubarrayIndices(_ nums: [Int]) -> (start: Int, end: Int)? {
        var sum = 0
        var sumIndexMap: [Int: Int] = [0: -1]  // sum → index, 0 at -1 to catch subarray from 0

        for (i, num) in nums.enumerated() {
            sum += num

            if let startIndex = sumIndexMap[sum] {
                // Found a subarray with sum = 0
                return (startIndex + 1, i)
            }

            // Store sum and its index
            sumIndexMap[sum] = i
        }

        return nil  // No subarray with sum 0 found
    }
}
// https://getsdeready.com/courses/dsa/lesson/subarray-sum-equals-k/
// https://leetcode.com/problems/subarray-sum-equals-k/description/
class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var sum = 0
        var dict = [Int: Int]()  // prefixSum → frequency
        dict[0] = 1  // base case to handle sum == k directly

        for num in nums {
            sum += num
            if let freq = dict[sum - k] {
                count += freq
            }
            dict[sum, default: 0] += 1
        }

        return count
    }
}

// https://getsdeready.com/courses/dsa/lesson/largest-continuous-sequence-zero-sum/
// https://youtu.be/xmguZ6GbatA?t=415 
|-sum 3--| |--0--|
 0   1   2   3   4
|-----sum 3------|

func longestZeroSumSubarray(_ arr: [Int]) -> Int {
    // Map from prefixSum to first index where it appeared
    var firstSeen: [Int: Int] = [0: -1]
    var prefixSum = 0
    var maxLength = 0

    for (i, num) in arr.enumerated() {
        prefixSum += num

        if let firstIndex = firstSeen[prefixSum] {
            // We've seen this prefixSum before, so between firstIndex+1...i sums to zero
            let length = i - firstIndex
            maxLength = max(maxLength, length)
        } else {
            // Store the index of first occurrence of this prefixSum
            firstSeen[prefixSum] = i
        }
    }

    return maxLength
}

// https://getsdeready.com/courses/dsa/lesson/anagrams/
// https://leetcode.com/problems/group-anagrams/
func groupAnagrams(_ strs: [String]) -> [[String]] {
    var anagramMap: [String: [String]] = [:]

    // Dictionary mens key will be unique hence for input like eat & tea it will append [aet: [eat]] [aet:[eat, tea]]
    for str in strs {
        let sortedStr = String(str.sorted())
        anagramMap[sortedStr, default: []].append(str)
    }

    return Array(anagramMap.values)
}

// https://getsdeready.com/courses/dsa/lesson/set-matrix-zeros/
// https://leetcode.com/problems/set-matrix-zeroes/
class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let rows = matrix.count
        let cols = matrix[0].count
        var col0 = 1  // Flag to track if the first column needs to be zeroed

        // First pass: mark rows and columns that need to be zeroed
        for i in 0..<rows {
            if matrix[i][0] == 0 {
                col0 = 0  // First column needs to be zeroed
            }
            for j in 1..<cols {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0  // Set the first row as zero
                    matrix[0][j] = 0  // Set the first column as zero
                }
            }
        }

        // Second pass (in reverse): apply the zeroing based on markers
        for i in stride(from: rows - 1, through: 0, by: -1) {
            for j in stride(from: cols - 1, through: 1, by: -1) {
                if matrix[i][0] == 0 || matrix[0][j] == 0 {
                    matrix[i][j] = 0  // Zero the cell if its row or column is marked
                }
            }
            if col0 == 0 {
                matrix[i][0] = 0  // Zero the first column if needed
            }
        }
    }
}
