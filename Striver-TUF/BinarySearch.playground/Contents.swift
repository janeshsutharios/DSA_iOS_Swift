import Foundation

// Question 1 : Binary search find array elements
// TC: O(logN), where N = size of the given array.
// SC O(1)If a number n can be divided by 2 for x times:
//2^x = n // Because we are dividing array by 2 every time.
//Therefore, x = logn (base is 2)
// Approach #1 Iterative approach.
//These parts may cause to overflow error: int mid = (left + right)/2
//Better calculate mid via left + (right - left) / 2
func findElementUsingBinarySearch(nums: [Int], target: Int) -> Int {
    var low = 0
    var high = nums.count - 1
    // Divide the array until we got mid element as target element.
    while low <= high {
        let mid = (low + high) / 2
        if nums[mid] == target {
            return mid
        } else if target > nums[mid] {// If target is greater increase low pointer
            low = mid + 1
        } else {// If target is lesser decrease high pointer
            high = mid - 1
        }
    }
    return -1
}
// Approach #2 Recursion approach.
func findElementUsingBinarySearchUsingRecursion(nums: [Int], target: Int, low: inout Int, high: inout Int) -> Int {
    if low > high { return -1 }// Base case.
    var mid = (low + high) / 2
    if nums[mid] == target {
        return mid
    } else if target > nums[mid] {// If target is greater increase low pointer
        low = mid + 1
    } else {// If target is lesser decrease high pointer
        high = mid - 1
    }
    // Divide the array until we got mid element as target element.
    return findElementUsingBinarySearchUsingRecursion(nums: nums, target: target, low: &low, high: &high)
}


let binaryArrayInput = [3, 4, 6, 7, 9, 12, 16, 17]
let targetToFind = 6
let binaryIndexOutput = findElementUsingBinarySearch(nums: binaryArrayInput, target: targetToFind)
//print("binaryIndexOutput ", binaryIndexOutput)// Output 2

// Using Recursion. ---
var high = binaryArrayInput.count - 1
var low = 0
let binaryIndexOutputRecursion = findElementUsingBinarySearchUsingRecursion(nums: binaryArrayInput, target: targetToFind, low: &low, high: &high)
//print("findElementUsingBinarySearchUsingRecursion ", binaryIndexOutputRecursion) // Output 2

// Question 2 : Lower bound.
// Problem Statement: Given a sorted array of N integers and an integer x, write a program to find the lower bound of x.
// TC: O(log(N))
// SC: O(1)
func findLowerBound(_ arr: [Int], _ target: Int) -> Int {
    let arrayCount = arr.count
    var low = 0
    var high = arrayCount - 1
    var ans = arrayCount

    while low <= high {
        let mid = (low + high) / 2
        // maybe an answer
        if arr[mid] >= target {
            ans = mid
            // look for smaller index on the left
            high = mid - 1
        } else {
            low = mid + 1 // look on the right
        }
    }
    return ans
}

var arrInputLowerBound = [3, 5, 8, 15, 19]
let targetLowerBound = 9
let indexLowerBoundOutput = findLowerBound(arrInputLowerBound, targetLowerBound)
//print("The lower bound is the index:", indexLowerBoundOutput)// 3 hence [3,5,8,15] & (arr[i] >= x))


// Question:3  Upper Bound || Given a sorted array of N integers and an integer x, write a program to find the upper bound of x.
// TC: O(log(N))
// SC: O(1)
func findUpperBound(_ arr: [Int], _ target: Int) -> Int {
    let arrayCount = arr.count
    var low = 0
    var high = arrayCount - 1
    var ans = arrayCount

    while low <= high {
        let mid = (low + high) / 2
        // maybe an answer
        if arr[mid] > target {
            ans = mid
            // look for smaller index on the left
            high = mid - 1
        } else {
            low = mid + 1 // look on the right
        }
    }
    return ans
}
var arrInputUpperBound = [3, 5, 8, 9, 15, 19]
let targetUpperBound = 9
let indexUpperBoundOutput = findUpperBound(arrInputUpperBound, targetUpperBound)
//print("The Upper bound is the index:", indexUpperBoundOutput)// 4 hence [15,19]


// Question: 4 Find the insert position of given number
// TC: O(log(N))
// SC: O(1)
func findInsertPosition(_ arr: [Int], _ target: Int) -> Int {
    let arrayCount = arr.count
    var low = 0
    var high = arrayCount - 1
    var ans = arrayCount//So if element is greater it would be the last
    
    while low <= high {
        let mid = (low + high) / 2
        // maybe an answer
        if arr[mid] >= target {
            ans = mid
            // look for smaller index on the left
            high = mid - 1
        } else {
            low = mid + 1 // look on the right
        }
    }
    return ans
}


