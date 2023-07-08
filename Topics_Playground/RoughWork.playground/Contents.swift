import UIKit



func test(_ curr: Int) {
    //print("fuction-->", curr)
    if curr < 2 {
        print("first", curr)
        test(curr+1)
        print("second", curr)
        test(curr+1)
        print("Final---------> ", curr)
    }
}
test(0)
print("dd")
print("hh")


extension StringProtocol {
  subscript(_ offset: Int) -> Element {
      self[index(startIndex, offsetBy: offset)]
  }
}

func longestCommonPrefix(_ strs: [String]) -> String {
    
    if strs.isEmpty { return "" }
    var common = strs[0]//O(1) space
    
    for ch in strs {
        while !isPrefix(inp: ch, toFind: common) {
            common = String(common.dropLast())
        }
    }
    
    func isPrefix(inp: String, toFind: String) -> Bool{
        let countValue = toFind.count
        var newStr = ""
        if inp.count >= countValue {
            for i in 0..<countValue {
                newStr += String(inp[i])
            }
        }
        return toFind == newStr
    }
    return common
}


let x = longestCommonPrefix(["flower","flow","flight"])
print("longestCommonPrefix", x)


var greeting = "Hello, playground"

func containsDuplicate(input: [Int]) ->Bool {
    var dict: [Int: Int] = [:]
    for value in input {
        if dict[value] == nil {
            dict[value] = 0
        } else {
            return true
        }
    }
    return false
}
print(containsDuplicate(input: [1,2,3]))



print("kkkihjhk")
print("77")



func findMinMax(inputArray: [Int]) -> (min:Int, max: Int) {
    if inputArray.count == 0 { return (min:-1, max: -1) }
    var minNumber = inputArray[0]
    var maxNumber = inputArray[0]
    for index in 1..<inputArray.count {
        if inputArray[index] < minNumber {
            minNumber = inputArray[index]
        }
        if inputArray[index] > maxNumber {
            maxNumber = inputArray[index]
        }
    }
    return (min: minNumber, max: maxNumber)
}

print(findMinMax(inputArray: [3,5,4,1,9]))


extension String {
    func customReverse() -> String {
        var chars = Array(self)
        let count = chars.count

        for i in 0 ..< count/2 {
            chars.swapAt(i, count - 1 - i)
        }

        return String(chars)
    }
}

let input = "ABCD"
let output = input.customReverse()
print(output)



func makeReverseArray(_ s: inout [Character]) {
    for i in 0..<s.count/2 {
        //s.swapAt(s.count - i - 1, i)
        (s[i],s[s.count - i - 1])  = (s[s.count - i - 1],s[i])
    }
}

var charsInput:[Character] = ["C","A", "R"]
makeReverseArray(&charsInput)
print("output-->", charsInput) // Prints ["R", "A", "C"]


//func makeReverseArray(inputArray:[Int]) -> [Int] {
//    var newArray:[Int] = inputArray
//    for iObject in 0..<inputArray.count/2 {
//        newArray.swapAt(iObject, inputArray.count - 1 - iObject)
//    }
//
//    return newArray
//}
//
//print(makeReverseArray(inputArray: [1,2,3,4,5]))
