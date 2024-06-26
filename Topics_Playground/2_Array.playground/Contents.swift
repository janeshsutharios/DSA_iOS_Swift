// Array questions.

// MARK: - Array Easy
// Q #1,#2: Find second highest & lowest number...
// https://takeuforward.org/data-structure/find-second-smallest-and-second-largest-element-in-an-array/
func secondLargest(arr: inout [Int], _ n: Int) -> Int {
    if n<2 { return -1 }
    var large = 0
    var secondLarge = 0
    for i in 0..<n {
        if arr[i] > large {
            secondLarge = large
            large = arr[i]
        }
        
        else if arr[i] > secondLarge && arr[i] != large {
            secondLarge = arr[i]
        }
    }
    return secondLarge
}

func secondLowest(arr: inout [Int], _ n: Int) -> Int {
    if n<2 { return -1 }
    var small = Int.max
    var secondSmall = Int.max
    for i in 0..<n {
        if arr[i] < small {
            secondSmall = small
            small = arr[i]
        }
        
        else if arr[i] < secondSmall && arr[i] != small {
            secondSmall = arr[i]
        }
    }
    return secondSmall
}

var arr = [4,3,2,5,9,9]
secondLargest(arr: &arr, arr.count)
secondLowest(arr: &arr, arr.count)

// Q #3 : Check is array is sorted...
// https://takeuforward.org/data-structure/check-if-an-array-is-sorted/
func isSorted(_ arr: [Int]) ->Bool {
    for obj in 1..<arr.count {
        if arr[obj-1] > arr[obj] {
            return false
        }
    }
    return true
}

//var digits = [5,2,3,4]
//isSorted(digits)

// #Addon : Find duplicate elements in array
// Approach: 1 brute force
// TC O(n^2)
// SC O(n)
func findDuplicate1(_ nums: [Int]) -> Int {
    let arr = nums.sorted()
    for i in 0..<arr.count {
        for j in i+1..<arr.count {
            if arr[i] == arr[j] {
                return arr[i]
            }
        }
    }
    return -1

}
//let arr = [9,3,3,5,2,5]
//let dup = findDuplicate1(arr)
//print("dup is", dup)

// Approach: 2 Better solution.
// TC O(n)
// SC O(n)
func findDuplicate2(_ nums: [Int]) -> Int {
    let arr = nums.sorted()
    let size = arr.count
    for i in 1..<arr.count {
        if arr[i] == arr[i-1] {
            return arr[i]
        }
    }
    return -1
}
//var arr = [3,3,5,4,1,3]
//let dup = findDuplicate(arr)
//print("dup is", dup)

// Approach: #3 Optimum solution using Hashing. Here original Array also not disturbed
// TC O(n)
// SC O(n)
func findDuplicate3(_ nums: [Int]) -> Int {
    var hashMap: [Int:Int] = [:]
    for i in nums {
        if hashMap[i] == nil {
            hashMap[i] = i
        } else {
            return hashMap[i]!
        }
    }
    return -1
}
//let arr = [9,2,3,3,5,2,5]
//let dup = findDuplicate(arr)
//print("dup is--->", dup)

//Approach #4  Optimum Solution using Flyod Tortoise Hare solution
//Time Complexity: O(n)
//Space Complexity: O(1)
func findDuplicate4(_ nums: [Int]) ->Int {
    // Find the intersection point of the two runners.
    if nums.isEmpty { return -1 }
    var tortoise = nums[0]
    var hare = nums[0]
    var countValue = nums.count
    repeat {
        if tortoise < countValue {
            tortoise = nums[tortoise]
        } else { return -1 }
        if hare < countValue {
            let firstValue = nums[hare]
            if firstValue < countValue {
                hare = nums[firstValue]
            } else { return -1 }
        } else { return -1 }
    } while (tortoise != hare)
    
    // Find the "entrance" to the cycle.
    tortoise = nums[0]
    while tortoise != hare {
        if tortoise < countValue {
            tortoise = nums[tortoise]
        }
        if hare < countValue {
            hare = nums[hare]
        }
    }
    return hare
}


let duplicate1 = findDuplicate1([1,2,3,1])//1,2,2,3,4,5,6
//print("dup is-->", duplicate1)
//print("data--")

// Approach #5
func findDuplicate5(_ nums: inout [Int],  _ cur: Int) -> Int {
    if (cur == nums[cur]) {
        return cur
    }
    var nxt = nums[cur]
    nums[cur] = cur
    return findDuplicate5(&nums, nxt)
}
//  var arr = [3,3,5,4,1,3]
//
//let duplicate = findDuplicate5(&arr, 0)
//print(duplicate)

// Q #4 Remove duplicates from sorted array.
// https://leetcode.com/problems/remove-duplicates-from-sorted-array/
func removeDuplicates(_ nums: inout [Int]) -> Int {
    
    guard !nums.isEmpty else { return 0 }
    var i = 0
    
    for j in 1..<nums.count {
        // Only to add new elements in array
        guard nums[i] != nums[j] else { continue }
        i += 1
        //Assign it to original array
        nums[i] = nums[j]
    }
    return i + 1
}

// Q #5: Left Rotate array by one
// https://takeuforward.org/data-structure/left-rotate-the-array-by-one/
func rotateArrayByOne(_ arr: inout [Int], _ n: Int)  {
    if n < 2 { return }
    var temp = arr[0] // storing the first element of array in a variable
    for i in 0..<n-1 {
       arr[i] = arr[i + 1]
     }
     arr[n - 1] = temp // assigned the value of variable at the last index
    
}
//var digits = [5,2,3,4]
//rotateArrayByOne(&digits, digits.count)
//print(digits)

// Q #6 Rotate element by K place.
//Input: nums = [1,2,3,4,5,6,7], k = 3
//Output: [5,6,7,1,2,3,4]
// https://leetcode.com/problems/rotate-array/description/
func rotate(_ nums: inout [Int], _ k: Int) {
    let arrCount = nums.count
    let k = k%arrCount // Modulo ensures the range within the length and avoids unnecessary rotation.
    reverse(&nums, 0, arrCount-1)
    reverse(&nums, 0, k-1)
    reverse(&nums, k, arrCount-1)
}

//Q #7 moves zeroes to end

func moveZerosToEnd(_ arr: inout [Int]) {
    var firstZeroIndex = 0
    for obj in arr {
        if obj == 0 {
            break
        } else {
            firstZeroIndex+=1
        }
    }
    var i = firstZeroIndex
    var j = firstZeroIndex + 1
    while i < arr.count && j < arr.count  {
        if arr[j] != 0 {
            let temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp
            i+=1
        }
        j+=1
    }
    
}

//var mixArray = [1,2,0,1,0,4,0]
//moveZerosToEnd(&mixArray)
//print(mixArray)

//Q #8  Calculate union of two sorted array