var arrInputInsertPosition = [1,3,5,6]
let elementToInsert = 2
let positionOfLower = findInsertPosition(arrInputInsertPosition, elementToInsert)
//print("The positionOfLower index will be ", positionOfLower) // index 1 Because [1,2,3,5,6]

// Question 5:  Find Ceil & Floor in sorted Array.
// TC: O(log(N))
// SC: O(1)
func findCeil(_ arr: [Int], _ target: Int) -> Int {
    let arrayCount = arr.count
    var low = 0
    var high = arrayCount - 1
    var ans = arrayCount//So if element is greater it would be the last
    
    while low <= high {
        let mid = (low + high) / 2
        // maybe an answer
        if arr[mid] >= target {
            ans = arr[mid]
            // look for smaller index on the left
            high = mid - 1
        } else {
            low = mid + 1 // look on the right
        }
    }
    return ans
}
// TC: O(log(N))
// SC: O(1)
func findFloor(_ arr: [Int], _ target: Int) -> Int {
    let arrayCount = arr.count
    var low = 0
    var high = arrayCount - 1
    var ans = arrayCount//So if element is greater it would be the last
    
    while low <= high {
        let mid = (low + high) / 2
        // maybe an answer
        if arr[mid] <= target {
            ans = arr[mid]
            // look for smaller index on the left
            low = mid + 1 // look on the right
        } else {
            high = mid - 1 // look on the right
        }
    }
    return ans
}

var inputBinaryArray = [3, 4, 4, 7, 8, 10]
let targetEl = 5
let floorFound = findFloor(inputBinaryArray, targetEl)
let ceilFound = findCeil(inputBinaryArray, targetEl)

//print("floorFound ", floorFound) // 4
//print("ceilFound ", ceilFound) // 7

// Question 6: Find first & last occurance of the number in an array
// TC: O(2log(N))
// SC: O(1)

func findFirstAndLastOccurance(_ arr: [Int], _ target: Int) -> [Int] {
    
    func findFirstOccurance() ->Int {
        let arrayCount = arr.count
        var low = 0
        var high = arrayCount - 1
        var idx = -1
        
        while low <= high {
            let mid = (low + high) / 2
            if arr[mid] >= target {
                high = mid - 1
            } else{
                low = mid + 1
            }
            if arr[mid] == target {
                idx = mid
            }
        }
        return idx
    }
    
    func findLastOccurance() ->Int {
        let arrayCount = arr.count
        var low = 0
        var high = arrayCount - 1
        var idx = -1
        
        while low <= high {
            let mid = (low + high) / 2
            if arr[mid] <= target {
                low = mid + 1
            } else{
                high = mid - 1
            }
            if arr[mid] == target {
                idx = mid
            }
        }
        return idx
    }

    return [findFirstOccurance(), findLastOccurance()]
}

var inputBinArray = [5,7,7,8,8,10]
let targetElem = 8
let opFirstAndLast = findFirstAndLastOccurance(inputBinArray, targetElem)
//print("opFirstAndLast --- ", opFirstAndLast)// 3,4

// Question 7 : Count occurrence in Sorted array.
let ipCountArray = [2, 4, 6, 8, 8, 8, 11, 13]
let opCountOccurance = findFirstAndLastOccurance(ipCountArray, 8)
//print("opCountOccurance---",(opCountOccurance.last! - opCountOccurance.first!) + 1 ) // 3

// Question 8: Search element in rotated sorted array
// TC: O(log(N))
// SC: O(1)
func searchInRotated(nums: [Int], target: Int) ->Int {
    var low = 0
    var high = nums.count - 1
    while low <= high {
        let mid = (low + high) / 2
        
        // if mid points to the target
        if nums[mid] == target {
            return mid
        }
        
        // if left part is sorted
        if nums[low] <= nums[mid] {
            if nums[low] <= target && target <= nums[mid] {
                // element exists
                high = mid - 1
            } else {
                // element does not exist
                low = mid + 1
            }
        } else { // if right part is sorted
            if nums[mid] <= target && target <= nums[high] {
                // element exists
                low = mid + 1
            } else {
                // element does not exist
                high = mid - 1
            }
        }
    }
    return -1
}

let rotatedSortedArr = [7, 8, 9, 1, 2, 3, 4, 5, 6]
let targetElInRotated = 1
let opFoundIndex = searchInRotated(nums: rotatedSortedArr, target: targetElInRotated)
//print(" Index found is-->", opFoundIndex) // 3

// Question 8: search element in an array
func searchInRotatedMaydup(nums: [Int], target: Int) ->Bool {
    var low = 0
    var high = nums.count - 1
    while low <= high {
        let mid = (low + high) / 2
        
        // if mid points to the target
        if nums[mid] == target {
            return true
        }
        if nums[low] == nums[mid] && nums[mid] == nums[high] {
            low = low + 1
            high = high - 1
            continue
        }
        
        // if left part is sorted
        if nums[low] <= nums[mid] {
            if nums[low] <= target && target <= nums[mid] {
                // element exists
                high = mid - 1
            } else {
                // element does not exist
                low = mid + 1
            }
        } else { // if right part is sorted
            if nums[mid] <= target && target <= nums[high] {
                // element exists
                low = mid + 1
            } else {
                // element does not exist
                high = mid - 1
            }
        }
    }
    return false
}

