https://getsdeready.com/courses/dsa/lesson/largest-perimeter-triangle/?course=573
// https://leetcode.com/problems/largest-perimeter-triangle/description/
class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        if nums.count < 3 { return 0 }
        let sorted = nums.sorted()
        for i in stride(from: sorted.count - 3, through: 0, by: -1) {
            let a = sorted[i]
            let b = sorted[i + 1]
            let c = sorted[i + 2]
            if a + b > c {
                return a + b + c
            }
        }
        return 0
    }
}
