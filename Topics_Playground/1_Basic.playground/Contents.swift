import Foundation
// This sheet contains questions with https://takeuforward.org/strivers-a2z-dsa-course/strivers-a2z-dsa-course-sheet-2/
//Q: #1 How to count number of digits ?
/*
The good approach will be to use log10 Time complexity O(1) Space complexity O(1) . The number of digits in an integer = the upper bound of log10(n).
Example: log10(12345.0)) = > 4.091491094267951 so we have to use 4+1
*/
// https://janeshswift.com/ios/dsa/how-to-count-number-of-digits/
// Read more about Logarithm here https://janeshswift.com/ios/dsa/math/logarithms-explained/
print ("count the number of digits = ", Int(log10(12345.0))+1)// prints 5


//Q #2: Reverse Integer x = 123 output = 321
// https://leetcode.com/problems/reverse-integer/description/
// https://janeshswift.com/ios/dsa/how-to-reverse-an-integer/
// https://janeshswift.com/?s=reverse
func reverse(_ x: Int) -> Int {
    var r = 0, x = x
    while x != 0 {
        r = r * 10
        r = r + (x % 10)
        x /= 10
    }
    return r < Int32.min || r > Int32.max ? 0 : r
}

//Q #3: Check palindrome number  example 121 & 121
// https://leetcode.com/problems/palindrome-number/description/
func isPalindrome(_ x: Int) -> Bool {
    
    guard x >= 0 else { return false }
    
    var xMutable = x
    var reversed = 0
    
    while xMutable != 0 {
        let remainder = xMutable % 10
        reversed = (reversed * 10) + remainder
        xMutable /= 10
    }
    return x == reversed
}

//Q #4 Find GCD of two number. GCD stands for Greatest Common Divisor for example 3,6 - GCD is 3

// https://takeuforward.org/data-structure/find-gcd-of-two-numbers/
// https://janeshswift.com/ios/dsa/array/how-to-find-gcd-of-two-numbers/
// Method #1 Using Recursion
// TC: O(log(min(a,b)))
// SC: O(log(min(a,b)))

func gcd(_ a: Int, _ b: Int) -> Int {
    if (b == 0) { return a }
    return gcd(b, a % b)
}
print("GCD is-->", gcd(3, 11))//prints 1 because not found
print("GCD is-->", gcd(3, 6))//prints 3
// Method #2 Using Loop
// TC: O(log(min(a,b)))
// SC: O(1)
func gcd2(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    while b != 0 {
        let temp = a
        a = b
        b = temp % b
    }
    return a
}
//Q #5 Check for armstrong numbers
//https://takeuforward.org/maths/check-if-a-number-is-armstrong-number-or-not/
//https://janeshswift.com/ios/dsa/array/how-to-check-if-the-given-number-is-armstrong/
//Input:n = 153
//Output:true
//Explanation: 1^3+5^3+3^3 = 1 + 125 + 27 = 153
func checkArmStrong(n: inout Int) -> Bool {
    var count = 0
    var firstCopy = n
    var originalCopy = n
    var sumOfPower = 0
    
    while firstCopy != 0 {
        count+=1
        firstCopy = firstCopy/10
    }
    
    while n != 0 {
        let digit = n%10
        sumOfPower += Int(pow(Double(digit), Double(count)))
        n = n/10
    }
    return sumOfPower == originalCopy
    
}

var ipNumber = 153
print(checkArmStrong(n: &ipNumber))

//Q #6 print all divisors of a given number
/*
https://www.geeksforgeeks.org/find-all-factors-of-a-natural-number/
https://janeshswift.com/ios/dsa/array/how-to-print-all-divisors-of-a-number/
For example divisors of 36 are = 1,2,3,4,5,9,12,18,36
#Approach:
We can find square root of a given number & check if its perfectly divisible sqrt numbers
*/