let rotatedDupSortedArr = [7, 8, 9, 1, 1, 1, 2, 3, 4, 5, 6]
let targetElInDupRotated = 1
let opFoundForIndex = searchInRotatedMaydup(nums: rotatedDupSortedArr, target: targetElInDupRotated)
//print("searchInRotatedMaydup-->", opFoundForIndex) // true

// Question: 9 find minimum in rotated array
// TC: O(log(N))
// SC: O(1)
func findMin(_ nums: [Int]) ->Int {
    
    var low = 0
    var high = nums.count - 1
    var ans = Int.max
    while low <= high {
        let mid = (low + high) / 2
        //search space is already sorted
        //then arr[low] will always be
        //the minimum in that search space:
        if nums[low] <= nums[high] {
            ans = min(ans, nums[low])
            break
        }
        
        // If left part is sorted:
        if nums[low] <= nums[mid] {
            // Keep the minimum:
            ans = min(ans, nums[low])

            // Eliminate left half:
            low = mid + 1
        } else { // If right part is sorted:
            // Keep the minimum:
            ans = min(ans, nums[mid])

            // Eliminate right half:
            high = mid - 1
        }
    }
    return ans
}

let rotArrayInput = [4, 5, 6, 7, 0, 1, 2, 3]
let rotArrayOutput = findMin(rotArrayInput)
//print("The minimum element is: ", rotArrayOutput)// 0

//Question 10: find find-out-how-many-times-the-array-has-been-rotated || index of lower element..
// TC: O(log(N))
// SC: O(1)
func findLowestNumberIndex(_ nums: [Int]) ->Int {
    
    var low = 0
    var high = nums.count - 1
    var ans = Int.max
    var index = -1
    while low <= high {
        let mid = (low + high) / 2
        //search space is already sorted
        //then arr[low] will always be
        //the minimum in that search space:
        if nums[low] <= nums[high] {
            if nums[low] < ans {
                index = low
                ans = nums[low]
            }
            break
        }
        
        // If left part is sorted:
        if nums[low] <= nums[mid] {
            // Keep the minimum:
            if nums[low] < ans {
                index = low
                ans = nums[low]
            }

            // Eliminate left half:
            low = mid + 1
        } else { // If right part is sorted:
            // Keep the minimum:
            if nums[mid] < ans {
                index = mid
                ans = nums[mid]
            }

            // Eliminate right half:
            high = mid - 1
        }
    }
    return index
}

let rotaArrayInput = [4, 5, 6, 7, 0, 1, 2, 3]
let rotaArrayOutput = findLowestNumberIndex(rotaArrayInput)
//print("The minimum element index is: ", rotaArrayOutput)// 4



// Question 10: find peak element
// TC: O(log(N))
// SC: O(1)
func findPeakElement(_ nums: [Int]) -> Int {
    if nums.isEmpty  { return 0 }
    
    var left = 0
    var right = nums.count - 1
    
    while left < right {// from 0 to end of the array
        let mid = (left + right) / 2
        if nums[mid] < nums[mid + 1] { // 3 < 5
            left = mid + 1
        } else {
            right = mid
        }
    }
    
    return left
}
    
    
let peakArrInput = [1,6,5,1]
let peakArrOutput = findPeakElement(peakArrInput)
//print("peakArrOutput index is --- ", peakArrOutput) //index 1

//Question 11:  Search Single Element in a sorted array
// Approach #1 using reduce
func singleNonDuplicate(_ nums: [Int]) -> Int {
    nums.reduce(0, ^)
}
// Approach #2
// TC: O(logN)
// SC: O(1)
func singleNonDup(_ nums: [Int]) ->Int {
    if nums.isEmpty { return -1 }
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        var mid = (left + right)/2
        if (mid % 2 == 0 && nums[mid] == nums[mid + 1]) || (mid % 2 == 1 && nums[mid] == nums[mid - 1]) {
            // If mid is even & so dup will be next number
            // If mid is Odd & so dup will be prev number
            left = mid + 1
        } else {
            right = mid
        }
    }
    return nums[left]
}
let dupArray = [3,3,7,7,10,11,11]
let singleEl = singleNonDuplicate(dupArray)
//print("singleEl is --- ", singleEl) //singleEl 10

let uniqueEl = singleNonDup(dupArray)
//print("singleEl is --- ", uniqueEl) //singleEl 10

