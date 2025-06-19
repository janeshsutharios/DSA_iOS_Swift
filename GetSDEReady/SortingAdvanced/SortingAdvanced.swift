// https://getsdeready.com/courses/dsa/lesson/find-the-distance-value-between-two-arrays/
// https://leetcode.com/problems/find-the-distance-value-between-two-arrays/description/
// Soution #1 best using binary search 
class Solution {
    func findTheDistanceValue(_ arr1: [Int], _ arr2: [Int], _ d: Int) -> Int {
        let sortedArr2 = arr2.sorted()
        var count = 0
        
        for num in arr1 {
            if !hasElementWithinDistance(num, in: sortedArr2, d: d) {
                count += 1
            }
        }
        return count
    }
    
    func hasElementWithinDistance(_ target: Int, in arr: [Int], d: Int) -> Bool {
        var left = 0, right = arr.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            let diff = abs(arr[mid] - target)
            
            if diff <= d {
                return true // Found element within distance
            } else if arr[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return false
    }
}
// Soulution #2 iterative approach
/*class Solution {
    func findTheDistanceValue(_ arr1: [Int], _ arr2: [Int], _ d: Int) -> Int {
        var count = 0
        for a1 in arr1 {
            var isValid = true
            for a2 in arr2 {
                if abs(a1 - a2) <= d {
                    isValid = false
                    break
                }
            }
            if isValid {
                count += 1
            }
        }
        return count
    }
}*/
// https://getsdeready.com/courses/dsa/lesson/merge-similar-items/
// https://leetcode.com/problems/merge-similar-items/
class Solution {
    func mergeSimilarItems(_ items1: [[Int]], _ items2: [[Int]]) -> [[Int]] {
        var map = [Int: Int]()
        
        // Add all items from items1
        for item in items1 {
            map[item[0], default: 0] += item[1]
        }

        // Add all items from items2
        for item in items2 {
            map[item[0], default: 0] += item[1]
        }

        // Convert to array of [value, weight] and sort by value as per question ret should be returned in ascending order by value.
        let result = map.map { [$0.key, $0.value] }.sorted { $0[0] < $1[0] }
        
        return result
    }
}
// https://getsdeready.com/courses/dsa/lesson/split-with-minimum-sum/
// https://leetcode.com/problems/split-with-minimum-sum/description/
class Solution {
    func splitNum(_ num: Int) -> Int {
        var digits = [Int]()
        var number = num

        // Step 1: Extract each digit from the number (in reverse order)
        while number > 0 {
            digits.append(number % 10) // Get last digit
            number /= 10               // Remove last digit
        }

        // Step 2: Sort the digits in ascending order
        digits.sort()

        // Step 3: Distribute digits alternately to two numbers
        var num1 = 0
        var num2 = 0

        for (i, digit) in digits.enumerated() {
            if i % 2 == 0 {
                // Even index → add to num1
                num1 = num1 * 10 + digit
            } else {
                // Odd index → add to num2
                num2 = num2 * 10 + digit
            }
        }

        // Step 4: Return the sum of the two constructed numbers
        return num1 + num2
    }
}
// https://getsdeready.com/courses/dsa/lesson/sort-even-and-odd-indices-independently/
// https://leetcode.com/problems/sort-even-and-odd-indices-independently/description/

class Solution {
    func sortEvenOdd(_ nums: [Int]) -> [Int] {
        var evens = [Int]()
        var odds = [Int]()
        
        // Separate values at even and odd indices
        for (i, v) in nums.enumerated() {
            if i % 2 == 0 {
                evens.append(v)
            } else {
                odds.append(v)
            }
        }
        
        // Sort even-index values in ascending order
        evens.sort()
        // Sort odd-index values in descending order
        odds.sort(by: >)
        
        var result = [Int]()
        // Rebuild the array by picking from respective sorted lists
        var e = 0, o = 0
        for i in 0..<nums.count {
            if i % 2 == 0 {
                result.append(evens[e])
                e += 1
            } else {
                result.append(odds[o])
                o += 1
            }
        }
        
        return result
    }
}