//Input: n = 5,m = 5.
//arr1[] = {1,2,3,4,5}
//arr2[] = {2,3,4,4,5}
//Output: {1,2,3,4,5}

func unionOfTwoSortedArray(array1: [Int], array2: [Int]) -> [Int] {
    let firstLength = array1.count
    let secondLength = array2.count
    var i = 0, j = 0
    var unionArray: [Int] = []
    
    while i < firstLength && j < secondLength {
        if array1[i] < array2[j] {
            // To check if unionArray is non empty & elements is not present already
            if unionArray.isEmpty || unionArray.last != array1[i] {
                unionArray.append(array1[i])
            }
            i+=1
        } else {
            if unionArray.isEmpty || unionArray.last != array2[j] {
                unionArray.append(array2[j])
            }
            j+=1
        }
    }
    while i < firstLength {
        if unionArray.last != array1[i] {
            unionArray.append(array1[i])
        }
        i+=1
    }
    while j < secondLength {
        if unionArray.last != array2[j] {
            unionArray.append(array2[j])
        }
        j+=1
    }
    return unionArray
}

//let firstArray = [1,2,3,4,5]
//let secondArray = [2,3,4,4,5]

//let unionArray = unionOfTwoSortedArray(array1: firstArray, array2: secondArray)
//print("union-Array->", unionArray)


//Q #Add On: Find intersaction of two elements
// Ex-->    A: [1 2 3 3 4 5 6] , B: [3 3 5] Output: 3,3,5
// TC O(n)
// SC O(1)

func findIntersactionOfElements(array1: [Int], array2: [Int]) -> [Int] {
    let firstLength = array1.count
    let secondLength = array2.count
    var i = 0, j = 0
    var intersactionArray: [Int] = []
    
    while i < firstLength && j < secondLength {
        // Intersaction means elements are equal so we just compare i & j
        if array1[i] == array2[j] {
            intersactionArray.append(array1[i])
            i+=1
            j+=1
        } else  if array1[i] < array2[j] {
            i+=1
        } else  {
            j+=1
        }
    }
    return intersactionArray
}

let firstArray = [1, 2, 3, 3, 4, 5, 6]
let secondArray = [3,3,5]

let intersactionArray = findIntersactionOfElements(array1: firstArray, array2: secondArray)
//print("intersactionArray-Array->", intersactionArray)

//Q #9  Find the missing number in first n Natural numbers...
//https://leetcode.com/problems/missing-number/description/
// Approach 1: Using Summation
// TC:O(n)
// SC:O(1)
func findMissingNumber1(arr: [Int]) ->Int {
    let len = arr.count
    var summationOfFirstN = len*(len+1)/2
    for value in arr {
        summationOfFirstN -= value
    }
    return summationOfFirstN
}

// Approach 2: Using Summation
// TC:O(n)
// SC:O(1)
//To avoid integer overflow, pick one number from the range [1, N] and subtract a number from the given array (don’t subtract the same number twice)

func findMissingNumber2(arr: [Int]) ->Int {
    var total: Int = 1
    var arrCount = arr.count + 1
 
    for i in 2..<arrCount {
        total += i
        total = total - arr[i - 2]
    }
    return total
}

// Approach 3: Using XOR
// TC:O(2n)
// SC:O(1)
func findMissingNumber3(arr: [Int]) ->Int {

    var arrCount = arr.count
    // For xor of all the elements in array
    var x1 = arr[0]
 
    // For xor of all the elements from 1 to n+1
    var x2 = 1
 
    for i in 1..<arrCount-1 {
        x1 = x1 ^ arr[i]
    }
    for i in 2..<arrCount+1 {
        x2 = x2 ^ i
    }
    return x1 ^ x2
}
 var arrayMiss: [Int] = [1,2,3,5]
//print("Missing numbers is-->", findMissingNumber1(arr: arrayMiss))
//print("Missing numbers is-->", findMissingNumber2(arr: arrayMiss))
//print("Missing numbers is-->", findMissingNumber3(arr: arrayMiss))


//Q #10 find maximum number of concecutive 1's by flipping the zeros
//https://leetcode.com/problems/max-consecutive-ones-iii/description/

func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var cnt = 0
    var maxi = 0
    for num in nums {
        if num == 1 {
            cnt += 1
        } else {
            cnt = 0
        }
        maxi = max(maxi, cnt)
    }
    return maxi
}

// Example usage:
let array = [1, 1, 0, 1, 1, 1]
let result = findMaxConsecutiveOnes(array)
print(result) // Output: 3

// TC: O(n)
// SC: O(1)
func maxConsecutiveOfonesWithFlipiingZeros(arr: inout [Int],
                                           arrCount: inout Int,
                                           maxZeros: inout Int) -> Int {
    
    var startWindowIndex = 0
    var endWindowIndex = 0
    
    for currentWindowIndex in 0..<arrCount {
        if arr[currentWindowIndex] == 0 {
            maxZeros -= 1
        }
        if maxZeros < 0 {
            startWindowIndex += 1
            if arr[startWindowIndex] == 0 {
                maxZeros += 1
            }
        }
        endWindowIndex = currentWindowIndex
    }
    return endWindowIndex-startWindowIndex
}

var arrMix = [1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1]
var arrCount = 11
var maxZeros = 2
let op = maxConsecutiveOfonesWithFlipiingZeros(arr: &arrMix,
                                               arrCount: &arrCount,
                                               maxZeros: &maxZeros)
//print("op", op)

//Q #11 Find the number that appears once, and the other numbers twice
func findNumberAppearOnce(arr: inout [Int]) -> Int {
    
    var hashObject: [Int:Int] = [:]
    
    for obj in arr {
        if hashObject[obj] == nil {
            hashObject[obj] = 1
        } else {
            hashObject[obj]!+=1
        }
    }
    for (key, _) in hashObject where hashObject[key] == 1 {
      return key
    }
    return -1
}
// Optimum approach using XOR operation
func findNumberAppearOnceUsingXOR(arr: inout [Int]) -> Int {
    var xorOutput = 0
    for obj in arr {
        xorOutput^=obj
    }
    return xorOutput
}

var randomArray: [Int] = [9,2,2,3,4,4,3]
let uniqueAppearNumber = findNumberAppearOnceUsingXOR(arr: &randomArray)
//print(" uniqueAppearNumber ", uniqueAppearNumber)

//Q 12 Largest subarray with sum K

func subarraySum(_ nums: [Int], _ targetSum: Int) -> Int {
    var result = 0
    var dict = [Int: Int]()
    dict[0] = 1
    
    var sum = 0
    for num in nums {
        sum += num
        if let val = dict[sum - targetSum] {
            result += val
            //print("value got-->", val)
        }
        dict[sum, default: 0] += 1
        // Same as
        //        if let val = dict[sum] {
        //            dict[sum] = val + 1
        //        } else {
        //            dict[sum] = 1
        //        }
    }
    //print("sum--->", dict)
    return result
}

