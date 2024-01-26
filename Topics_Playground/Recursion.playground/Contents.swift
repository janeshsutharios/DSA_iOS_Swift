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
//print("isPalindrom-->", isPalidrom)

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

//print(myAtoi("123"))

func myAtoi2(_ s: String) -> Int {
    var output = 0
    var startIndex = 0
    var sign:Int = 1
    var isStarted = false
    return atoiRecursion(s, &startIndex, &output, s.count, &sign, &isStarted)
}
func atoiRecursion(_ s: String,
                   _ strIndex: inout Int,
                   _ result: inout Int,
                   _ strCount: Int,
                   _ sign: inout Int,
                   _ isStarted: inout Bool) -> Int {
    
    if strIndex == strCount { return result*sign }
    let curChar = s[s.index(s.startIndex, offsetBy: strIndex)]
    if curChar == " " {
        if isStarted { return result*sign }
    } else if (curChar == "-" || curChar == "+") {
        if isStarted { return result*sign }
        isStarted = true
        if curChar == "-" {
            sign = -1
        }
    } else if curChar >= "0" && curChar <= "9" {
        isStarted = true
        if let val = curChar.wholeNumberValue {
            result = result*10+val
        }
        if result > Int32.max {
            return sign == 1 ? Int(Int32.max) : Int(Int32.min)
        }
    } else {
        return result*sign
    }
    strIndex+=1
    return atoiRecursion(s, &strIndex, &result, strCount, &sign, &isStarted)
}


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
//print(reverse(123))




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
//print(findMaxSubArray(arr: [9,1,3,2,6,1,5,9], k: 4))


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
//print(lengthOfLongestSubstring("abcabcbb"))


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
//print("merged-->", result1.debugDescription)

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

// Stack Definition Starts

public struct Stack<Element> {
    
    private var storage: [Element] = []
    
    public init() { }
}

extension Stack: CustomDebugStringConvertible {
    
