//import UIKit
//import Foundation
    



func maxArea(_ height: [Int]) -> Int {
    var highest = 0
    var secondHighest = 0
    // Loop over the array
    for i in 0..<height.count {
        // If we've found a new highest number...
        if (height[i] > highest) {
            // ...shift the current highest number to second highest
            secondHighest = highest;
            // ...and set the new highest.
            highest = height[i];
        }
        else if (height[i] > secondHighest) && height[i] != highest {
            // Just replace the second highest
            secondHighest = height[i];
        }
    }
    print(highest,secondHighest)
    return secondHighest
}
//print(maxArea([1,1]))



func test(currentIndex: Int) {
    if currentIndex > 2 {
        print("exit")
        return
    }
    print("before", currentIndex)
    test(currentIndex: currentIndex+1)
    print("after------- ", currentIndex)
    test(currentIndex: currentIndex+1)
    print("Final ================  ", currentIndex)
}

//test(currentIndex: 0)

//[1,2,3]

//[1] [2,3] [1,3]


// Qustion:  Find all sequence whose sum is K
//func printOneSeqSumK(ind: Int,
//                     targetSum: Int,
//                     currSum: inout Int,
//                     inArray: [Int],
//                     length: Int) -> Int {
//    if ind == length {
//        if  targetSum == currSum {
//            return 1
//        }
//        return 0
//    }
//
//    currSum += inArray[ind]
//    let left = printOneSeqSumK(ind: ind+1,
//                    targetSum: targetSum,
//                    currSum: &currSum,
//                    inArray: inArray,
//                       length: length)
//    currSum -= inArray[ind]
//    let right = printOneSeqSumK(ind: ind+1,
//                    targetSum: targetSum,
//                    currSum: &currSum,
//                    inArray: inArray,
//                       length: length)
//    return left + right
//}
//
//
//let arrayInput = [4,8,4]
//let length = arrayInput.count
//let ind = 0
//let targetSum = 8
//var currSum = 0
//let allPossibleSum = printOneSeqSumK(ind: ind,
//                targetSum: targetSum,
//                currSum: &currSum,
//                inArray: arrayInput,
//                length: length)
//print(allPossibleSum)

//printPattern()

// Qustion:  Find all sequence whose sum is K
func printAllSeqSumK(ind: Int,
                     op: inout [Int],
                     targetSum: Int,
                     currSum: inout Int,
                     inArray: [Int],
                     length: Int) {
    if ind == length {
        if  targetSum == currSum {
            print("foundTheSum-->", op)
        }
        return
    }

    op.append(inArray[ind])
    currSum += inArray[ind]

    printAllSeqSumK(ind: ind+1,
                    op: &op,
                    targetSum: targetSum,
                    currSum: &currSum,
                    inArray: inArray,
                    length: length)
    op.removeLast()
    currSum -= inArray[ind]
    printAllSeqSumK(ind: ind+1,
                    op: &op,
                    targetSum: targetSum,
                    currSum: &currSum,
                    inArray: inArray,
                    length: length)
}


let arrayInput = [4,8,4]
let length = arrayInput.count
var op: [Int] = []
let ind = 0
let targetSum = 8
var currSum = 0
printAllSeqSumK(ind: ind,
                op: &op,
                targetSum: targetSum,
                currSum: &currSum,
                inArray: arrayInput,
                length: length)




//func printAllSequence(currentIndex: Int, op: inout [Int], inArray: [Int],length: Int) {
//    if currentIndex == length {
//        print(op)
//        return
//    }
//    op.append(inArray[currentIndex])
//    printAllSequence(currentIndex: currentIndex+1, op: &op, inArray: inArray, length: length)
//    op.removeLast()
//    printAllSequence(currentIndex: currentIndex+1, op: &op, inArray: inArray, length: length)
//}
//
//
//var inArray = [4,2,9]
//var length = inArray.count
//var op: [Int] = []
//var currentIndex = 0
//printAllSequence(currentIndex: currentIndex, op: &op, inArray: inArray, length: length)



let str = "My String"

let index = str.index(str.startIndex, offsetBy: 3)
String(str[index])    // "S"


func longestCommonPrefix(_ strs: [String]) -> String {
    
    if strs.isEmpty { return "" }
    var firstObject = strs[0]
    
    for currentObject in strs {
        print("currentObject----> ", currentObject)
        while !currentObject.hasPrefix(firstObject) {
            firstObject = String(firstObject.dropLast())
            print("currentObject--->", currentObject)
            print("firstObject--->", firstObject)
            
        }
    }
    return firstObject
}


print("helllo--->", longestCommonPrefix(["flier","flower","flight", "foot"]))





private let dict: [Character:Int] = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]

func romanToInt(_ s: String) -> Int {
    var prev = 0, out = 0
    for i in s {
        let val = dict[i] ?? 0
        let calculation = (val <= prev) ? prev : -prev
        print("prevv--->", prev)
        print("current--->", val, (val <= prev))
        out += calculation
        prev = val
    }
    print("Out-->", out)
    print("prev-->", prev)
    out += prev
    return out
}

print(romanToInt("IV"))



// wap to reverse array

/** Reverse Array in swift ---*/
// Approach: 1
func reverseArray(inputArr:[Int]) -> [Int] {
    var outputArray :[Int] = inputArr
    
    for iObject in 0..<inputArr.count / 2 {
        outputArray.swapAt(iObject, inputArr.count - iObject - 1 )
    }
    return outputArray
}

print("reverseArray-->", reverseArray(inputArr: [1,2,3,4,5]))


// Approach: 2


var names:[String] = ["Apple", "Microsoft", "Lenovo", "Asus"]
let count = names.count
print("count-->", count/2)
for i in 0..<count/2 {
    (names[i],names[count - i - 1])  = (names[count - i - 1],names[i])
    
    // ["Apple", "Asus"] = ["Asus", "Apple"]
}

print("names", names)


var nameObject = "Hello"


struct Vec3D<GenericType> {
    let x, y, z: GenericType
    init(x: GenericType, y: GenericType, z: GenericType) {
        self.x = x
        self.y = y
        self.z = z
    }
}

let intVector = Vec3D(x: 1, y: 2, z: 5)
let floatVector = Vec3D(x: 1.0, y: 2.0, z: 5.0)

