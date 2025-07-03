// https://getsdeready.com/courses/dsa/lesson/two-sum/
// https://leetcode.com/problems/two-sum/description/
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dictionary = [Int:Int]()
        for (index, number) in nums.enumerated() {
            if let foundIndexFromDict = dictionary[target - number] {
                return [foundIndexFromDict, index]
            }
            dictionary[number] = index
        }
        return []
    }
}
/*
Approach #2 : Using Two pointers: –
Step 1: First sort array then
Step 2: If arr[left] + arr[right] > sum, we will decrement the right pointer.
Step 3: If arr[left] + arr[right] < sum, we will increment the left pointer.
Step 4: if arr[left] + arr[right] == sum, we will return the result.

// TC: O(N)
// SC: O(1)
func twoSum(arr: inout [Int], target: Int) ->[Int] {
    arr.sort()
    var left = 0
    var right = arr.count - 1
    while (left < right) {
        let sum = arr[left] + arr[right]
        if (sum == target) {
            return [left, right]
        } else if sum < target {
            left+=1
        } else {
            right-=1
        }
    }
    return []
}

var twoSumArr = [2, 6, 5, 8, 11]
let target = 14
let ans = twoSum(arr: &twoSumArr, target: target)
print("two sum index found-->", ans, twoSumArr[ans[0]], twoSumArr[ans[1]])
*/
// https://getsdeready.com/courses/dsa/lesson/find-the-difference/
// https://leetcode.com/problems/find-the-difference/description/

class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var dict: [Character: Int] = [:]

        for char in s {
            dict[char, default: 0] += 1
        }
        for char in t {
            if let value = dict[char], value != 0 {
                dict[char]! -= 1
            } else {
                return char
           }

        }
        return Character(" ")
    }
}
