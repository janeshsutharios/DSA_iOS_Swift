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
// https://getsdeready.com/courses/dsa/lesson/palindrome-pairs/
// https://leetcode.com/problems/palindrome-pairs/description/
// https://github.com/janeshsutharios/DSA_iOS_Swift/blob/main/GetSDEReady/Images/336.%20Palindrome%20Pairs.pdf

class Solution {
    // Dictionary to cache the results of palindrome checks
    var check: [String: Bool] = [:]

    // Function to check if a given string is a palindrome
    func isPalindrome(_ s: String) -> Bool {
        // If the result is already cached, return it
        if let cache = check[s] {
            return cache
        }
        
        // An empty string is considered a palindrome
        if s.isEmpty {
            check[s] = true
            return true
        }
        
        // Convert the string to a character array for easy indexing
        let chars = Array(s)
        let n = chars.count
        
        // Check each character from the start and end towards the middle
        for i in 0..<n/2 {
            if chars[i] != chars[n - i - 1] {
                check[s] = false
                return false
            }
        }
        
        // If no mismatches are found, it's a palindrome
        check[s] = true
        return true
    }

    // Function to find all palindrome pairs in an array of words
    func palindromePairs(_ words: [String]) -> [[Int]] {
        var reveresedDict: [String: Int] = [:]
        var result: [[Int]] = []

        // Populate the dictionary with reversed words and their indices
        for i in 0..<words.count {
            let reversed = String(words[i].reversed())
            reveresedDict[reversed] = i
        }

        // Handle the case where an empty string is present
        if let emptyIndex = reveresedDict[""], emptyIndex < words.count {
            for i in 0..<words.count where i != emptyIndex {
                if isPalindrome(words[i]) {
                    result.append([i, emptyIndex])
                }
            }
        }

        // Iterate through each word in the array
        for i in 0..<words.count {
            var left = ""
            var right = words[i]
            
            // For each word, progressively split it into left and right parts
            for _ in 0..<words[i].count {
                let firstObject = right.removeFirst()
                left.append(firstObject)
                
               // print("left, right -------->", i, left,right, "reveresedDict is", reveresedDict[left], reveresedDict[right])
                // Check if the left part is in the dictionary and the remaining right part is a palindrome
                if let index = reveresedDict[left], isPalindrome(right), index != i {
                    print("Right Added--", [i, index], "right", right)
                    result.append([i, index])
                }
                
                // Check if the right part is in the dictionary and the left part is a palindrome
                if let index = reveresedDict[right], isPalindrome(left), index != i {
                    print("Left Added--", [i, index], "Left", right)
                    result.append([index, i])
                }
            }
        }
        
        return result
    }
}

// isPalindrome(right) & isPalindrome(left) explained here -
// Because we are cheking that what we can add so that we can make pandrome string
| Case               | Triggers              | Why                  |
| ------------------ | --------------------- | -------------------- |
| `["bat", "tab"]`   | `isPalindrome(right)` | right = `""` (empty) |
| `["a", ""]`        | Both                  | empty string logic   |
| `["lls", "s"]`     | `isPalindrome(right)` | right = `"s"`        |
| `["sssll", "lls"]` | `isPalindrome(left)`  | left = `"sss"`       |

