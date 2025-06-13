// https://getsdeready.com/courses/dsa/lesson/third-largest-number/
// https://leetcode.com/problems/third-maximum-number/description/
// Solution #2 Brute force
class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        let hash = Set(nums)
        let sortedArray = Array(hash).sorted()
        if sortedArray.count < 3 {
            return sortedArray.last ?? 0
        }
        return sortedArray[sortedArray.count - 3]
    }
}

// Solution #2 using minHeap
class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        var minHeap = [Int]()  // This will simulate the min heap
        var taken = Set<Int>()

        for num in nums {
            // Skip if already taken
            if taken.contains(num) {
                continue
            }

            if minHeap.count == 3 {
                // Only insert if current number is larger than heap's min
                if let min = minHeap.min(), num > min {
                    // Remove min from heap and set
                    if let minIndex = minHeap.firstIndex(of: min) {
                        minHeap.remove(at: minIndex)
                        taken.remove(min)
                    }
                    // Add new number
                    minHeap.append(num)
                    taken.insert(num)
                }
            } else {
                minHeap.append(num)
                taken.insert(num)
            }
        }

        // Return max if less than 3 distinct elements
        if minHeap.count < 3 {
            return minHeap.max()!
        }

        return minHeap.min()!
    }
  
// Solution #3 Using Pointers 
class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
     // Three variables to store maximum three numbers till now
        var firstMax: Int64 = Int64.min
        var secondMax: Int64 = Int64.min
        var thirdMax: Int64 = Int64.min
        
        for num in nums {
            if firstMax == num || secondMax == num || thirdMax == num {
                continue
            }
            // If current number is greater than first maximum,
            // It means that this is the greatest number and first maximum and second max
            // will become the next two greater numbers.
            if firstMax <= num {
                thirdMax = secondMax
                secondMax = firstMax
                firstMax = Int64(num)
            } else if secondMax <= num {
            // When current number is greater than second maximum,
            // it means that this is the second greatest number.
                thirdMax = secondMax
                secondMax = Int64(num)
            } else if thirdMax <= num {
              // It is the third greatest number
              thirdMax = Int64(num)
            }

        }
        // If third max was never updated, it means we don't have 3 distinct numbers.
        if thirdMax == Int64.min {
           return Int(firstMax)
        }
         return Int(thirdMax)
    }
}

