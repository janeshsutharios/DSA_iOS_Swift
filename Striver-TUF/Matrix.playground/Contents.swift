import UIKit

var greeting = "Hello, playground"
// Print matrix in spiral order





let twoDArray = [
    [1, 2, 3, 4],
    [12, 13, 14, 5],
    [11, 16, 15, 6],
    [10, 9, 8, 7]
       ]

var startRow = 0
var startCol = 0
var endRow = twoDArray.count - 1
var endCol = twoDArray[0].count - 1


func spiralTraverse(twoDArray: [[Int]]) -> [Int] {
    guard twoDArray.count != 0 else { return [] }
    
    var result = [Int]()
    var startRow = 0
    var endRow = twoDArray.count - 1
    var startCol = 0
    var endCol = twoDArray[0].count - 1
    
    while startRow <= endRow, startCol <= endCol {
        for col in stride(from: startCol, through: endCol, by: 1) {
            result.append(twoDArray[startRow][col])
        }
        
        for row in stride(from: startRow + 1, through: endRow, by: 1) {
            result.append(twoDArray[row][endCol])
        }
        
        for col in stride(from: endCol - 1, through: startCol, by: -1) {
            if startRow == endRow {
                break
            }
            result.append(twoDArray[endRow][col])
        }
        
        for row in stride(from: endRow - 1, through: startRow + 1, by: -1) {
            if startCol == endCol {
                break
            }
            result.append(twoDArray[row][startCol])
        }
        
        startRow += 1
        endRow -= 1
        startCol += 1
        endCol -= 1
    }
    return result
}
print("data--", spiralTraverse(twoDArray: twoDArray))



func checkParentheses(s: String) -> Bool {
    let pairs: [Character: Character] = ["(": ")", "[": "]", "{": "}"]
    var stack: [Character] = []
    for char in s {
        if let match = pairs[char] {
            stack.append(match)
        } else if stack.last == char {
            stack.popLast()
        } else {
            return false
        }
    }
    return stack.isEmpty
}

print(checkParentheses(s: "((({[]})))")) // True (Balanced)
print(checkParentheses(s: "((({[]}))")) // False (Not Balanced)
print(checkParentheses(s: "(])[")) // False (Not Balanced)




/** Reverse Array in swift ---*/
func reverseArray(inputArr:[Int]) -> [Int] {
    var outputArray :[Int] = inputArr
    
    for iObject in 0..<inputArr.count / 2 {
        outputArray.swapAt(iObject, inputArr.count - iObject - 1 )
    }
    return outputArray
}

print("reverseArray-->", reverseArray(inputArr: [1,2,3,4,5]))


var names:[String] = ["Apple", "Microsoft", "Lenovo", "Asus"]
let count = names.count
print("count-->", count/2)
for i in 0..<count/2 {
   (names[i],names[count - i - 1])  = (names[count - i - 1],names[i])
    
   // ["Apple", "Asus"] = ["Asus", "Apple"]
}

print("names", names)
/**                                                 */


// Check Anagram of string..
func checkAnagramOfString(arrayOne:String) -> Bool {
    
    let firstArray = Array(arrayOne)
    let countOfObject = firstArray.count
    var counterOfAnagram = 0
    
    for iObject in 0..<(countOfObject/2) {
        
        if firstArray[iObject] == firstArray[countOfObject - iObject - 1] {
            counterOfAnagram += 1
          
        }
    }
    if (countOfObject/2) == counterOfAnagram {
        return true
    }
    return false
}

print("o/p--->", checkAnagramOfString(arrayOne: "JaneshhsenaJ"))


// Convert roman to integer

private let dict: [Character:Int] = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]
  
  func romanToInt(_ s: String) -> Int {
      var prev = 0, out = 0
      for i in s {
          let val = dict[i] ?? 0
          let calculation = (val <= prev) ? prev : -prev
          print("calculation-->", calculation)
          out += calculation
          prev = val
      }
      out += prev
      return out
  }

print("Roman to int-->", romanToInt("MCMXCIV"))//    // M = 1000, CM = 900, XC = 90 and IV = 4

//MCMXCIV 1994

// Find max elements in array

var numRay = [ 1, 4, 3, 2, 4];
var arr_size = numRay.count;
//Add array size to modulo division of the
// count the frequency
for  i in 0..<arr_size {
    numRay[numRay[i] % arr_size] += arr_size;
    
    print("object-->", numRay[numRay[i] % arr_size])
}

for  i in 0..<arr_size {
    if (numRay[i] >= arr_size * 2) {
        print("dups  are--->", i)
    }
}


/**         Find two sum with index                    */
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var dict = [Int:Int]();
    for index in 0 ..< nums.count {
        let complement = target - nums[index];
        print("complement  are--->", complement, "& dict is --->", dict, "& index-->", index)


        if dict.keys.contains(complement) && dict[complement] != index {
            return [dict[complement]!, index];
        }
        dict[nums[index]] = index
        
    }
    
    return [];
}

let resultTwoSum = twoSum([1,2,3,4,5,6,7,8], 8)
print("result sum is-->", resultTwoSum)

/** Calculate profit from index */
func maxProfit(_ prices: [Int]) -> Int {
    if prices.isEmpty {
        return 0
    }
    
    var buyPrice = prices[0]
    var profit = 0
    
    for price in prices {
        if price < buyPrice {
            buyPrice = price
        } else if (price - buyPrice) > profit {
            profit = price - buyPrice
        }
    }
    
    return profit
}
let maxProfitIs = maxProfit([100,90,120,130,101])
print("maxProfit---> ", maxProfitIs)


/**     Check for duplicates..    */
func containsDuplicate(_ nums: [Int]) -> Bool {
    // //Solution 1: using Set
    //  return Set(nums).count != nums.count
    
    //Solution 2: using Hashmap
    var hashMap: [Int:Int] = [:]
    for element in nums {
        print("hashhh->", hashMap)
        if let _ = hashMap[element] {
            return true
        } else {
            hashMap[element] = 0
        }
    }
    return false
}


let isdup = containsDuplicate([1,2,3])
print("isdup---> ", isdup)
/**Find max set of sub array **/
// Compare with adjacent value if you found max only then append it..
func maxSubArray(_ nums: [Int]) -> Int {
    if nums.isEmpty {
        return Int.min
    }
    var maxValue = nums[0]
    var preMax = nums[0]
    for i in 1..<nums.count {
        let value = nums[i]
        let curMax = max(preMax + value, value)
        maxValue = max(maxValue, curMax)
        preMax = curMax
        print("maxxx->  ",maxValue)
    }
    return maxValue
}

let maxSubArrayIs = maxSubArray([-1, 1,2,3,4,-1, 1,-1,-1])
print("maxSubArray---> ", maxSubArrayIs)
/**Valid palinrom **/

func isPalindrome(_ s: String) -> Bool {
    if(s.isEmpty || s.count == 1){return true}
    
    var input = s
    let unsafeChars = CharacterSet.alphanumerics.inverted
    
    input  = input.components(separatedBy: unsafeChars).joined(separator: "").lowercased()
    let inputArray = Array(input)
    var i = 0
    var j = inputArray.count - 1
    while (i < j) {
        if(inputArray[i] != inputArray[j]) {
            return false
        }
        i += 1
        j -= 1
    }
    return true
}
let palindrom = isPalindrome("A man, a plan, a canal: Panama")
print("palindrom---> ", palindrom)

