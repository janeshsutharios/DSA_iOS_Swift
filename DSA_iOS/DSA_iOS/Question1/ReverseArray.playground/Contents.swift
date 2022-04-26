import UIKit
import Foundation




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


func fetchUnreadCount1(from urlString: String, completionHandler: @escaping (Result<Int, NetworkError>) -> Void)  {
    guard let url = URL(string: urlString) else {
        completionHandler(.failure(.badURL))
        return
    }

    // complicated networking code here
    print("Fetching \(url.absoluteString)...")
    completionHandler(.success(5))
}

fetchUnreadCount1(from: "https://www.hackingwithswift.com") { result in
    switch result {
    case .success(let count):
        print("\(count) unread messages.")
    case .failure(let error):
        print(error.localizedDescription)
    }
}


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


var finalString = Array("")

finalString[0] = "[.]"


var dictionary = [Int:Int]()
       for (i, n) in nums.enumerated() {
           if let last = dictionary[target - n] {
               return [last, i]
           }
           dictionary[n] = i
       }
       return []
