import Foundation


// Question:#1 Count numbers of digits
let countValue = Int(log10(12345.0))+1
// print ("count the number of digits = ", countValue)

// Question:#2  - Print numbers from 1 to N

func printNumersFromOneToN(_ n: Int) {
    if n < 1 { return }
    printNumersFromOneToN(n-1)
    print(n, terminator: " ")
}

//printNumersFromOneToN(5)

// Question:#3  - Print numbers from 1 to N

func printNumersFromNtoOne(_ n: Int) {
     if n < 1 { return }
    print(n, terminator: " ")
    printNumersFromNtoOne(n-1)
}

//printNumersFromNtoOne(5)

// Question #4 Sum of first n numbers

var sumValue = 0
func sumOfFirstNNumbers(_ n: Int) -> Int {
    if n < 1 { return sumValue }
    sumValue += n
    return sumOfFirstNNumbers(n-1)
}
let op = sumOfFirstNNumbers(5)
// print("op", op)// 15



// Check for palindrome String
// Approach #1
func checkPalindrom(_ str: inout String) -> Bool {
  if str.count < 2 {
    return true
  } else {
    if str.removeFirst() != str.removeLast() {
      return false
    } else {
        return checkPalindrom(&str)
    }
  }
}
var inputStr = "nitin"
let isPalidrom = checkPalindrom(&inputStr)
print("isPalindrom-->", isPalidrom)

// Approach #2

func checkPalindrome<T: StringProtocol>(_ str: T) -> Bool {
    if str.count < 2 {
        return true
    } else {
        if str.first == str.last {
            let start = str.index(str.startIndex,offsetBy: 1)
            let end = str.index(str.endIndex,offsetBy: -1)
            return checkPalindrome(str[start..<end])
        } else {
            return false
        }
    }
}
checkPalindrom(&inputStr)

// Approach #3: Non recursive
extension StringProtocol {
  subscript(_ offset: Int) -> Element {
      self[index(startIndex, offsetBy: offset)]
  }
}

func isPalindrome(_ word: String) -> Bool {
    let word = word.filter{ $0 != " " }
    for (i, character) in word.enumerated() {
        if character != word[word.count-i-1] {
            return false
        }
    }
    return true
}
isPalindrome("nitin")

// Approach #4 Non recursive

func isPalindrome4(_ word: String) -> Bool {
    let word = word.filter{ $0 != " " }
    for (i, character) in word.enumerated() {
        let lastChar = word.index(word.startIndex, offsetBy: word.count-i-1)
        if character != word[lastChar] {
            return false
        }
    }
    return true
}
isPalindrome4("nitin")


    let plus = "+".utf8.first!
    let minus = "-".utf8.first!
    let whitespace = " ".utf8.first!
    
    // this is (Int32.max / 10) + 7 (for rounding issues)
    let maxIntegerComponent = 214748371
    
func myAtoi(_ str: String) -> Int {
    var total = 0;
    var addedValidElement = false;
    var negative = false;
    
    for char in str.utf8 {
        if (char > 47 && char < 58) {
            let num = Int(char) - 48;
            
            // check for overflow
            // even though Int will be 64bit, and we
            // could avoid checking until the end,
            // this code will also guard against 64bit overflow
            if (!negative && total > maxIntegerComponent - num) {
                return 2147483647
            } else if (negative && total > maxIntegerComponent - num + 1) {
                return -2147483648
            }
            
            total *= 10
            total += num
            addedValidElement = true;
        } else if (!addedValidElement && char == minus) {
            negative = true;
            addedValidElement = true;
        } else if (!addedValidElement && char == plus) {
            addedValidElement = true
        } else if (char != whitespace || addedValidElement) {
            break;
        }
    }
    
    return negative ? 0 - total : total;
}

print(myAtoi("123"))


// Reverse integer

func reverse(_ x: Int) -> Int {
    var r = 0, x = x
    while x != 0 {
        r = r * 10
        r = r + (x % 10)
        x = x/10
    }
    return r < Int32.min || r > Int32.max ? 0 : r
}
print(reverse(123))




// Question = Find maximum (or minimum) sum of a subarray of size k

func findMaxSubArray(arr: [Int], k: Int) ->Int {
    let size = arr.count
    if k > size { return -1 }
    var maxSum = 0
    for i in 0..<k {
        maxSum += arr[i]
    }
    var thisSum = maxSum
    for i in k..<size {
        thisSum += arr[i] - arr[i-k]
        maxSum = max(maxSum, thisSum)// Add the difrence value from last to first
    }
    return maxSum
    
}
print(findMaxSubArray(arr: [9,1,3,2,6,1,5,9], k: 4))


//print("arr[\(i)] - arr[\(i-k)]", arr[i] - arr[i-k], "this sum-----> ", thisSum)

func lengthOfLongestSubstring(_ s: String) -> Int {
    var longest = 0, startIndex = 0
    var charMap: [Character: Int] = [:]
    
    for (index, char) in s.enumerated() {
        if let foundIndex = charMap[char] {
            //print(" \(char)   foundIndex+1  startIndex", foundIndex+1, startIndex)
            startIndex = max(foundIndex+1, startIndex)
        }
        longest = max(longest, index - startIndex + 1)
        print("char  startindex   longest-->",char, startIndex, longest)
        charMap[char] = index
    }
    print(charMap)
    return longest
}
print(lengthOfLongestSubstring("abcabcbb"))


