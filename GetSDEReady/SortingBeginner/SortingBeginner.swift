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
// https://getsdeready.com/courses/dsa/lesson/sort-array-by-parity-ii/
 // https://leetcode.com/problems/sort-array-by-parity-ii/   
class Solution {
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        // Create a copy of the input array to store the result
        var result = nums
        
        // 'even' pointer starts at index 0, used for placing even numbers
        var even = 0
        
        // 'odd' pointer starts at index 1, used for placing odd numbers
        var odd = 1
        
        // Iterate through each number in the original array
        for num in nums {
            if num % 2 == 0 {
                // If the number is even, place it at the current 'even' index
                result[even] = num
                even += 2 // Move to the next even index
            } else {
                // If the number is odd, place it at the current 'odd' index
                result[odd] = num
                odd += 2 // Move to the next odd index
            }
        }
        
        // Return the reordered array
        return result
    }
}

// https://getsdeready.com/courses/dsa/lesson/how-many-numbers-are-smaller-than-the-current-number/
// https://leetcode.com/problems/how-many-numbers-are-smaller-than-the-current-number/description/
class Solution {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        // Step 1: Count the frequency of each number
        var count = [Int](repeating: 0, count: 101)
        for num in nums {
            count[num] += 1
        }

        // Step 2: Build prefix sum to know how many numbers are less than a given number
        for i in 1..<101 {
            count[i] += count[i - 1]
        }

        // Step 3: Generate result using prefix sums
        var result = [Int]()
        for num in nums {
            if num == 0 {
                result.append(0)
            } else {
                result.append(count[num - 1])
            }
        }

        return result
    }
}
// https://getsdeready.com/courses/dsa/lesson/fair-candy-swap/
// https://leetcode.com/problems/fair-candy-swap/description/
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
/*
🎯 Example
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
// https://getsdeready.com/courses/dsa/lesson/k-closest-points-to-origin/
// https://leetcode.com/problems/k-closest-points-to-origin/
/*class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        return points
            .sorted { ($0[0] * $0[0] + $0[1] * $0[1]) < ($1[0] * $1[0] + $1[1] * $1[1]) }
            .prefix(k)
            .map { $0 }
    }
}*/
// Solution #2 using min Heap 
struct MaxHeap<T> {
    private var heap: [(key: Int, value: T)] = []

    mutating func push(_ key: Int, _ value: T) {
        heap.append((key, value))
        heap.sort { $0.key > $1.key }  // Max heap by distance
    }

    mutating func pop() -> T? {
        return heap.isEmpty ? nil : heap.removeFirst().value
    }

    var count: Int {
        return heap.count
    }

    var values: [T] {
        return heap.map { $0.value }
    }
}
class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var heap = MaxHeap<[Int]>()

        for point in points {
            let dist = point[0]*point[0] + point[1]*point[1]
            heap.push(dist, point)
            if heap.count > k {
                _ = heap.pop()
            }
        }
        return heap.values
    }
}


/*class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {

        // Store tuples of (distance, point)
        var distances: [(Int, [Int])] = []

        for point in points {
            let x = point[0]
            let y = point[1]
            let distance = x * x + y * y  // No need for sqrt
            distances.append((distance, point))
        }

        // Sort by distance
        let sorted = distances.sorted { $0.0 < $1.0 }

        // Extract first k points
        let result = sorted.prefix(k).map { $0.1 }
        return result
    }
}
*/    
// https://getsdeready.com/courses/dsa/lesson/maximum-difference/    
// https://www.geeksforgeeks.org/dsa/find-sum-maximum-difference-possible-subset-given-array/
// function for sum of max min difference
func maxMinSum(_ arr: [Int]) -> Int {
    var stotedArr = arr.sorted()
    var n = stotedArr.count
    // iterate over array and with help of
    // horner's rule calc max_sum and min_sum
    var min_sum: Int = 0
    var max_sum: Int = 0
    
    for i in 0..<n {
        max_sum = 2 * max_sum + arr[n-1-i];
        max_sum %= MOD;
        min_sum = 2 * min_sum + arr[i];
        min_sum %= MOD;
    }

    return (max_sum - min_sum + MOD) % MOD;
}
print("maxMin sum", maxMinSum([1,2,3]))// 6    

// https://getsdeready.com/courses/dsa/lesson/maximum-difference-between-increasing-elements/
// https://leetcode.com/problems/maximum-difference-between-increasing-elements/description/   
class Solution {
    func maximumDifference(_ nums: [Int]) -> Int {
        var minVal = nums[0]
        var maxDiff = -1

        for i in 1..<nums.count {
            if nums[i] > minVal {
                maxDiff = max(maxDiff, nums[i] - minVal)
            } else {
                minVal = nums[i]
            }
        }

        return maxDiff
    }
}
// https://getsdeready.com/courses/dsa/lesson/number-of-sextuplets/
class Solution {
    func countSextuplets(_ A: [Int], _ B: [Int], _ C: [Int],
                         _ D: [Int], _ E: [Int], _ F: [Int]) -> Int {
        let n = A.count
        var leftCount = [Int: Int]()
        
        // 1️⃣ Compute all possible values of A[a]*B[b] + C[c], count occurrences
        for a in A {
            for b in B {
                for c in C {
                    let val = a * b + c
                    leftCount[val, default: 0] += 1
                }
            }
        }
        
        var total = 0
        
        // 2️⃣ For D[d] * (E[e] + F[f]), look up matching left side values
        for d in D {
            for e in E {
                for f in F {
                    let val = d * (e + f)
                    if let cnt = leftCount[val] {
                        total += cnt
                    }
                }
            }
        }
        
        return total
    }
}

    