// ---- BS in answers ----- //
// Question: Find SQRT of the number
// TC: O(lon(N))
// SC: O(1)
func findSQRT(_ n: Int) ->Int {
    var low = 1
    var high = n
    // Binary search on the answers:
    while low <= high {
        let mid = ((low + high) / 2)
        let val = mid * mid
        if (val <= n) {
            // Eliminate the left half:
            low = mid + 1
        } else {
            // Eliminate the right half:
            high = mid - 1
        }
    }
    return high
}
    
let inputSQRT = 16
let opSQRT = findSQRT(inputSQRT)
//print("opSQRT is --- ", opSQRT) //opSQRT 4


// Question : Find Nth root using Binary search.
// TC: O(lon(N))
// SC: O(1)
func getMidMultiply(_ mid: Int, _ n: Int, _ m: Int) ->Int {
    var ans = 1
    for _ in 1...n {
        ans = ans * mid
        if (ans > m) {
            return 2
        }
    }
    if (ans == m) { return 1}// if we got th exact match return as 1 hence we got as a mid element
    return 0
}

func NthRoot(_ n: Int, _ m: Int) ->Int {
    var low = 1
    var high = m
    while low <= high {
        let mid = (low + high) / 2
        let midN = getMidMultiply(mid, n, m)// Find perfect square
        if midN == 1 {// Got perfect square
            return mid
        } else if midN == 0 {// discard first half
            low = mid + 1
        } else {// discard second half
            high = mid - 1
        }
    }
    return -1
}

let firstIp = 3
let secondIp = 27
let opRoot = NthRoot(firstIp, secondIp)
//print("The answer is: ", opRoot)// 4 because 3*3*3 = 27



// Question: Koko loves bananas
// TC: O(n log k)
//  O(n)(checkHours) * O(log k)(binary search where k = piles(max))
// SC: O(1) only a few integers are stored.

func checkHours(_ piles: [Int], _ k: Int, _ limit: Int) -> Bool {
     var hours = 0
     for pile in piles {
         hours += Int(ceil(Double(pile) / Double(k)))
         if hours > limit {// If hour limit exceeds means discard right half of array
             return false
         }
     }
     return hours <= limit
 }
 
 func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
     // Define the binary search space,
     // 1...max(piles) in this case.
     var left = 1, right = Int.min
     for pile in piles {
         right = max(right, pile)
     }
     
     while left <= right {
         let mid = (left + right) / 2
         if checkHours(piles, mid, h) {
             // Koko eats too many bananas.
             // Encourage Koko to eat less bananas per hour.
             right = mid - 1
             // Discard right half of array
         } else {
             // Koko doesn't eat enough banans.
             // Ask Koko to eat one more banana per hour.
             left = mid + 1
             // Discard left half of array
         }
     }
     
     return left
 }
// Approach #2 Using Reduce
func minEatingSpeed1(_ piles: [Int], _ h: Int) -> Int {
    var (l, r) = (1, piles.max()!)
    while l < r{
        var k = (l + r) / 2
        let hrs = piles.reduce(0){return $0 + ($1 + k - 1)/k}
        (l, r) = hrs <= h ? (k-1, k) : (k+1, r)
    }
    return l
}

let v = [30,11,23,4,20]
let h = 6
let eatSpeed1 = minEatingSpeed(v, h)
//print("Koko should eat at least ", eatSpeed1, " bananas/hr.")// 4

let eatSpeed2 = minEatingSpeed1(v, h)
//print("Koko should eat at least ", eatSpeed2, " bananas/hr.")// 4



// Question: -- Minimum days to make m Bouquets
//TC: O(log(max(arr[])-min(arr[])+1) * N), where {max(arr[]) -> maximum element of the array, min(arr[]) -> minimum element of the array, N = size of the array}.
//Reason: We are applying binary search on our answers that are in the range of [min(arr[]), max(arr[])]. For every possible answer ‘mid’, we will call the possible() function. Inside the possible() function, we are traversing the entire array, which results in O(N).
// SC: O(1)

