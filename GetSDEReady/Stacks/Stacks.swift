// https://getsdeready.com/courses/dsa/lesson/valid-parentheses/
// https://leetcode.com/problems/valid-parentheses/description/
class Solution {
    func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else { return false }
        
        var stack: [Character] = []
        // Here we are maintaing stack . adding element with close bracket & removing values from stack if the braces not matched.
        for ch in s {
            switch ch {
            case "(": stack.append(")")
            case "[": stack.append("]")
            case "{": stack.append("}")
            default:
                // Return false for unbalanced stack
                if stack.isEmpty || stack.removeLast() != ch {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}


// https://getsdeready.com/courses/dsa/lesson/remove-all-adjacent-duplicates-in-string/
// https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/description/
func removeDuplicates(_ s: String) -> String {
    var stack = [Character]() // Use a stack to keep characters that are not removed

    for char in s {
        // If the top of the stack is the same as current char, it's a duplicate → remove it
        if stack.last == char {
            stack.removeLast()
        } else {
            // Else, push the current char to the stack
            stack.append(char)
        }
    }

    // Convert final character array (stack) back to a string and return
    return String(stack)
}

// https://getsdeready.com/courses/dsa/lesson/next-greater-element-i/
// https://leetcode.com/problems/next-greater-element-i/description/
class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result: [Int] = []

        for num in nums1 {
            var found = -1
            // Find index of num in nums2
            if let index = nums2.firstIndex(of: num) {
                // Scan to the right to find the next greater element
                for i in (index + 1)..<nums2.count {
                    if nums2[i] > num {
                        found = nums2[i]
                        break
                    }
                }
            }
            result.append(found)
        }
        return result
    }
}
// Soution 2 using Stacks 
class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var stack: [Int] = []
        var nextGreater: [Int: Int] = [:]

        for num in nums2 {
            // Maintain decreasing stack
            while let last = stack.last, num > last {
                nextGreater[stack.removeLast()] = num
            }
            stack.append(num)
        }

        // For remaining elements in stack, no next greater
        for num in stack {
            nextGreater[num] = -1
        }

        // Build result for nums1
        return nums1.map { nextGreater[$0] ?? -1 }
    }
}
// https://getsdeready.com/courses/dsa/lesson/number-of-students-unable-to-eat-lunch/
// https://leetcode.com/problems/number-of-students-unable-to-eat-lunch/description/
class Solution {
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        // 0th index who prefers circular sandwich & 1st index prefers square sandwich
        var studentPreferences: [Int] = [0,0]
        // Now insert count of circular & square sandwiches
        for student in students {
            studentPreferences[student] += 1
        }

        // Iterate over sandwiches which students can eat 

        for sandwitch in sandwiches {
            // If no student prefer to eat partcular sandwitch 
            /* Test case students =    [1,1,1,0,0] sandwiches =  [0,0,0,1,1] */
            if studentPreferences[sandwitch] == 0 {
                break
            }
            studentPreferences[sandwitch] -= 1
        }
        return studentPreferences[0] + studentPreferences[1]
    }
}  
    /* Approach 2 
func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
    var students = students
    var sandwiches = sandwiches
    var count = 0 // tracks how many students rotated without eating

    while !students.isEmpty && count < students.count {
        if students[0] == sandwiches[0] {
            // student takes sandwich
            students.removeFirst()
            sandwiches.removeFirst()
            count = 0
        } else {
            // student goes to end
            let student = students.removeFirst()
            students.append(student)
            count += 1
        }
    }

    return students.count // remaining students who couldn’t eat
}
*/
// https://getsdeready.com/courses/dsa/lesson/remove-all-adjacent-duplicates-in-string/
// https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/description/
func removeDuplicates(_ s: String) -> String {
    var stack = [Character]() // Use a stack to keep characters that are not removed

    for char in s {
        // If the top of the stack is the same as current char, it's a duplicate → remove it
        if stack.last == char {
            stack.removeLast()
        } else {
            // Else, push the current char to the stack
            stack.append(char)
        }
    }

    // Convert final character array (stack) back to a string and return
    return String(stack)
}
