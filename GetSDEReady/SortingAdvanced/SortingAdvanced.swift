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
