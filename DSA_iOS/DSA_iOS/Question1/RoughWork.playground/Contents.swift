import UIKit

var greeting = "Hello, playground"


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


func makeReverseArray(inputArray:[Int]) -> [Int] {
    var newArray:[Int] = inputArray
    for iObject in 0..<inputArray.count/2 {
        newArray.swapAt(iObject, inputArray.count - 1 - iObject)
    }
    
    return newArray
}

print(makeReverseArray(inputArray: [1,2,3,4,5]))