func minDays(_ bloomDay: [Int], _ m: Int, _ k: Int) -> Int {
    
    func possible(_ bloomDay: [Int], _ day: Int,_ m: Int,_ k: Int) -> Bool {
        var cnt = 0
        var noOfB = 0
        // Count the number of bouquets
        for i in 0..<bloomDay.count {
            if bloomDay[i] <= day {
                cnt+=1
            } else {
                noOfB += Int(floor(Double(cnt / k)))
                cnt = 0
            }
        }
        noOfB += Int(floor(Double(cnt / k)))
        return noOfB >= m
    }
    
    let val = m * k
    if (val > bloomDay.count) {
        return -1
    } // Impossible case
    // Find maximum and minimum
    var mini = 0, maxi = 0
    for i in 0..<bloomDay.count {
        mini = min(mini, bloomDay[i])
        maxi = max(maxi, bloomDay[i])
    }
    
    // Apply binary search
    var low = mini, high = maxi
    while low <= high {
        let mid = Int(floor(Double(low + high) / 2))
        if (possible(bloomDay, mid, m, k)) {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return low
}

let bonqutesArr = [7, 7, 7, 7, 13, 11, 12, 7]
let adjacentRosesRequired = 3
let totalBouquets = 2// [🌹 🌹 🌹], [🌹 🌹 🌹]
let minDaysOP = minDays(bonqutesArr, totalBouquets, adjacentRosesRequired)
//print("We can make bouquets on day ", minDaysOP)// day 12 so it will be [7, 7, 7, 7] & [11,12,7]

// Question: Find the Smallest Divisor Given a Threshold
// TC: O(N⋅log⁡M)
// SC: O(1)

// Return the sum of division results with 'divisor'.
func findDivisionSum(_ nums: [Int], _ divisor: Int) -> Int {
    var result: Int = 0
    for num in nums {
        result += Int(ceil(Double(num) / Double(divisor))) // Get Higher/ Ceil Value
    }
    return result
}

func smallestDivisor(_ nums: [Int], _ threshold: Int) -> Int {
    var low: Int = 1
    var high: Int = 0
    for num in nums {
        high = max(high, num)
    }
    
    // Iterate using binary search on all divisors.
    while low <= high {
        let mid: Int = (low + high) / 2
        let result: Int = findDivisionSum(nums, mid)
        // If current divisor does not exceed threshold,
        // then it can be our answer, but also try smaller divisors
        // thus change search space to left half.
        if result <= threshold {
            high = mid - 1
        }
        // Otherwise, we need a bigger divisor to reduce the result sum
        // thus change search space to right half.
        else {
            low = mid + 1
        }
    }
    return low
}

let ipArraySmallDivision = [1,2,5,9]
let divisiorThreshold = 6
let opDivisior = smallestDivisor(ipArraySmallDivision, divisiorThreshold)
//print("opDivisior--- ", opDivisior) // 5

// Question: Capacity To Ship Packages Within D Days
    // Check whether the packages can be shipped in less than "days" days with
    // "c" capacity.
// TC: O(Nlog(N))
// SC: O(1)
func feasible(_ weights: [Int],_ c: Int, _ days: Int) ->Bool {
    var daysNeeded = 1, currentLoad = 0
    for weight in weights {
        currentLoad += weight
        if currentLoad > c {// if current load exceeds capacity
            daysNeeded += 1
            currentLoad = weight
        }
    }
    
    return daysNeeded <= days
}

func shipWithinDays(_ weights: [Int],_ days: Int) ->Int {
    var totalLoad = 0, maxLoad = 0
    for weight in weights {
        totalLoad += weight
        maxLoad = max(maxLoad, weight)// Max load will be highest element in the array
    }
    
    var l = maxLoad, r = totalLoad
    
    while l < r {
        var mid = (l + r) / 2
        if feasible(weights, mid, days) {
            r = mid
        } else {
            l = mid + 1
        }
    }
    return l
}

let ipShipWeightArray = [1,2,3,4,5,6,7,8,9,10]
let shipDays = 5
let opLeastWeight = shipWithinDays(ipShipWeightArray, shipDays)
//print("opLeastWeight--- ", opLeastWeight)// 15

// Question: Kth Missing Positive Number
// Approach 1: - Using Bunary search.
// TC: O(Nlog(N))
// SC: O(1)
func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
    var left = 0
    var right = arr.count - 1
    while left <= right {
        let mid = left + (right-left)/2
        if arr[mid] - mid - 1 < k {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return left + k
}

// Approach 2
func findKthPositive2(_ arr: [Int], _ k: Int) -> Int {
    var (left, right) = (0, arr.count)
    while left < right {
        let mid = (left + right) / 2
        (left, right) =  arr[mid] - mid > k ? (left, mid) : (mid+1, right)
    }
    return left + k
}

let  ipArrayKthPositive = [2,3,4,7,11]
let missingNumber = 5
let opKth = findKthPositive(ipArrayKthPositive, missingNumber)
//print(" opKth is--", opKth)// 9


// Question: Aggressive Cow
// TC: O(Nlog(N))
// SC: O(1)

func aggresiveCowPlaces(_ stallArray: [Int], _ cows: Int) -> Int {
    if stallArray.isEmpty { return -1 }
    var sortedCowsArr = stallArray.sorted()
    var cowPosition = sortedCowsArr[0]
    let numberOfStalls = sortedCowsArr.count
    var low = 1 // the first index
    var high = sortedCowsArr[numberOfStalls - 1] - sortedCowsArr[0] // high is max value in stall array
    
    while low <= high {
        let mid = (low + high) >> 1
        if isPossibleToPlace(sortedCowsArr, numberOfStalls, cows, mid) {
            low = mid + 1 // discard left half of array
        } else {
            high = mid - 1 // discard right half of array
        }
    }
    return high
}

func isPossibleToPlace(_ stallArray: [Int],_ numberOfStalls:Int, _ cows: Int, _ minDist: Int) -> Bool {
    var cntCows = 1
    var lastPlacedCow = stallArray[0]// The first position of cow
    for  i in 1..<numberOfStalls {
        if stallArray[i] - lastPlacedCow >= minDist {// As we need largest distace
            cntCows += 1
            lastPlacedCow = stallArray[i]// change position of cow
        }
    }
    if cntCows >= cows {// If cows in stall matches with the inut cows count...
        return true
    }
    return false
}
var cows = 3
var cowsStalls = [1,2,8,4,9]
let minDistanceCows = aggresiveCowPlaces(cowsStalls, cows)
//print("< -- minDistanceCows -- >", minDistanceCows) // 3


// Question: Book Allocation..

// TC: O(Nlog(N))
// SC: O(1)
func bookAllocation(_ arr: [Int], _ booksCount: Int, _ studentsCount: Int) ->Int {
    var start = 0
    var sum = 0
    for i in 0..<booksCount {
        sum += arr[i]
    }
    var end = sum // end = sum of all array elements
    var ans = -1    // initialize ans
    
    var mid = start + (end-start)/2
    
    while start<=end {
        if isPossibleToBookAllocate(arr, booksCount, studentsCount, mid) {
            //possible solution, save the ans and move to left to find minimal possilbe solution, coz right of this will also satisfy the condition
            ans = mid
            end = mid-1
        } else {
            //no soln exists, means more no. of students needed than given, so move to right to increase sum
            //lower the search space, bring start infront
            start = mid+1
        }
        mid = start+(end-start)/2
    }
    return ans
}

func isPossibleToBookAllocate(_ arr: [Int], _ booksCount: Int, _ studentCount: Int, _ mid: Int) -> Bool {
    var currentStudentCount = 1
    var pageSum = 0    //min start with one student, and page sum=0, keep on adding value till it is<mid and rest give to other student and check
    for i in 0..<booksCount {
        if (pageSum + arr[i]) <= mid {
            //a[i] current page sum value, maintain a running count
            pageSum+=arr[i]    //save it || page sum represents the no. of pages alloted to the student in consideration right now
        } else{
            //allocate remaining pages to other student
            currentStudentCount+=1
            //check for no solution case
            if currentStudentCount > studentCount || (arr[i] > mid){
                return false
                //if student >m and the value of current is greater than mid, stop in these two cases
            } else {
                //we increases student count so new page sum value
//                 pageSum=0
//                 pageSum+=arr[i]
//                 we can use above lines also for understanding, if starting from zero no needed for zero + in unary operator
                pageSum = arr[i]
            }
        }
    }
    return true
}

let booksArrayWithPages = [12, 34, 67, 90]
var booksCount = 4
var studentsCount = 2
let minAllocatedBook = bookAllocation(booksArrayWithPages, booksCount, studentsCount)
//print("Min allocation-- ", minAllocatedBook)// 113

// Question: Split Array
// TC: O(Nlog(N))
// SC: O(1)
func splitArray(_ nums: [Int], _ splitValue: Int) -> Int {
    //-1. find the boundary
    var left = 0, right = 0
    for num in nums {
        left = max(num, left)
        right += num
    }
    
    var result = Int.max
    while left <= right {
        let mid = left + (right - left)/2
        if isValidSplitSum(nums, mid, splitValue) {
            result = min(result, mid)
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return result
}

private func isValidSplitSum(_ nums: [Int], _ aSplitSum: Int, _ splitValue: Int) -> Bool {
    var count = 1
    var current = 0
    for i in 0..<nums.count {
        current += nums[i]
        if nums[i] > aSplitSum {
            return false
        }
        if current > aSplitSum {
            current = nums[i]
            count += 1
        }
    }
    return count <= splitValue
}
let arrSplitArray = [7,2,5,10,8]
let splitInto = 2
let opSplitSum = splitArray(arrSplitArray, splitInto)
//print("op Split Sum ", opSplitSum)// 18 which is 10+8 [7,2,5] [10,8]
// Maximise distance between Gas station...

// Question: Max distance between Gas Station.
// TC: O(Nlog(N))
// SC: O(1)
func isPossibleToPlace(_ stations: [Int],_ x: Double) -> Int {
    var station_count = 0
    for i in 0..<stations.count - 1 {
        let distance = Double(stations[i + 1] - stations[i])
        station_count += Int(ceil(distance / x)) - 1
    }
    return station_count
}

func findSmallestMaxDist(_ stations: [Int], _ k: Int) ->Double {
    // Code here
    var low = 0.0
    var n = stations.count
    var high = Double(stations[n - 1] - stations[0])
    while (high - low) > 0.000001 {
        var mid = Double(low + high) / 2
        let x = isPossibleToPlace(stations, mid)
        if x > k {
            low = mid
        } else {
            high = mid
        }
    }
    return high
}

let gasStationArray = [3,6,12,19,33,44,67,72,89,95]
let gasStationToBeInsert = 2
let gasStationDistance = findSmallestMaxDist(gasStationArray, gasStationToBeInsert)
//print(" gasStationDistance -- ", gasStationDistance)// 14


// Question Get Median using Binary Search
// 
// https://leetcode.com/problems/median-of-two-sorted-arrays/description/
/*
 # Approach:  Divide and conquer approach to split the search into smaller problems.
 We need to find the perfect partition:

 L1, L2, ..., maxLowerLeft | minUpperLeft, ...
 R1, R2, ..., maxLowerRight | minUpperRight, ...

 Where:

 maxLowerLeft <= minUpperRight && maxLowerRight <= minUpperLeft

 After that median can be found by a simple formulas depending on input array sizes:

 if sum of sizes is even: (max(maxLowerLeft, maxLowerRight) + min(minUpperLeft, minUpperRight)) / 2
 if sum of sizes is odd: max(maxLowerLeft, maxLowerRight)

TC: O(log(n+m)))
 */
func findMedianSortedArrays(_ lArray: [Int], _ rArray: [Int]) -> Double {
    let lArrayCount = lArray.count
    let rArrayCount = rArray.count
    /// Making sure that left array if smaller that the right one. otherwise flip input params
    if lArrayCount > rArrayCount {
        return findMedianSortedArrays(rArray, lArray)
    }

    var low = 0
    var high = lArrayCount
    
    while low <= high {
        let lPartition = Int(Double(low + high) / 2)
        let rPartition = Int((Double(lArrayCount + rArrayCount) + 1) / 2) - lPartition
        
        let maxLowerLeft = lPartition == 0 ? Int.min : lArray[lPartition - 1]
        let minUpperLeft = lPartition == lArrayCount ? Int.max : lArray[lPartition]
        
        let maxLowerRight = rPartition == 0 ? Int.min : rArray[rPartition - 1]
        let minUpperRight = rPartition == rArrayCount ? Int.max : rArray[rPartition]
        
        if maxLowerLeft <= minUpperRight && maxLowerRight <= minUpperLeft {
            if (lArrayCount + rArrayCount) % 2 == 0 {
                
                let sum = max(maxLowerLeft, maxLowerRight) + min(minUpperLeft, minUpperRight)
                return Double(sum) / 2
            }
            
            return Double(max(maxLowerLeft, maxLowerRight))
        }
        
        if maxLowerLeft > minUpperRight {
            high = lPartition - 1
        } else {
            low = lPartition + 1
        }
    }
    
    /// Error code.
    return -1
}
let medianArrRight = [2,3,6,15]
let medianArrLeft = [1,4,7,10,12]
let getMedian = findMedianSortedArrays(medianArrLeft, medianArrRight)
//print("op Median--- ", getMedian)

// MARK: - Binary search in 2D array.

// Question: Find rows with maximum 1's

// The main function that returns index of row with maximum
// number of 1s.
func rowWithMax1s(_ mat: [[Int]]) ->Int {
    
    let row = 4
    let col = 4
    // Initialize first row as row with max 1s
    var maxRowIndex = 0
    var j = col - 1
    
    for i in  0..<row {
        // Move left until a 0 is found
        var flag = false
        
        // to check whether a row has more 1's than previous
        while j >= 0 && mat[i][j] == 1 {
            
            j = j - 1 // Update the index of leftmost 1
            // seen so far
            flag = true//present row has more 1's than previous
        }
        
        // if the present row has more 1's than previous
        if flag {
            maxRowIndex = i // Update max_row_index
        }
    }
    if maxRowIndex == 0 && mat[0][col - 1] == 0 {
        return -1
    }
    return maxRowIndex
}

// Driver Code
let oncesMatric = [[0, 0, 0, 1],
                   [0, 1, 1, 1],
                   [1, 1, 1, 1],
                   [0, 0, 0, 0]]

//print("Index of row with maximum 1s is ", rowWithMax1s(oncesMatric))// 2


// Question: Search Element in 2D Sorted Matrix:


//TC: O(m*n)
// SC: O(1)
func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    if matrix.isEmpty  { return false}
    var lo = 0
    let n = matrix.count
    let m = matrix[0].count
    var hi = (n * m) - 1
    
    while lo <= hi {
        var  mid = (lo + (hi - lo) / 2)
        if matrix[mid/m][mid % m] == target {
            return true
        }
        if matrix[mid/m][mid % m] < target {
            lo = mid + 1
        } else {
            hi = mid - 1
        }
    }
    return false
}



let matrixSorted = [[1,3,5,7],
                    [10,11,16,20],
                    [23,30,34,60]]
let elementToSearch = 3
let isFoundInMatrix = searchMatrix(matrixSorted, elementToSearch)
// print("is FoundInMatrix ", isFoundInMatrix)// true

// Question.

//    func searchMatrix2(_ matrix: [[Int]], _ target: Int) -> Bool {
//        for nums in matrix {
//            if binarySearch(nums, target) { return true }
//        }
//        return false
//    }
//
//    func binarySearch(_ nums: [Int], _ target: Int) -> Bool {
//
//        var leftIndex = 0
//        var rightIndex = nums.count - 1
//
//        while leftIndex <= rightIndex {
//
//            let middleIndex = (leftIndex + rightIndex) / 2
//            let middleValue = nums[middleIndex]
//
//            if target == middleValue {
//                return true
//            }
//
//            if target < middleValue {
//                rightIndex = middleIndex - 1
//            }
//
//            if target > middleValue {
//                leftIndex = middleIndex + 1
//            }
//        }
//
//        return false
//    }
// TC: O(N + M)
// SC: O(1)
func searchMatrix2(_ matrix: [[Int]], _ target: Int) -> Bool {
    var row = 0
    var col = matrix[row].count - 1
    while row < matrix.count && col >= 0 {
        if matrix[row][col] == target {
            return true// row, col
        }
        if matrix[row][col] < target {
            row+=1 // Target lies in further row
        } else {
            col-=1  // Target lies in previous column
        }
    }
    return false
}

// Approch 2: by converting it into 1D matrix.
// TC: O(log N*M)
// SC: O(1)
// Only useful when matrix elements are sorted & greater
    func searchMatrix2Using1D(_ matrix: [[Int]], _ target: Int) -> Bool {
        var row = matrix.count
        var col = matrix[0].count
        var l = 0, h = (row * col) - 1
        while l <= h {
            let mid = l + ((h - l) / 2)
            let tC = mid % col
            let tR = mid / col
            let val = matrix[tR][tC]
            if val == target {
                return true
            }
            if (val < target) {
                l = mid + 1
            } else {
                h = mid - 1
            }
        }
        return false
    }


let searchMatrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]]
let targetToSearch = 5
let opSearchElement = searchMatrix2(searchMatrix, targetToSearch)
//print(" opSearchElement --- ", opSearchElement)// true

// Question:  find peak in matrix:
// TC: M*log(N).
// SC: O(1)
func findPeakGrid(_ mat: [[Int]]) -> [Int] {
    var startCol = 0, endCol = mat[0].count-1
    
    while startCol <= endCol {
        var maxRow = 0, midCol = startCol + (endCol-startCol)/2
        
        for row in 0..<mat.count {
            maxRow = mat[row][midCol] >= mat[maxRow][midCol] ? row : maxRow
        }
        
        var leftIsBig    =   midCol-1 >= startCol  &&  mat[maxRow][midCol-1] > mat[maxRow][midCol]
        var rightIsBig   =   midCol+1 <= endCol    &&  mat[maxRow][midCol+1] > mat[maxRow][midCol]
        
        if !leftIsBig && !rightIsBig {  // we have found the peak element
            return [maxRow, midCol]
            
        } else if (rightIsBig) { // if rightIsBig, then there is an element in 'right' that is bigger than all the elements in the 'midCol',
            startCol = midCol+1 //so 'midCol' cannot have a 'peakPlane'
            
        } else  {// leftIsBig
            endCol = midCol-1
        }
    }
    return []
}

let demoMatrix = [[10,20,15],[21,30,14],[7,16,32]]
let peakElement = findPeakGrid(demoMatrix)
//print("Peak Grid is--- ", peakElement)// [1,1]// Explanation: Both 30 and 32 are peak elements so [1,1] and [2,2] are both acceptable answers.


// Question: Median of Row wise sorted matrix..
// TC:O(row*log col)
// SC:O(1)
func countSmallerThanMid(_ A: [Int], _ mid: Int,_ n: Int) ->Int {
    var l = 0, h = n - 1
    while l <= h {
        var md = (l + h) >> 1
        if (A[md] <= mid) {
            l = md + 1
        } else {
            h = md - 1
        }
    }
    return l
}

func findMedian(_ A: [[Int]], _ row: Int, _ col: Int) -> Int {
    var low = 1
    var high = 1000000000
    var n = row
    var m = col
    while low <= high {
        var mid = (low + high) >> 1
        var cnt = 0
        for i in 0..<n {
            cnt += countSmallerThanMid(A[i], mid, col)
        }
        if (cnt <= (n * m) / 2) {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    return low
}
var row1 = 3, col1 = 3
var aMatrix = [[1, 3, 8],
           [2, 3, 4],
           [1, 2, 5]]
print("The median of the row-wise sorted matrix is: ", findMedian(aMatrix, row1, col1)) // 3
//Explanation: If we find the linear sorted array, the array becomes 1 1 2 2 3 3 4 5 7 8 So, median = 3