// Question: --
// Link List



//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
extension ListNode: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(val)"
        }
        return "\(val) -> " + String(describing: next) + " "
    }
}

private var reminderVal = 0
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil && l2 == nil && reminderVal == 0 { return nil }
    let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + reminderVal
    reminderVal = sum / 10 // ex 10/10 = 1 so add it two next iteration.
    print("numerator-->", sum % 10, sum)
    return .init(sum % 10, addTwoNumbers(l1?.next, l2?.next))
}
let l1 = ListNode(2, ListNode(4, ListNode(3)))
let l2 = ListNode(9, ListNode(6, ListNode(4)))
let l3 = ListNode(1)
//l3.next = Li

//let result = addTwoNumbers(l1, l2)

//print(result.debugDescription)
///
///
///
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil || l2 == nil { return l1 == nil ? l2 : l1 }
    if l1!.val <= l2!.val {
        l1?.next = mergeTwoLists(l1?.next, l2)
        return l1
    } else {
        l2?.next = mergeTwoLists(l1, l2?.next)
        return l2
    }
}
let result1 = mergeTwoLists(l1, l2)
print("merged-->", result1.debugDescription)


class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        guard nums.count != 0 else { return [] }

        var result = [[Int]]()
        var candidates = [Int]()

        permutations(nums, &candidates, &result)
        return result
    }

    private func permutations(_ nums: [Int], _ candidates: inout [Int], _ result: inout [[Int]]) {
        guard candidates.count < nums.count else {
            result.append(candidates)
            return
        }

        for num in nums where !candidates.contains(num) {
            candidates.append(num)
            permutations(nums, &candidates, &result)
            candidates.removeLast()
        }
    }
}

// example: [1, 2, 3]; assume it's like a tree, we need to find out all childs
//                           [ ]
//              /             |                \
//            [1]            [2]               [3]
//           /   \          /   \             /   \
//       [1,2]  [1,3]     [2,1]  [2,3]      [3,1]  [3,2]
//         /       \       /        \        /       \
//     [1,2,3]  [1,3,2]  [2,1,3]  [2,3,1]  [3,1,2]  [3,2,1]

// output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]




//class Solution {
//    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
//      guard nums.count > 0 else { return [] }
//
//        var output = [[Int]]()
//        var candidates = [Int]()
//        let startIndex = 0
//        let sorted = nums.sorted()
//
//        uniqueSet(&output, &candidates, startIndex, sorted)
//        return output
//    }
//
//    // This is kind of simillar to the "inorder traversal"
//    private func uniqueSet(_ output: inout [[Int]], _ candidates: inout [Int], _ startIndex: Int, _ nums: [Int]) {
//        //Entering valid values store each case("node")'s value
//        output.append(candidates)
//
//        // try to find if it has "children", if no "child", we done
//        for i in startIndex..<nums.count {
//            // filter out cases which may cause duplicate subsets
//            guard i == startIndex || nums[i] != nums[i - 1] else { continue }
//
//            // update candidates to next level's value(child's value)
//            candidates.append(nums[i])
//
//            // startIndex + 1, go next level(go to its child)
//            uniqueSet(&output, &candidates, i+1, nums)
//
//            // update candidates to previous level's value(parent's value)
//            candidates.removeLast()
//        }
//    }
//}
// ex: [1, 2, 2]; assume it is like a tree(inorder traversal), "*" indicates duplicated case
//                     []
//              /       \       \
//            [1]       [2]    [*2]
//           /   \       |
//       [1, 2] [1, *2] [2, 2]
//         /
//     [1, 2, 2]

// output: [[], [1], [1, 2], [1, 2, 2], [2], [2, 2]]


//func sumSubSet(ind: Int, sum: Int, op: inout [Int], inArray: [Int],n: Int) {
//    if ind == n {
//        op.append(sum)
//        return
//    }
//    // Pick An Element
//    sumSubSet(ind: ind+1, sum: sum+inArray[ind], op: &op, inArray: inArray, n: n)
//    // Not Pick An Element
//    sumSubSet(ind: ind+1, sum: sum, op: &op, inArray: inArray, n: n)
//}
//
//
////Input: candidates = , target = 8
//let inArray = [2,3]
//var op: [Int] = []
//let n = 2
//sumSubSet(ind: 0, sum: 0, op: &op, inArray: inArray, n: n)
//print(op.sorted())

//class Solution {
//   func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
//        var output = [[Int]](), op: [Int] = []
//       uniqueSubSet(&output, &op, nums.sorted(by: <))
//        return output
//    }
//    private func uniqueSubSet(_ output: inout [[Int]], _ op: inout [Int], _ nums: [Int], _ index: Int = 0) {
//        output.append(op)
//        for i in index..<nums.count {
//            if i > 0 && nums[i] == nums[i - 1] && i != index { continue }
//            op.append(nums[i])
//            uniqueSubSet(&output, &op, nums, i + 1)
//            op.removeLast()
//        }
//    }
//}
//
//print(Solution().subsetsWithDup([1,2,2]))
//
//