let yyy = [10, 5, 2, 7, 1, 9]
let targetSum = 15
let xxx = subarraySum(yyy, 15)
//print("xxx-->",xxx)


// Question find longest subarray with given sum k
// Example : - [2, 3, 5, 1, 9] and k - 10 => output - 2,3,5

func longestSubarrayWithGivenSumKTwoLoops(_ arr: inout [Int], k: Int) -> Int {
    
    var len = 0
    
    for i in 0..<arr.count {
        var sum: UInt64 = 0
        for j in i..<arr.count {
            sum+=UInt64(arr[j])
            if sum == k {
                len = max(len, j - i + 1)
            }
        }
    }
    return len
}

var arrayex: [Int] = [2, 3, 5, 1, 9]
let desiredSum = 10
let largestSumElements = longestSubarrayWithGivenSumKTwoLoops(&arrayex, k: desiredSum)
//print("largestSum elements", largestSumElements)


// MARK: - Array Medium
//Q #1 Two-Sum. Using two pointers approach..
// https://leetcode.com/problems/two-sum/
// First sort array then
//If arr[left] + arr[right] > sum, we will decrement the right pointer.
//If arr[left] + arr[right] < sum, we will increment the left pointer.
//If arr[left] + arr[right] == sum, we will return the result.
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

func twoSumUsingDictionary(_ nums: [Int], _ target: Int) -> [Int] {
    var dictionary = [Int:Int]()
   for (i, n) in nums.enumerated() {
       if let last = dictionary[target - n] {
           return [last, i]
       }
       dictionary[n] = i
   }
   return []
}
var twoSumArr = [2, 6, 5, 8, 11]
let target = 14
let ans = twoSum(arr: &twoSumArr, target: target)
//print("two sum index found-->", ans, twoSumArr[ans[0]], twoSumArr[ans[1]])

//Q #2 Sort 0, 1 & 2's in an given array.
// https://leetcode.com/problems/sort-colors/description/
func sortColors(_ nums: inout [Int]) {
    var low = 0
    var high = nums.count - 1
    var mid = 0
    
    while mid <= high {
        switch nums[mid] {
        case 0:
            nums.swapAt(low,mid)
            low += 1
            mid += 1
        case 2:
            nums.swapAt(mid,high)
            high -= 1
        case 1:
            mid += 1
        default:
            continue
        }
    }
}
var nums = [2,0,2,1,1,0]
sortColors(&nums)
//print("sort--->", nums)

//Q #3 - Find the Majority Element that occurs more than N/2 times
// https://leetcode.com/problems/majority-element/description/
// TC: O(n*2)
// SC: O(1)
func majorityElement(arr: inout [Int]) -> Int {
    // Size of the given array
    let n = arr.count

    for i in 0..<n {
        // Selected element is arr[i]
        var cnt = 0
        for j in 0..<n {
            // Counting the frequency of arr[i]
            if arr[j] == arr[i] {
                cnt+=1
            }
        }
        
        // Check if frequency is greater than n/2
        if (cnt > n/2) {
            return arr[i]
        }
    }

    return -1
}
// Approach #2 Optimal Approach: Moore’s Voting Algorithm:--->
/**
 Basically, we are trying to keep track of the occurrences of the majority element and minority elements dynamically. if, the count becomes 0 as the occurrence of Element and the occurrence of the other elements are the same. So, they canceled each other. This is how the process works. The element with the most occurrence will remain and the rest will cancel themselves.

 */
func majorityElementMooreVoting(arr: inout [Int]) -> Int {
    // Size of the given array
    let n = arr.count
    var cnt = 0 // Count
    var el = 0 // Element

    // Applying the algorithm
    for i in 0..<n {
        if cnt == 0 {
            cnt = 1
            el = arr[i]
        } else if el == arr[i] {
            cnt+=1
        } else {
            cnt-=1
        }
    }

    // Checking if the stored element is the majority element
    var cnt1 = 0
    for i in 0..<n where arr[i] == el {
        cnt1+=1
    }

    if (cnt1 > n / 2) {
        return el
    }
    return -1
}
var majorityArr = [2, 2, 1, 1, 1, 2, 2]
let ansMajority = majorityElementMooreVoting(arr: &majorityArr)
//print("The majority element is:", ansMajority)

//Q #4,#5 Kadane-Algo Max subarray sum in an array
//https://leetcode.com/problems/maximum-subarray/description/
func findSubArrayWithMaxSumKadane(arr: inout [Int]) -> (sumValue: Int, startIndex: Int, endIndex: Int) {
 
    var sum = 0
    var maximumValue = 0
    
    // variables to capture start and end index
    var startIndex = 0
    var endIndex = 0
    var progressiveStartIndex = 0
    //
    
    for i in 0..<arr.count {
        sum += arr[i]
        if sum > maximumValue {
            maximumValue = sum
            startIndex = progressiveStartIndex
            endIndex = i
        }
        if sum < 0 {
            sum = 0
            progressiveStartIndex = i+1
        }
    }
    return (sumValue: maximumValue, startIndex: startIndex, endIndex: endIndex)
}

var kadaneArray = [-2,1,-3,4,-1,2,1,-5,4]
let kadaneSum = findSubArrayWithMaxSumKadane(arr: &kadaneArray)
//print("The kadaneSum  is:", kadaneSum)

//Q 6: Best time to Buy sell stocks
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/
func maxProfit(arr: [Int]) -> Int {
    var buyPrice = Int.max
    var difference = 0
    
    for i in 0..<arr.count {
        if arr[i] < buyPrice {
            buyPrice = arr[i]
        }
        if difference < (arr[i] - buyPrice) {
            difference = arr[i] - buyPrice
        }
        // OR.
        /**
        minPrice = min(minPrice, arr[i])
        maxPro = max(maxPro, arr[i] - minPrice)
         */
    }
    return difference
}

var stockArray = [7, 1, 5, 3, 6, 4]
let profitMax = maxProfit(arr: stockArray)
//print("The maxProfit  is:", profitMax)

// Q #7 Rearrange array by sign
// https://leetcode.com/problems/rearrange-array-elements-by-sign/
// Appoach: as postive index is on even numbers so create variable named positiveIndex with 0 & negativeIndex with 1 and increment the index by +2 after fill.
// TC: O(n)
// SC: O(1)
func rearrangeArray(arr: [Int]) -> [Int] {
    var positiveIndex = 0
    var negativeIndex = 1
    var arrangedArray = Array.init(repeating: 0, count: arr.count)
    for i in 0..<arr.count {
        if arr[i] < 0 {
            arrangedArray[negativeIndex] = arr[i]
            negativeIndex += 2
        } else {
            arrangedArray[positiveIndex] = arr[i]
            positiveIndex += 2
        }
    }
    return arrangedArray
}