func printAllDivisors(_ n: Int) {
    for i in 1...Int(sqrt(Double(n))) {
        if n%i == 0 {
            //print("divisiosors",i, separator: " ")
            if i != n/i {
                //print("divisiosors--",n/i, separator: " ")
            }
        }
    }
}
let n = 36
printAllDivisors(n)

//Q #7 Check if number if prime
// https://takeuforward.org/data-structure/check-if-a-number-is-prime-or-not/
// https://janeshswift.com/ios/dsa/array/how-to-check-if-number-is-prime/
//func checkIfNumberIsPrime(_ n : Int) ->Bool {
//    if n <= 1 {return false}
//    if n == 2 || n == 3 || n == 5 {return true}
//    return !(n%2 == 0 || n%3 == 0 || n % 5 == 0)
//}

func checkIfNumberIsPrime(_ n : Int) ->Bool {
    if n <= 1 {return false}
    for i in 2..<Int(sqrt(Double(n))) {
        if i%2 == 0 { return false}
    }
    return true
}

//let n = 7
//let isPrime = checkIfNumberIsPrime(n)
//print("The number is- ", isPrime) // true

//Q #8 Recursion examples
// https://janeshswift.com/ios/dsa/recursion/recursion-examples-in-swift/
//A function which calls itself in the body & solve the problem is called recursion. we will take some example to understand
//
//Print 1 to N
//Print N to 1
//Sum of first n numbers
//Check if String is Palindrome.
//Create Factorial of a number
//Get Fibonacci nth Number
//Calculate Power of two
//Calculate Power of four
//#1 Print numbers from 1 to N
func printNumersFromOneToN(_ n: Int) {
    if n <= 0 { return }
    printNumersFromOneToN(n-1)
    print(n, terminator: " ")
}
//Because Print is before recursion function it will print 1 to n

//#2 Print numbers from N to 1
func printNumersFromNtoOne(_ n: Int) {
     if n < 1 { return }
    print(n, terminator: " ")
    printNumersFromNtoOne(n-1)
}
printNumersFromNtoOne(5)
//#3 Sum of first N numbers
var sumValue = 0
func sumOfFirstNNumbers(_ n: Int) -> Int {
    if n < 1 { return sumValue }
    sumValue += n
    return sumOfFirstNNumbers(n-1)
}
let op = sumOfFirstNNumbers(5)
print("op", op)// 15
//#4 Check if string is Palindrome
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
//#5. Create Factorial of a number
// Example 2: Factorial : Example - 4! = 4x3x2x1 = 24

func findFactorial(inputNumber: Int) ->Int {
    if inputNumber == 1 {// Base case
        return 1
    }
    return inputNumber * findFactorial(inputNumber: inputNumber - 1)
}
print("findFactorial:")
print(findFactorial(inputNumber: 3))
//When we write a recursive call base case plays important role. when we dropdown to a lower number we just add a check to stop recursive call. Like here we have base case if inputNumber == 1. So Factorial is calculated as 4 * findFactorial(3)= > 4*3*2*1

//#6. Get Fibonacci nth Number
// Example 3 Get nth Fabonacci number.. : Fibonacci number 0: 1: 1: 2: 3: 5: 8: 13: 21

func fibonacci(num: Int) ->Int {
    if num <= 1 {
        return num
    }
    // print("in function starts")
    let first = fibonacci(num: num - 1)
    let second = fibonacci(num: num - 2)
    //print("first--->", first)
    //print("second--->", second)
    //print("+++", first+second)
    return first + second
}
print("fibonacci(n--->", fibonacci(num: 4))
//Fibonacci is basically addition of current & Next – Fibonacci number 0: 1: 1: 2: 3: 5: 8: 13: 2*/1 & Base case will be if num <= 1 {

//#7. Calculate Power of two
// Example 4: Power of 2… 2p0 =1 — 2p1 = 2 — 2p2 = 2 — 2p3 =8 — 2p4 = 16 (p stand for power). We can solve it by using two approaches : –

