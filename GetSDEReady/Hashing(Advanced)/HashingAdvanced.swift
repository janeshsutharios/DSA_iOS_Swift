// https://getsdeready.com/courses/dsa/lesson/check-if-n-and-its-double-exist-2/
//https://leetcode.com/problems/check-if-n-and-its-double-exist/
class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        var dict: [Int: Bool] = [:]  // stores seen numbers

        for num in arr {
            // check if current number has a double or half in the map
            if dict[2 * num] == true || (num % 2 == 0 && dict[num / 2] == true) {
                return true
            }
            dict[num] = true  // mark this number as seen
        }

        return false
    }
}
// https://getsdeready.com/courses/dsa/lesson/how-many-numbers-are-smaller-than-the-current-number-2/
// https://leetcode.com/problems/how-many-numbers-are-smaller-than-the-current-number/description/
class Solution {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        // Step 1: Count the frequency of each number
        var count = [Int](repeating: 0, count: 101)
        for num in nums {
            count[num] += 1
        }

        // Step 2: Build prefix sum to know how many numbers are less than a given number
        for i in 1..<101 {
            count[i] += count[i - 1]
        }

        // Step 3: Generate result using prefix sums
        var result = [Int]()
        for num in nums {
            if num == 0 {
                result.append(0)
            } else {
                result.append(count[num - 1])
            }
        }

        return result
    }
}
// https://getsdeready.com/courses/dsa/lesson/sum-of-unique-elements/
// https://leetcode.com/problems/sum-of-unique-elements/description/
class Solution {
    func sumOfUnique(_ nums: [Int]) -> Int {
        var dict:[Int: Int] = [:]
        var sum = 0
        for num in nums {
            dict[num, default: 0] += 1
        }
        for (index, element) in dict.enumerated() {
            if element.value == 1 {
                sum += element.key
            }
        }
        return sum
    }
}
// https://getsdeready.com/courses/dsa/lesson/decode-the-message/
// https://leetcode.com/problems/decode-the-message/description/
class Solution {
    func decodeMessage(_ key: String, _ message: String) -> String {
        var map = [Character: Character]()  // Dictionary to hold the substitution mapping
        var currentChar: Character = "a"    // Start mapping with 'a'
        var decoded = ""  // Result string to store the decoded message

        // Step 1: Build the substitution cipher from the key
        for char in key {
            if char != " " && map[char] == nil {
                // If the character is not a space and not already mapped,
                // assign it the next available character in the alphabet
                map[char] = currentChar
                
                // Move to the next character in the alphabet
                currentChar = Character(UnicodeScalar(currentChar.asciiValue! + 1)!)
            }
        }
        
        // Step 2: Decode the message using the constructed map
        for char in message {
            if char == " " {
                // Preserve spaces as-is
                decoded.append(" ")
            } else {
                // Replace the character using the mapping
                decoded.append(map[char]!)
            }
        }
        
        return decoded  // Return the final decoded message
    }
}