var mixArray = [1,2,-3,-1,-2,3]
let opArrangedArr = rearrangeArray(arr: mixArray)
//print("The op Arranged Arr  is:", opArrangedArr)// [1, -3, 2, -1, 3, -2]

//Q #8 Find Next permutation.
//https://leetcode.com/problems/next-permutation/
func nextPermutation(_ nums: inout [Int]) {
    let arrayCount = nums.count
    var lhs = -1, rhs = -1, idx = arrayCount - 2
    while idx >= 0 {
        if nums[idx] < nums[idx + 1] {
            lhs = idx
            break
        }
        idx -= 1
    }
    if lhs == -1 {
        nums = nums.reversed()
        return
    }
    
    idx = arrayCount - 1
    while idx > lhs {
        rhs = idx
        if nums[idx] > nums[lhs] { break }
        idx -= 1
    }
    nums.swapAt(lhs, rhs)
    nums.replaceSubrange(lhs + 1..<arrayCount, with: nums[lhs + 1...arrayCount - 1].reversed())
}
var permutationArr = [1,2,3]
nextPermutation( &permutationArr)
//print("The next permutation is: ", permutationArr )// 1,3,2

//Q #9 Leaders in an Array
//https://www.geeksforgeeks.org/problems/leaders-in-an-array-1587115620/1?utm_source=youtube&utm_medium=collab_striver_ytdescription&utm_campaign=leaders-in-an-array
//Problem Statement: Given an array, //print all the elements which are leaders. A Leader is an element that is greater than all of the elements on its right side in the array.
// TC O(N)
// SC O(N)
func findLeader(arr: [Int]) ->[Int] {
    var leader = arr.last ?? 0
    var leaderArray:[Int] = [leader]//  Last will always leader because no elements are on right
    for obj in stride(from: arr.count-2, to: 0, by: -1) {
        if arr[obj] > leader {// If element is greater than leader append it into new array
            leader = arr[obj]
            leaderArray.append(leader)
        }
    }
    return leaderArray
}

var leaderArr = [10, 22, 12, 3, 0, 6]
let leaderArrayOutput = findLeader(arr: leaderArr)
//print("Leader array-->", leaderArrayOutput)

//Q #10 longest-consecutive-sequence-in-an-array/
//https://takeuforward.org/data-structure/longest-consecutive-sequence-in-an-array/
// TC: O(N)
// SC: O(N)
func  longestConsecutive(_ nums: [Int]) -> Int {
    
    var setObject = Set(nums)
    var longestStreak = 0
    
    for i in 0..<nums.count {
        
        if !setObject.contains(nums[i] - 1) {// Find smallest element in the set
            var currentNum = nums[i]
            var currentStreak = 1
            
            while setObject.contains(currentNum + 1) {// Based on smallest element we got find next higher number
                currentNum += 1
                currentStreak += 1
            }
            
            longestStreak = max(longestStreak, currentStreak)// compare max length array
        }
    }
    
    return longestStreak
}
var consecutiveArr = [200,4,2,1,3,100]
var ansConsecutiveArr = longestConsecutive(consecutiveArr)
//print("The longest consecutive sequence is ", ansConsecutiveArr)// 4

//Q #11 Set matrix zero
//https://leetcode.com/problems/set-matrix-zeroes/description/
// Time Complexity: O(M×N) where M and N are the number of rows and columns respectively.
// Space Complexity: O(M + N).
// This is taking extra space because of storage of rows & cols.
// Here we find the rows & cols which is zero & then iterate over matrix & make that rows and cols as zero
func setZeroes(_ matrix: inout [[Int]]) {
    
    var cacheRows: [Int] = []
    var cacheCols: [Int] = []
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            // Set Rows Cols index cache
            if matrix[i][j] == 0 {
                cacheRows.append(i)
                cacheCols.append(j)
            }
        }
    }
    
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            // Set matrix to zero where it contains i Row & j Col
            if cacheRows.contains(i) || cacheCols.contains(j) {
                matrix[i][j] = 0
            }
        }
    }
}
var matrixArr1 = [[1,1,1],[1,0,1],[1,1,1]]
var matrixArr2 = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
setZeroes(&matrixArr1)
setZeroes(&matrixArr2)
//print("matrix1 array-->", matrixArr1) // [[1, 0, 1], [0, 0, 0], [1, 0, 1]]
//print("matrix2 array-->", matrixArr2) // [[0, 0, 0, 0], [0, 4, 5, 0], [0, 3, 1, 0]]

// Q #12 Rotate matrix
//https://leetcode.com/problems/rotate-image/description/

func rotateMatrix(_ matrix: inout [[Int]]) {
    var rows = matrix.count
    var columns = rows
    
    //transpose of Matrix
    for row in 0..<rows {
        for column in row..<columns {
            let temp = matrix[row][column]
            matrix[row][column] = matrix[column][row]
            matrix[column][row] = temp
        }
    }
    
    for row in 0..<rows {
        matrix[row].reverse()
    }
}

var matrixToRotate =  [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
rotateMatrix(&matrixToRotate)
//print("Rotated matrix output-->", matrixToRotate)//  [[7, 4, 1], [8, 5, 2], [9, 6, 3]]

//Q 13: Spiral matrix swift..
// TC: O(MxN)
// TC: O(N)
func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    if matrix.isEmpty { return [] }
    
    var result: [Int] = []
    var rBegin = 0, rEnd = matrix.count - 1
    var cBegin = 0, cEnd = matrix[0].count - 1
    
    while rBegin <= rEnd && cBegin <= cEnd {
        // Traverse right
        for i in stride(from: cBegin, to: cEnd + 1, by: 1) {
            result.append(matrix[rBegin][i])
        }
        rBegin += 1
        
        // Traverse down
        for i in stride(from: rBegin, to: rEnd + 1, by: 1) {
            result.append(matrix[i][cEnd])
        }
        cEnd -= 1
        
        // Traverse left
        if rBegin <= rEnd {
            for i in stride(from: cEnd, to: cBegin - 1, by: -1) {
                result.append(matrix[rEnd][i])
            }
        }
        rEnd -= 1
        
        // Traverse up
        if cBegin <= cEnd {
            for i in stride(from: rEnd, to: rBegin - 1, by: -1) {
                result.append(matrix[i][cBegin])
            }
        }
        cBegin += 1
    }
    return result
}


