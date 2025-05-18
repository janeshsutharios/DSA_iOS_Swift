// MARK #1
// https://www.hackerrank.com/contests/get-sde-ready-math/challenges/manasa-and-factorials
import Foundation

/*
 * Complete the 'solve' function below.
 *
 * The function is expected to return a LONG_INTEGER.
 * The function accepts LONG_INTEGER n as parameter.
 */

func findTrailingZero(_ n: Int) -> Int {
    var trailingZeros = 0 
    var n = n
    var i = 5
    
    while n/i > 0 {
        trailingZeros += n/i
        i *= 5    
    }
    
    return trailingZeros    
}

func solve(n: Int) -> Int {
    var low = 0
    var high = n * 5
    
    while low < high {
        var mid = (low + high) / 2
        if findTrailingZero(mid) < n {
            low = mid + 1
        } else {
            high = mid
        }
    }
    return low
}



let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for tItr in 1...t {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    let result = solve(n: n)

    fileHandle.write(String(result).data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
// MARK #2
// https://www.hackerrank.com/contests/get-sde-ready-math/challenges/fibonacci-gcd/problem
import Foundation
import Foundation

let MOD: Int64 = 1_000_000_007
var nums: [Int64] = []

// Traditional Fibonacci is slow..
// func fibonacci(_ n: Int64) -> Int64 {
//     if n == 0 { return 0 }
//     var a: Int64 = 0
//     var b: Int64 = 1
//     for _ in 1..<n {
//         let c: Int64 = (a + b) % MOD
//         a = b
//         b = c
//     }
//     return b
// }

// Here I have used Fast Fibonacci using matrix exponentiation
func fibonacci(_ n: Int64) -> Int64 {
    if n == 0 { return 0 }
    var a: [[Int64]] = [[1, 1], [1, 0]]
    var res: [[Int64]] = [[1, 0], [0, 1]]
    var p = n - 1
    while p > 0 {
        if p % 2 == 1 {
            res = multiply(res, a)
        }
        a = multiply(a, a)
        p /= 2
    }
    return res[0][0]
}

func multiply(_ a: [[Int64]], _ b: [[Int64]]) -> [[Int64]] {
    return [
        [
            (a[0][0] * b[0][0] + a[0][1] * b[1][0]) % MOD,
            (a[0][0] * b[0][1] + a[0][1] * b[1][1]) % MOD
        ],
        [
            (a[1][0] * b[0][0] + a[1][1] * b[1][0]) % MOD,
            (a[1][0] * b[0][1] + a[1][1] * b[1][1]) % MOD
        ]
    ]
}

// I am doing GCD operation.
func gcd(_ a: Int64, _ b: Int64) -> Int64 {
    var a = a
    var b = b
    while b != 0 {
        let temp = b
        b = a % b
        a = temp
    }
    return a
}

// I have updated input outputs 
let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

// Read input
guard let n = Int(readLine()!) else {
    fatalError("Invalid input")
}
for _ in 0..<n {
    if let line = readLine(), let value = Int64(line) {
        nums.append(value)
    }
}

// Compute GCD of all input numbers
var resultGCD = nums[0]
for i in 1..<nums.count {
    resultGCD = gcd(resultGCD, nums[i])
}

// Compute Fibonacci(resultGCD)
let result = fibonacci(resultGCD)
fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

// MARK #3 https://www.hackerrank.com/contests/get-sde-ready-math/challenges/handshake
func handshake(n: Int) -> Int {
    // Write your code here
 
    return n * (n - 1) / 2

}
