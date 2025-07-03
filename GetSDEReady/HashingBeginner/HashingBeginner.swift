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
        var characters = Array(text)
        var bCounts = 0
        var aCounts = 0
        var lCounts = 0
        var oCounts = 0
        var nCounts = 0

        for char in characters {
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

        var ans = min(bCounts,aCounts,lCounts/2,oCounts/2,nCounts)
        return ans
    }
}