var spiralMatrix =  [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
//print("spiralMatrix matrix output-->", spiralOrder(spiralMatrix))//  [1, 2, 3, 6, 9, 8, 7, 4, 5]

//Q 14: Subarray Sum Equals K
//https://leetcode.com/problems/subarray-sum-equals-k/description/
// TC: O(n)
// SC: O(n)
func subarraySumK(_ arr: [Int], _ k: Int) ->Int {
    var result = 0, sum = 0
    var dict: [Int:Int] = [:]
    dict[0] = 1
    for num in arr {
        sum += num
        if let val = dict[sum - k] {
            result += val
        }
        dict[sum, default: 0] += 1// Storing the previous sum value which can be added to result.
    }
    return result
}

let subArr = [1,0,2,3]
let kSum = 3
let opKsum = subarraySumK(subArr, kSum)
//print(" subArr with k sum is-->", opKsum)// 2 (1,2 & 3)

// MARK: - Array Hard

//#Q 1 Pascal traingle
// https://leetcode.com/problems/pascals-triangle/description/
// TC : o(n^2) double loop
// SC o(n^2) 2D array.
func generatePascalsTriangle(_ numRows: Int) -> [[Int]] {
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
let numberOfRows = 5
//print("Pascal triangle --->", generatePascalsTriangle(numberOfRows))

//Q #2 Majority Element (n/3 times)
//https://leetcode.com/problems/majority-element-ii/description/
func majorityElementNBy3(_ nums: [Int]) -> [Int] {
    if nums.isEmpty { return [] }
    var frequencyDictionary: Dictionary<Int,Int> = [:], result: [Int] = []
    for num in nums {
        frequencyDictionary[num, default: 0] += 1
    }
    for (key,val) in frequencyDictionary where val > (nums.count/3) {
        result.append(key)
    }
    return result
}
let majority3Input = [11, 33, 33, 11, 33, 11]
let majority3Output = majorityElementNBy3(majority3Input)
// print("The majority elements are: ", majority3Output) // 11, 33

// Q #3 ThreeSum problem.
//https://leetcode.com/problems/3sum/description/
func threeSum(_ nums: [Int]) -> [[Int]] {
    let sorted = nums.sorted()
    var result = [[Int]]()
    for index in 0 ..< sorted.count - 2 {
        let first = sorted[index]
        if index > 0, sorted[index - 1] == first {
            // Iterating through the same number. Already handled.
            continue
        }
        
        // Now we know the first number, iterating up from the beginning, down from the end
        // to find all cases of (second + third) == - first
        var lowerIndex = index + 1
        var upperIndex = sorted.count - 1
        
        /// Iterate lower bound up to change the value of `second`.
        /// Increases the sum
        func nextLower() {
            let current = sorted[lowerIndex]
            repeat {
                lowerIndex += 1
            } while lowerIndex < upperIndex && sorted[lowerIndex] == current
        }
        
        /// Iterate upper bound down to change the value of `third`.
        /// Decreases the sum
        func nextUpper() {
            let current = sorted[upperIndex]
            repeat {
                upperIndex -= 1
            } while lowerIndex < upperIndex && sorted[upperIndex] == current
        }
        
        while lowerIndex < upperIndex {
            let second = sorted[lowerIndex]
            let third = sorted[upperIndex]
            
            switch (first + second + third) {
            case 0:
                result.append([first, second, third])
                nextLower()
                nextUpper()
            case ..<0:
                // We need to increase the sum
                nextLower()
            case 1...:
                // We need to decrease the sum
                nextUpper()
            default: fatalError()
            }
        }
    }
    return result
}

// Q #4:Sum which equals to zero
// Two pointers a & b are fixed and we have two moving  pointers c and d. where c starts from b + 1 and d is start from last index
//https://leetcode.com/problems/4sum/description/
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    let len = nums.count
    guard len >= 4 else { return [] }// minimum 4 items required for 4 sum
    
    var result = [[Int]]()
    let sort = nums.sorted()
    
    for a in 0..<(len - 1) where a == 0 || sort[a] != sort[a-1] { // if sort[a] == sort[a-1] discard the loop // a is fix pointer
        for b in (a + 1)..<len where b == a + 1 || sort[b] != sort[b-1] {// if sort[b] == sort[b-1] discard the loop // b is fix pointer
            var c = b + 1, d = len - 1// c pointer is b+1 which is movable
            while c < d {// As array is sorted check if c pointer doesn't jump
                let val = (a: sort[a], b: sort[b], c: sort[c], d: sort[d])
                let sum = (val.a + val.b + val.c + val.d)
                if sum == target { result.append([val.a,val.b,val.c,val.d]) }// add result to the array as we found the desired sum
                if sum < target {
                    while sort[c] == val.c, c < d { c += 1 }// increment c pointer as we get lesser sum
                } else {
                    while sort[d] == val.d, d > b { d -= 1 }// decrement d pointer which is the last
                }
            }
        }
    }
    return result
}

let fourSumInputArray = [1,0,-1,0,-2,2]
let fourSumOutputArray = fourSum(fourSumInputArray, 0)
//print("Output array-->", fourSumOutputArray) //[[-2, -1, 1, 2], [-2, 0, 0, 2], [-1, 0, 0, 1]]

// Q #5 Length of the longest subarray with zero Sum
//https://takeuforward.org/data-structure/length-of-the-longest-subarray-with-zero-sum/
func maxLen(_ A: [Int], _ n: Int) -> Int {
    // Dictionary to store the cumulative sum and its index
    var mpp = [Int: Int]()
    
    // Variable to store the maximum length of subarray with sum zero
    var maxi = 0
    // Variable to store the cumulative sum
    var sum = 0
    
    // Loop through the array
    for i in 0..<n {
        // Update the cumulative sum
        sum += A[i]
        
        // If the cumulative sum is zero, update maxi to the current index + 1
        if sum == 0 {
            maxi = i + 1
        } else {
            // If the cumulative sum has been seen before
            if let prevIndex = mpp[sum] {
                // Calculate the length of the subarray and update maxi if this length is larger
                maxi = max(maxi, i - prevIndex)
            } else {
                // Store the cumulative sum with its index in the dictionary
                mpp[sum] = i
            }
        }
    }
    
    // Return the maximum length of subarray with sum zero
    return maxi
}
let array1 = [1, -1, 3, 2, -2, -3, 3]
let length = array1.count
print(maxLen(array1, length))  // Output: The maximum length of a subarray with sum zero

//Q #6 Count the number of subarrays with given xor K

func subarraysWithXorK(_ arr: [Int], _ k: Int) ->Int {
    let arrCount = arr.count //size of the given array.
    var xr = 0
    var mpp:[Int: Int] = [:]
    mpp[0] = 1 //setting the value of 0.
    var cnt = 0
    
    for i in 0..<arrCount {
        // prefix XOR till index i:
        xr = xr ^ arr[i]
        
        //By formula: x = xr^k:
        let x = xr ^ k
        
        // add the occurrence of xr^k
        // to the count:
        cnt += mpp[x, default: 0]

        // Insert the prefix xor till index i
        // into the map:
        mpp[xr] = mpp[xr, default: 0] + 1
    }
    return cnt
}

let xorArray = [5, 6, 7, 8, 9]
let kValue = 5
//print("subarraysWithXorK ---  ", subarraysWithXorK(xorArray, kValue))// 2

//Q #8 Merge Overlapping Subintervals
//https://leetcode.com/problems/merge-intervals/description/
//TC: O(N*logN) + O(N), where N = the size of the given array.
//Reason: Sorting the given array takes  O(N*logN) time complexity. Now, after that, we are just using a single loop that runs for N times. So, the time complexity will be O(N).
//SC: O(N), as we are using an answer list to store the merged intervals. Except for the answer array, we are not using any extra space.
func mergeOverlappingIntervals(_ intervals: [[Int]]) -> [[Int]] {
    
    guard !intervals.isEmpty else { return [] }
    var intervals = intervals.sorted(by: { $0[0] < $1[0] })// We are sorting the array hence we get sorted intervals
    
    var ans = [[Int]]() // Answer stored
    var start = intervals[0][0] // First object
    var end = intervals[0][0] // First object
    
    for interval in intervals {
        if end < interval[0] {
            ans.append([start, end])
            start = interval[0]
            end = interval[1]
        } else {
            end = max(end, interval[1])// Increment end till we get max
        }
    }
    
    ans.append([start, end])
    return ans
}

let arrMergeIntervals = [[1, 3], [8, 10], [2, 6], [15, 18]]
var ansMergeInterals = mergeOverlappingIntervals(arrMergeIntervals)
// print("The merged intervals are:", ansMergeInterals) // [[1, 6], [8, 10], [15, 18]]

//Q #9 Merge two Sorted Arrays Without Extra Space
// https://leetcode.com/problems/merge-sorted-array/description/
/**
 Time Complexity: O((n+m)*log(n+m)), where n and m are the sizes of the given arrays.
 Reason: The gap is ranging from n+m to 1 and every time the gap gets divided by 2. So, the time complexity of the outer loop will be O(log(n+m)). Now, for each value of the gap, the inner loop can at most run for (n+m) times. So, the time complexity of the inner loop will be O(n+m). So, the overall time complexity will be O((n+m)*log(n+m)).

 Space Complexity: O(1) as we are not using any extra space.
 */
func mergeTowSortedArrays(_ arr1: inout [Int], _ arr2: inout [Int], _ n: Int, _ m: Int) {
    
    var len = n + m
    var gap = len / 2
    
    while gap > 0 {
        var left = 0
        var right = left + gap
        
        while right < len {
            if left < n && right >= n {
                swapIfGreater(&arr1, &arr2, left, right - n)
            } else if left >= n {
                var newArr2 = arr2
                swapIfGreater(&arr2, &newArr2, left - n, right - n)
            } else {
                var newArr1 = arr1
                swapIfGreater(&arr1, &newArr1, left, right)
            }
            left += 1
            right+=1
        }
        
        if gap == 1 { break }
        
        gap = (gap / 2) + (gap % 2)

    }
    
    func swapIfGreater(_ arr1: inout [Int], _ arr2: inout [Int], _ ind1: Int, _ ind2: Int) {
        if arr1[ind1] > arr2[ind2] {
            (arr1[ind1], arr2[ind2]) = (arr2[ind2], arr1[ind1])
        }
    }
}

var arr1 = [1, 4, 8, 10]
var arr2 = [2, 3, 9]
var n = 4, m = 3

mergeTowSortedArrays(&arr1, &arr2, n, m)

//print("The merged arrays are:--", arr1, arr2)// [1, 2, 3, 4] [8, 9, 10]

//Q #10 Find the repeating and missing numbers
//https://takeuforward.org/data-structure/find-the-repeating-and-missing-numbers/
func findMissingRepeatingNumbers(_ a: [Int]) -> [Int] {
    let n = a.count // size of the array
    
    // Find Sn and S2n:
    var SN = (n * (n + 1)) / 2
    var S2N = (n * (n + 1) * (2 * n + 1)) / 6
    
    // Calculate S and S2:
    var S = 0, S2 = 0
    for i in 0..<n {
        S += a[i]
        S2 += a[i] * a[i]
    }
    
    //S-Sn = X-Y:
    var val1 = S - SN
    
    // S2-S2n = X^2-Y^2:
    var val2 = S2 - S2N
    
    //Find X+Y = (X^2-Y^2)/(X-Y):
    val2 = val2 / val1
    
    //Find X and Y: X = ((X+Y)+(X-Y))/2 and Y = X-(X-Y),
    // Here, X-Y = val1 and X+Y = val2:
    let x = (val1 + val2) / 2
    let y = x - val1
    
    return [x, y]
}

var mixArrayForMissingRepeating = [3, 1, 2, 5, 4, 6, 7, 5]
var missingAndRepeating = findMissingRepeatingNumbers(mixArrayForMissingRepeating)
//print("Misssing & repeating numbers are-->", missingAndRepeating) // [5, 8]

// Q #12 Count Inversion
//https://takeuforward.org/data-structure/count-inversions-in-an-array/
/**
 Time Complexity: O(N*logN), where N = size of the given array.
 Reason: We are not changing the merge sort algorithm except by adding a variable to it. So, the time complexity is as same as the merge sort.

 Space Complexity: O(N),
 */
func numberOfInversions(_ arr: [Int]) -> Int {
    var cnt = 0
    for i in 0..<arr.count {
        for j in i..<arr.count {
            if arr[i] > arr[j] {
                cnt+=1
            }
        }
    }
    return cnt
}

let conversionArrayInput = [5, 4, 3, 2, 1]
let conversionArrayOutput = numberOfInversions(conversionArrayInput)
//print(" The number of inversions is: ", conversionArrayOutput) // 10

//Q #13 Count reverse pairs..
//https://leetcode.com/problems/reverse-pairs/description/

func merge(_ arr: inout [Int], _ low: Int,_ mid: Int,_ high: Int) {
    var temp: [Int] = [] // temporary array
    var left = low // starting index of left half of arr
    var right = mid + 1 // starting index of right half of arr
    
    // storing elements in the temporary array in a sorted manner
    while (left <= mid && right <= high) {
        if (arr[left] <= arr[right]) {
            temp.append(arr[left])
            left+=1
        } else {
            temp.append(arr[right])
            right+=1
        }
    }
    
    // if elements on the left half are still left
    while (left <= mid) {
        temp.append(arr[left])
        left+=1
    }
    
    // if elements on the right half are still left
    while (right <= high) {
        temp.append(arr[right])
        right+=1
    }
    
    // transferring all elements from temporary to arr
    for i in low...high {
        arr[i] = temp[i - low]
    }
}

func mergeSort(_ arr: inout [Int],_ low: Int,_ high: Int) -> Int{
    var cnt = 0
    if (low >= high) {
        return cnt
    }
    let mid = ((low + high) / 2)
    cnt += mergeSort(&arr, low, mid) // left half
    cnt += mergeSort(&arr, mid + 1, high) // right half
    cnt += countPairs(arr, low, mid, high) // Modification
    merge(&arr, low, mid, high) // merging sorted halves
    return cnt
}

func countPairs(_ arr: [Int],_ low: Int,_ mid: Int, _ high: Int) ->Int {
    var right = mid + 1
    var cnt = 0
    for i in low...mid {
        while (right <= high && arr[i] > 2 * arr[right]) {
            right+=1
            
        }
        cnt += (right - (mid + 1))
    }
    return cnt
}

func team(_ skill: inout [Int]) -> Int {
    return mergeSort(&skill, 0, skill.count - 1)
}

var inputCountReversePair = [4, 1, 2, 3, 1]
let outputCountReversePair = team(&inputCountReversePair)
//print("->  The number of reverse pair is: ", outputCountReversePair)// 3

//Q #14. maxProductSubArray
//https://leetcode.com/problems/maximum-product-subarray/
func maxProductSubArray(_ arr: [Int]) ->Int {
    var prod1 = arr[0]
    var prod2 = arr[0]
    var result = arr[0]
    
    for i in 1..<arr.count {
        var temp = max(arr[i],max(prod1*arr[i], prod2*arr[i]))
        prod2 = min(arr[i], min(prod1*arr[i], prod2*arr[i]))
        prod1 = temp
        result = max(result, prod1)
    }
    
    return result
}
var inputMaxProductSubArray = [1,2,-3,0,-4,-5]
var outputMaxProductSubArray = maxProductSubArray(nums)
//print("The maximum product subarray is: ", outputMaxProductSubArray)// 4

// MARK: - TUF Problems ends...

// Question Fiund occurance of elements
// TC: O(n)
// SC: O(n)
func findOccurance(_ arr: [Int]) -> [Int:Int] {
    
    var hashObject: [Int:Int] = [:]
    for obj in arr {
        if hashObject[obj] == nil {
            hashObject[obj] = 1
        } else {
            hashObject[obj]! += 1
        }
    }
    return hashObject
}
//var anArray = [5,4,5,5,6,9,5,6]
//let hashObj = findOccurance(anArray)
//print("Hash obj---", hashObj) // [4: 1, 6: 2, 9: 1, 5: 4]

// Question diffrence between highest & lowest occurance of a number in an array..
// TC: O(n)
// SC: O(n)
func findDiffranceBetweenHighLowOccurance(_ arr: [Int]) -> Int {
    
    var hashObject: [Int:Int] = [:]
    for obj in arr {
        if hashObject[obj] == nil {
            hashObject[obj] = 1
        } else {
            hashObject[obj]! += 1
        }
    }
    
    let sortedObj = hashObject.sorted { $0.value > $1.value }
    if sortedObj.count > 1 {
       return sortedObj[0].value - sortedObj[1].value
    }
    return -1
}

var anArray = [5,4,5,5,6,9,5,6]
let diffrence = findDiffranceBetweenHighLowOccurance(anArray)
//print("diffrence", diffrence) // 2

// Question rotate array by K elements
func reverseArray(_ arr: inout [Int], startIndex:  Int, endIndex:  Int) {
    var startIndex = startIndex
    var endIndex = endIndex
    while startIndex <= endIndex {
        let temp = arr[startIndex]
        arr[startIndex] = arr[endIndex]
        arr[endIndex] = temp
        startIndex+=1
        endIndex-=1
    }
}

func shiftElementsByK(_ arr: inout [Int], k: Int, count: Int) {
    reverseArray(&arr, startIndex: 0, endIndex: k-1)  // Reverse first k elements
    reverseArray(&arr, startIndex: k, endIndex: count-1)  // Reverse last n-k elements
    reverseArray(&arr, startIndex: 0, endIndex: count-1)  // Reverse whole array
}

//var digits = [3,7,8,9,10,11]
//shiftElementsByK(&digits, k: 3, count: digits.count)
//print(digits)

// Question: Search in Sorted 2D matrix
//Problem Statement: Given an m*n 2D matrix and an integer, write a program to find if the given integer exists in the matrix.
// Approach #1 By removing row and col in each comparisons . Starting from the top right of matrix, move towards the bottom left in search of the target element
// TC O(n)
// SC O(1)
func searchMatrix1(matrix: [[Int]],  target: Int) ->Bool {
    if matrix.isEmpty {
        return false
    }
    var matrixCount = matrix.count
    let matrixRowElementsCount = matrix[0].count
    var row = 0
    var col = matrixCount - 1
    while row < matrixRowElementsCount && col >= 0 {
        if(matrix[row][col] == target) {
            return true
        } else if(matrix[row][col] < target) {
            row = row + 1
        } else {
            col = col - 1
        }
    }
    return false
}

// Approach #2 Binary Search : Considering the matrix as a single array, perform a binary search for the target.
//TC O(log(m*n)) = O(log(m) + log(n))
//SC: O(1)
func searchMatrix2(matrix: [[Int]],  target: Int) ->Bool {
    if matrix.isEmpty {
        return false
    }
    var matrixCount = matrix.count
    var matrixRowElementsCount = matrix[0].count
    var left = 0
    var right = matrixRowElementsCount * matrixCount - 1
    
    while left != right {
        let mid = (left + right - 1) / 2
        if (matrix[mid / matrixRowElementsCount][mid % matrixRowElementsCount] < target) {
            left = mid + 1
        } else {
            right = mid
        }
    }
    if (matrix[right / matrixRowElementsCount][right % matrixRowElementsCount] == target) {
        return true
    } else {
        return false
    }
}
let matrix: [[Int]] =
    [[23, 25, 35, 37],
    [40, 41, 42, 43],
    [50, 60, 74, 80]]
  
let k = 80
//print("is element present in matrix", searchMatrix2(matrix: matrix, target: k))// true

// TC: O(N)
// SC: O(N)
func replaceElements(_ arr: [Int]) -> [Int] {
    let arrayCount = arr.count
    if arrayCount == 0 {return []}
    let lastIndex = arrayCount - 1
    var nums = Array.init(repeating: -1, count: arrayCount)
    var curMax = arr[lastIndex]
    
    nums[lastIndex] = -1// As per question requirement
    
    for i in stride(from: lastIndex - 1, through: 0, by: -1) {
        let temp = curMax
        curMax = max(curMax, arr[i])
        nums[i] = temp
    }
    
    return nums
}

var arr22 = [10, 22, 12, 3, 0, 6]
let eleOp = replaceElements( arr22)
//print("eleOp array-->", eleOp)

// Question: Find longest consecutive in an array
func  longestConsecutiveArray(_ nums: [Int]) -> [Int] {
    
    var setObject = Set(nums)
    var longestArr:[Int] = []
    for i in 0..<nums.count {
        
        if !setObject.contains(nums[i] - 1) {// Find smallest element in the set
            var currentNum = nums[i]
            
            while setObject.contains(currentNum + 1) {// Based on smallest element we got find next higher number
                longestArr.append(currentNum)
                currentNum += 1
                if !setObject.contains(currentNum + 1) {
                    longestArr.append(currentNum)
                }
            }
            
        }
    }
    return longestArr
}
var consecutiveArr1 = [6,8,7,100,200]
var ansConsecutiveArr1 = longestConsecutiveArray(consecutiveArr1)
//print("The longest consecutive sequence is ", ansConsecutiveArr1)//[6, 7, 8]


// Question. 3 Sum : Find triplets that add up to a zero
// TC: O(N^3)
// SC:  O(3*k)  // k is the no.of triplets
func threeSumTrippletAddUpZero(_ nums: [Int]) -> [[Int]] {
    let sorted = nums.sorted()// First sort the array
    var result = [[Int]]()
    for index in 0 ..< sorted.count - 2 {
        let first = sorted[index]
        if index > 0, sorted[index - 1] == first {
            // Iterating through the same number. Already handled.
            continue
        }
        
        // Now we know the first number, iterating up from the beginning, down from the end
        // to find all cases of (second + third) == - first
        var lowerIndex = index + 1
        var upperIndex = sorted.count - 1
        
        /// Iterate lower bound up to change the value of `second`.
        /// Increases the sum
        func nextLower() {
            let current = sorted[lowerIndex]
            repeat {
                lowerIndex += 1
            } while lowerIndex < upperIndex && sorted[lowerIndex] == current
        }
        
        /// Iterate upper bound down to change the value of `third`.
        /// Decreases the sum
        func nextUpper() {
            let current = sorted[upperIndex]
            repeat {
                upperIndex -= 1
            } while lowerIndex < upperIndex && sorted[upperIndex] == current
        }
        
        while lowerIndex < upperIndex {
            let second = sorted[lowerIndex]
            let third = sorted[upperIndex]
            
            switch (first + second + third) {
                case 0:
                    result.append([first, second, third])
                    nextLower()
                    nextUpper()
                case ..<0:
                    // We need to increase the sum
                    nextLower()
                case 1...:
                    // We need to decrease the sum
                    nextUpper()
                default: fatalError()
            }
        }
    }
    return result
}

let sumTrippletInput = [-1,0,1,2,-1,-4,-2,-3,3,0,4]

let opSumTripplet = threeSumTrippletAddUpZero(sumTrippletInput)
// print("Output==> ", opSumTripplet) // [[-1, 0, 1], [-1, -1, 2]]


// Question: Length of the longest subarray with zero Sum
// TC: O(N)
// SC: O(N)
func longestArrayWithNSum(arr: [Int]) -> Int {
    
    var mpp: [Int:Int] = [:] // Create an dictionary
    var maxi = 0 // longest Subarray found
    var sum = 0 // sum of elements
    
    for i in 0..<arr.count {
        sum += arr[i]
        if (sum == 0) {
            maxi = i + 1
        } else {
            if mpp[sum] != nil {
                maxi = max(maxi, i - mpp[sum]!)
            } else {
                mpp[sum] = i
            }
        }
    }
    return maxi
}

let inputLongestSubArray = [10, -3, 3, -1, 6, -5]
let outputLongestSubArray = longestArrayWithNSum(arr: inputLongestSubArray)
//print("outputLongestSubArray-->", outputLongestSubArray) // 5 which is 10, -3, 3, -1, 6


func lengthOfLongestSubstring(_ s: String) -> Int {
    var longest = 0, startIndex = 0
    var charMap: [Character: Int] = [:]
    for (index, char) in s.enumerated() {
        if let foundIndex = charMap[char] {
            startIndex = max(foundIndex + 1, startIndex)
        }
        longest = max(longest, index - startIndex + 1)
        charMap[char] = index
    }
    return longest
}

let longestSubStrInput = "abcabxy"
let outputOfLongest = lengthOfLongestSubstring(longestSubStrInput)
//print(" output of longest substring without repeating chars", outputOfLongest) // OP->5

// Question: lastNonZeroIndex

//Input: nums = [0,1,0,3,12]
//Output: [1,3,12,0,0]
// TC: O(n)
// SC O(1)
func moveZeroes(_ nums: inout [Int]) {
    var lastNonZeroIndex = 0
    for i in 0..<nums.count where nums[i] != 0 {
         nums.swapAt(i, lastNonZeroIndex)
        lastNonZeroIndex += 1
    }
}
var withZerosArrInput = [1,1,0,3,12]
moveZeroes(&withZerosArrInput)
//print("moveZeroes----- ", withZerosArrInput) // [1, 1, 3, 12, 0]

// Question : sumOfMultiples
func sumOfMultiples(_ n: Int) -> Int {
  func sumOfDivisible(_ value: Int)-> Int {
   var low = value
   var high = n / value * value
   var count = high  / value
   let op = (low + high) * count / 2
   // print("this op is=== ", low, high, count, op)
    return op
 }
return sumOfDivisible(3) + sumOfDivisible(5) + sumOfDivisible(7) -
    (sumOfDivisible(15) + sumOfDivisible(35) + sumOfDivisible(21)) +
    sumOfDivisible(105)
}
var opOfMultiply = sumOfMultiples(15)
//print("opOfMultiply is--->", opOfMultiply) // 81

func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
    var start = start, end = end
    while start < end {
        nums.swapAt(start, end)
        start+=1
        end-=1
    }
}

var arrRotateInput = [1,2,3,4,5]
rotate(&arrRotateInput, 2)
//print("output is-- ", arrRotateInput)//[4, 5, 1, 2, 3]

//Question : Remove element occurance
//Input: nums = [0,1,2,2,3,0,4,2], val = 2
//Output: 5, nums = [0,1,4,0,3,_,_,_]
// TC: O(n)
// SC: O(1)
func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var count = 0
    for i in 0..<nums.count where nums[i] != val {
        nums[count] = nums[i]
        count+=1
    }
    return count
}
var arrOcc = [0,1,2,2,3,0,4,2]
removeElement(&arrOcc, 2)
//print("Output after removal --", arrOcc)//[0, 1, 3, 0, 4, 0, 4, 2]

// Question: Integer to Roman.
func intToRoman(_ num: Int) -> String {
    
    var m = ["", "M", "MM", "MMM"]
    var c = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
    var x = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
    var i = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
    
    return m[num/1000] + c[(num%1000)/100] + x[(num%100)/10] + i[num%10]
}

var inputForRoman = 100
var opRoman = intToRoman(inputForRoman)
print("Output for Roman----> ", opRoman)
