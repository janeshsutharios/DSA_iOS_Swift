// https://getsdeready.com/courses/dsa/lesson/valid-parentheses/
// https://leetcode.com/problems/valid-parentheses/description/
class Solution {
    func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else { return false }
        
        var stack: [Character] = []
        //Here we are maintaing stack . adding element with close bracket & removing values from stack if the braces not matched.
        for ch in s {
            switch ch {
            case "(": stack.append(")")
            case "[": stack.append("]")
            case "{": stack.append("}")
            default:
              // Here it's or condition hence stack.removeLast() can execute first & & make state.isEmpty true
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


