/// Adds one to a number represented as an array of digits.
/// - Parameter digits: An array of digits representing a non-negative integer.
/// - Returns: A new array of digits representing the number plus one.
func plusOne(_ digits: [Int]) -> [Int] {
    var result = digits
    let lastIndex = result.count - 1

    // Traverse the digits array from right to left
    for index in stride(from: lastIndex, through: 0, by: -1) {
        if result[index] < 9 {
            // If the digit is less than 9, just increment and return early
            result[index] += 1
            return result
        } else {
            // If digit is 9, set it to 0 and continue to carry over
            result[index] = 0
        }
    }

    // If all digits were 9 (e.g., [9, 9, 9]), add an extra leading 1
    // Example: [9, 9, 9] -> [1, 0, 0, 0]
    var expandedResult = [Int](repeating: 0, count: result.count + 1)
    expandedResult[0] = 1
    return expandedResult
}
//  Test with [1,9,9] [1,4,3] [9,9,9]