    public var debugDescription: String {
    """
    ----top----
    \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
    -----------
    """
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    public func peek() -> Element? {
        storage.last
    }
    
    public var isEmpty: Bool {
        peek() == nil
    }
    
}

// Stack Defination Ends
// Swift program to sort a Stack using recursion
// Note that here predefined Stack class is used  for stack operation

// Recursive Method to insert an item x in sorted way
func sortedInsert(_ s: inout Stack<Int>, _ item: Int) {
    // Base case: Either stack is empty or newly inserted item is greater than top (more than all existing)
    if s.isEmpty || item > s.peek()! {
       // print("Peek & item is ----------- ",s.peek(), item)
        s.push(item)
        return
    }
    // If top is greater, remove the top item and recur
    let temp = s.pop()
    //print(" Insert Poped Item in stack---- ",temp!)
    sortedInsert(&s, item);
   // print("Recursion Call Now Add back temp------- ",temp!)
    // Put back the top item removed earlier
    s.push(temp!)
}

// Method to sort stack
func sortStack(_ s: inout Stack<Int>) {
    // Base case If stack is empty return
    if s.isEmpty { return }
    // Remove the top item
    let topItem = s.pop()
    // Sort remaining stack
    sortStack(&s)
    // Push the top item back in sorted stack
    sortedInsert(&s, topItem!)
}

var stackInput = Stack<Int>()
stackInput.push(-3)
stackInput.push(30)
stackInput.push(-5)
//stackInput.push(18)
stackInput.push(14)
//print("Input---->", stackInput)
/**
 Input----> ----top----
 14
 -5
 30
 -3
 */
sortStack(&stackInput);
//print("Output--->", stackInput)
/**
 Output---> ----top----
 30
 14
 -3
 -5
 -----------
 */

// Swift code to reverse a stack using recursion

func reverseStackUsingRecursion(_ st: inout Stack<Int>) {
    if !st.isEmpty {
        // Hold all items in Function Call Stack until we reach end of the stack
        var peekElement = st.peek()
        st.pop()
        reverseStackUsingRecursion(&st)
        // Insert all the items held in Function Call Stack one by one from the bottom
        // to top. Every item is inserted at the bottom insert_at_bottom(x);
        //print("peekElement-- >", peekElement) // 1 2 3 4
        insertAtBottom(&st, peekElement!)
    }
}

func insertAtBottom(_ st: inout Stack<Int>, _ item: Int) {
    if st.isEmpty {
        st.push(item)
    } else {
        // All items are held in Function Call Stack until we reach end of the stack. When the stack becomes
        // empty, the above if part is executed and the item is inserted at the bottom
        let a = st.peek()!
        st.pop()
        insertAtBottom(&st, item)
        // push all the items held in Function Call Stack once the item is inserted at the bottom
        st.push(a)
    }
}

var stackInput2 = Stack<Int>()
stackInput2.push(1)
stackInput2.push(2)
stackInput2.push(3)
stackInput2.push(4)
//print("Input---->", stackInput2)// 4 3 2 1
reverseStackUsingRecursion(&stackInput2)
//print("Output---->", stackInput2) // 1 2 3 4


// Function to generate all binary strings
func generateAllBinaryStrings(_ n: Int, _ arr: inout [Int], _ i: Int) {
    if i == n {
        //print("Exit: Binary arr-------------------------------->", arr)
        return
    }
   // print("** First Recursion Here>", i, "_ array", arr)
    // First assign "0" at ith position and try for all other permutations  for remaining positions
    arr[i] = 0
    generateAllBinaryStrings(n, &arr, i + 1)
    // And then assign "1" at ith position  and try for all other permutations for remaining positions
    arr[i] = 1
    //print("-- Second Recursion Here>", i, "_ array", arr)
    generateAllBinaryStrings(n, &arr, i + 1)
}

var lengthOfBinary = 2
var binArry:[Int] = Array.init(repeating: 0, count: lengthOfBinary)
generateAllBinaryStrings(lengthOfBinary, &binArry, 0)

/** Output   ----->
 Binary arr---    [0, 0]
 Binary arr---    [0, 1]
 Binary arr---    [1, 0]
 Binary arr---    [1, 1]
 */
// Question: Generate parathesis.

func generateParenthesis(_ n: Int) -> [String] {
    var result = [String]()
    backtrack("", 0, 0, n, &result)
    return result
}

func backtrack(_ current: String,_ open: Int,_ end: Int,_ max: Int, _ result: inout [String]) {
    if current.count == max * 2 {// Because if n = 2; max parenthesis count is (()) which is n X 2
        result.append(current)
        print("Brackets match ------ ", current)
        return
    }
    
    if open < max {// Example: (( < 2 -- False So don't add open braces
        print("open < max -- Open Bracket-- ", open+1, end, current + "(")
        backtrack(current + "(", open + 1, end, max, &result)
    }
    print("   ")
    if end < open {
        print("end < open -- Open Bracket-- ", open+1, end, current + ")")
        backtrack(current + ")", open, end + 1, max, &result)
    }
}
// Using Clousers
func generateParenthesis2(_ n: Int) -> [String] {
    var result = [String]()
    backtrackParanth2("", 0, 0, n) {
        print("Brackets ------ ", $0)
        result.append($0)
    }
    return result
}

func backtrackParanth2(_ current: String,_ open: Int,_ end: Int,_ max: Int, _ result: (String)->Void) {
    if current.count == max * 2 {
        result(current)
        return
    }

    if open < max {
        print("open < max -- Open Bracket-- ", open+1, end, current + "(")
        backtrackParanth2(current + "(", open + 1, end, max, result)
    }
    print("   ")
    if end < open {
        print("end < open -- Open Bracket-- ", open+1, end, current + ")")
        backtrackParanth2(current + ")", open, end + 1, max, result)
    }
}
//let generateParath = generateParenthesis(2)
//print("parathesis---  ", generateParath)// Ip::1 -> () Ip::2->()() (()) Ip::3-> ((()))", "(()())", "(())()", "()(())", "()()()


// Question: Find all subsequence whose sum is K
func subSequenceSum(ans: inout [[Int]], a: [Int], temp: inout[Int], k: Int, start: Int) {
    
    // Here we have used ArrayList
    // of ArrayList in Java for
    // implementation of Jagged Array

    // If k < 0 then the sum of
    // the current subsequence
    // in temp is greater than K
    if (start > a.count || k < 0) {
        return;
    }

    // If (k==0) means that the sum
    // of this subsequence
    // is equal to K
    if (k == 0) {
        ans.append(temp);
        return;
    } else {
        for i in start..<a.count {
            
            // Adding a new
            // element into temp
            temp.append(a[i]);

            // After selecting an
            // element from the
            // array we subtract K
            // by that value
            subSequenceSum(ans: &ans, a: a,
                           temp: &temp, k: k - a[i], start: i + 1);

            // Remove the lastly
            // added element
            temp.remove(at:temp.count - 1);
        }
    }
}
var arr = [ 5, 12, 3, 17, 1, 18, 15, 3, 17 ]
var k = 6;
var temp: [Int] = []
var arrOfArr:[[Int]] = []
subSequenceSum(ans: &arrOfArr, a: arr, temp: &temp, k: k, start: 0)
// print("output array whose sum is equal K--->", arrOfArr)//[[5, 1], [3, 3]]


// MARK: - Question: Given an integer array nums of unique elements, return all possible subsets (the power set).
//Input: nums = [1,2,3]
//Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

// eg: [1, 2, 3]; assume it is like a tree (inorder traversal)
//                     []
//              /       \       \
//            [1]       [2]    [3]
//           /   \       |
//       [1, 2]  [1, 3] [2, 3]
//         /
//     [1, 2, 3]

// output: [[], [1], [1, 2], [1, 2, 3], [1, 3], [2], [2, 3], [3]]

// Method 2 using Bitwise approach:--
// TC: (2^n X n) FirstLoop X Second Loop
// SC: O(n)// for saving output

func generateAllSequence(input: String) -> [String]{
    var n = input.count
    var output:[String] = []
    
    for num in 0..<(1 << n) {
        var sub = "";
        for i in 0..<n {
            if (num & (1 << i)) != 0 {//check if the ith bit is set or not ==> 1 << i is equal to 2 power n(2^n = 8)
               let index =  input.index(input.startIndex, offsetBy: i)
                sub += String(input[index])
            }
        }
        if !sub.isEmpty {
            output.append(sub);
        }
    }
    return output;
}

let subSet = generateAllSequence(input: "abc")
//print("generateAllSequence using BitOperator--->", subSet)


// Question: Given a list arr of N integers, print sums of all subsets in it.

// Question Link: https://practice.geeksforgeeks.org/problems/subset-sums2234/1
/**
 Input:
 N = 2
 arr[] = {2, 3}
 Output:
 0 2 3 5
 Explanation:
 When no elements is taken then Sum = 0.
 When only 2 is taken then Sum = 2.
 When only 3 is taken then Sum = 3.
 When element 2 and 3 are taken then
 Sum = 2+3 = 5.
 */
func sumSubSet(ind: Int, sum: Int, op: inout [Int], inArray: [Int],n: Int) {
    if ind == n {
        op.append(sum)
        return
    }
    // Pick An Element
    sumSubSet(ind: ind+1, sum: sum+inArray[ind], op: &op, inArray: inArray, n: n)
    // Not Pick An Element
    sumSubSet(ind: ind+1, sum: sum, op: &op, inArray: inArray, n: n)
}
let inArray = [2,3]
var opSubSet: [Int] = []
let nInt = 2
sumSubSet(ind: 0, sum: 0, op: &opSubSet, inArray: inArray, n: nInt)
//print("opSubSet-->", opSubSet)


// Question Find Subset
// example: [1, 2, 3]; assume it's like a tree, we need to find out all childs
//                           [ ]
//              /             |                \
//            [1]            [2]               [3]
//           /   \          /   \             /   \
//       [1,2]  [1,3]     [2,1]  [2,3]      [3,1]  [3,2]
//         /       \       /        \        /       \
//     [1,2,3]  [1,3,2]  [2,1,3]  [2,3,1]  [3,1,2]  [3,2,1]

// output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

// ex: [1, 2, 2]; assume it is like a tree(inorder traversal), "*" indicates duplicated case
//                           [ ]
//              /             |           \
//            [1]            [2]         [*2]
//           /   \            |
//       [1, 2] [1, *2]     [2, 2]
//         /
//     [1, 2, 2]

// output: [[], [1], [1, 2], [1, 2, 2], [2], [2, 2]]

// Approach#1: Using Loop ---

// Link: -
// https://leetcode.com/problems/subsets/ // Dups

// https://leetcode.com/problems/subsets-ii// No dups.

func subsetsWithDup1(_ nums: [Int]) -> [[Int]] {
    var output: Set<[Int]> = []
    var comb: [Int] = []
   // uniqueSubSet1(&output, &comb, nums) // Iterative.
     uniqueSubSet2(&output, &comb, nums)// Recursive.
    return Array(output)
}

// Approch 1: Using Loop
private func uniqueSubSet1(_ output: inout Set<[Int]>, _ comb: inout [Int], _ nums: [Int], _ index: Int = 0) {
    output.insert(comb)
    // try to find if it has "children", if no "child", we done
    for i in index..<nums.count {
        if i > 0 && nums[i] == nums[i - 1] && i != index { continue }// Avoid Dup
        comb.append(nums[i]) // update candidates to next level's value(child's value)
        uniqueSubSet1(&output, &comb, nums, i + 1)  // startIndex + 1, go next level(go to its child)
        comb.removeLast() // update candidates to previous level's value(parent's value)
    }
}

// Approch 2: Using Recursion
private func uniqueSubSet2(_ output: inout Set<[Int]>, _ comb: inout [Int], _ nums: [Int], _ index: Int = 0) {
    if index >= nums.count {
        output.insert(comb)
    } else {
        uniqueSubSet2(&output, &comb, nums, index+1)
        comb.append(nums[index])
        
        uniqueSubSet2(&output, &comb, nums, index+1)
        comb.removeLast()
    }
}
// try [1,2,2] to check duplicates entries.
print("subsetsWithNo Dup1--->", subsetsWithDup1([1,2,3])) //<--> [[], [1], [1, 2], [1, 2, 3], [1, 3], [2], [2, 3], [3]]