// Approach #A
func getPowerOfTwo(num: Int) -> Int {
    if num == 0 {
        return 1
    }
    return 2 * getPowerOfTwo(num: num-1)
}
print("getPowerOfTwo", getPowerOfTwo(num: 3))
//# Approach B using Bitwise operator
func checkValidPowerOfTwoWithBitwise(num:Int) -> Bool {
    return num > 0 && (num & (num-1) == 0 )
}
print(checkValidPowerOfTwoWithBitwise(num: 1))
//Bit manipulation : bit manipulation techniques are usually based on observations from multiple examples
//
//Binary form of numbers is –
//3->0000 0011
//4->0000 0100
//5->0000 0101
//6->0000 0110
//7->0000 0111
//8->0000 1000
//The observation we can conclude is that the number which is a power of two has always compulsory 1 true bit.
//
//Now consider :-
//bit representation of 7 -> 0111
//bit representation of 8 -> 1000
//bitwise AND of 7 and 8 -> 0000
//we are gonna use this property for for all numbers which are powers of two
//Time Complexity : O(1)
//Space Complexity : O(1)

// Q # Reverse an array

// https://janeshswift.com/ios/dsa/how-to-reverse-an-array-using-recursion/
// Reverse array using recursion Example: [1,2,3] = [3,2,1]. Approach #1 using two variables : –
// Question reverse the string using recursion
// Here we are just swapping right with left & increase the left & right elements
func reverseArrayUsingRecursion(inArray: inout [Int],
                   rightElement: inout Int,
                   leftElement: inout Int) {
    
    if rightElement >= leftElement {return}
    inArray.swapAt(rightElement, leftElement)
    rightElement += 1
    leftElement -= 1
    reverseArrayUsingRecursion(inArray: &inArray,
                  rightElement: &rightElement,
                  leftElement: &leftElement)
}

var inArray = [1, 2, 3, 4]
var rightElement = 0
var leftElement = inArray.count - 1
reverseArrayUsingRecursion(inArray: &inArray, rightElement: &rightElement, leftElement: &leftElement)
print(inArray) // prints [4, 3, 2, 1]
// Approach#2: Using single pointer/variable so we written base case which blocks on n/2, we are just increasing the element by +1 on every recursion till half of the array.
func reverseArrayUsingRecursion2(inArray: inout [Int],
                                 startIndex: inout Int) {
    
    if startIndex >= inArray.count/2 {return}
    inArray.swapAt(startIndex, inArray.count-startIndex-1)
    startIndex += 1
    reverseArrayUsingRecursion2(inArray: &inArray,
                                startIndex: &startIndex)
}

var inArray2 = [1, 2, 3, 4]
var startIndex = 0
reverseArrayUsingRecursion2(inArray: &inArray2, startIndex: &startIndex)
print(inArray2)

// MARK: Hashing problems.
// Q # Find highest & lowest frequency elements
//https://takeuforward.org/arrays/find-the-highest-lowest-frequency-element/
/**
 Input: array[] = {10,5,10,15,10,5};
 Output: 10 15
 Explanation: The frequency of 10 is 3, i.e. the highest and the frequency of 15 is 1 i.e. the lowest.
 */
func frequency(_ arr: [Int]) {
    var map = [Int: Int]()
    
    // Populate the frequency map
    for num in arr {
        map[num, default: 0] += 1
    }
    
    var maxFreq = 0
    var minFreq = arr.count
    var maxEle = 0
    var minEle = 0
    
    // Traverse the map to find the elements with max and min frequencies
    for (element, count) in map {
        if count > maxFreq {
            maxEle = element
            maxFreq = count
        }
        if count < minFreq {
            minEle = element
            minFreq = count
        }
    }
    
    print("The highest frequency element is: \(maxEle)")
    print("The lowest frequency element is: \(minEle)")
}

// Example usage
let arr = [10, 5, 10, 15, 10, 5]
frequency(arr)

