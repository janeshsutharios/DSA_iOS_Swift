// Question remove last parathesis..
// TC: O(n)
// SC: O(_)
func removeOuterParentheses(_ s: String) -> String {
    var outputStr = ""
    var opened = 0
    for c in s {
        if c == "(" {
            if opened > 0 {
                outputStr.append(c)
            }
            opened+=1
        }
        if c == ")" {
            if opened > 1  {
                outputStr.append(c)
            }
            opened-=1
        }
    }
    return outputStr
}

let parnthString = "(()())(())"
let opRemovedLastParath = removeOuterParentheses(parnthString)
//print(" removed last Paranth", opRemovedLastParath) // ()()()

// Question: reverse word of the string..
let str = "My String"
let charss = str[str.index(str.startIndex, offsetBy: 3)]
//print(String(str[str.index(str.startIndex, offsetBy: 3)]))    // "S"

// TC: O(N)
// SC: O(1)

func reverseWords(_ s: String)-> String {
    var left = 0
    let right = s.count - 1
    var temp = ""
    var ans = ""
    
    // Iterate the string and keep on adding to form a word to temp & transfer to ans
    // If empty space is encountered then add the current word to the ans
    while left <= right {
        let indexEl = s.index(s.startIndex, offsetBy: left)
        let ch = String(s[indexEl])
        if ch != " " {
            temp += ch// fill word into temp
        } else if ch == " " {// move data from temp to answer & reset temp
            if ans != "" {
                if temp != "" {// If contiguous element is " " empty string don't add any more white space
                    ans = temp + " " + ans
                }
            } else {
                ans = temp
            }
            temp = ""
        }
        left+=1
    }
    
    //If temp is not empty string then add to the result(Last word to be added)
    if temp != "" {
        if ans != "" {
            ans = temp + " " + ans
        } else {
            ans = temp
        }
    }
    
    return ans
}

let stringToReverseWords = "  My     Name    is Janesh"
let opWords =  reverseWords(stringToReverseWords)
//print("op words--->", opWords, opWords.count)//op words---> Janesh is Name My 17


// Question: Find Largest Odd Number..
// TC: O(N)
// SC: O(N)
func largestOddNumber(_ num: String) -> String {
    if num.isEmpty { return "" }
    // #Approach #1: by iterating from last index Time limit exceed for large input
    var last = num.count - 1
    while last >= 0 {
        let currentChar = String(num[num.index(num.startIndex, offsetBy: last)])
        if Int(currentChar)! % 2 == 0 {
            last -= 1
        } else {// Re
            let range = num.startIndex...num.index(num.startIndex, offsetBy: last)
            return String(num[range])// return the all numbers from the odd index
        }
    }
    return ""
    
    // Approach #2 using clousers
    //    guard let i = num.lastIndex(where: { Int(String($0))! % 2 == 1 }) else { return "" }
    //      return String(num[...i])
}

let ipStr = "4324"
let opStr = largestOddNumber(ipStr)
//print("op is ", opStr)//43

// Question: Longest common prefix of string..
// Approach Binary search
// TC: O(nlog(n))
// SC: O(1)
func longestCommonPrefix(_ strs: [String]) -> String {
    guard let firstStr = strs.first else { return "" }
    
    var low = 0
    var high = firstStr.count
    
    while low < high {// Divide first array object into two parts & compare
        let mid = (low + high) / 2
        let prefix = String(firstStr.prefix(mid + 1))
        
        if strs.allSatisfy({ $0.hasPrefix(prefix) }) {// if mid is satisfy increment counter of low
            low = mid + 1
        } else {// if larger string doesn't match decrement high
            high = mid
        }
    }
    
    return String(firstStr.prefix(low))
}
let commonPrefixStr = ["fl","flower","flight"]
let opCommonStr = longestCommonPrefix(commonPrefixStr)
//print("opCommonStr-- ", opCommonStr)// "fl"

// Question: Check if string is rotated.
// TC: O(N)
// SC: O(1)
func rotateString(_ s: String, _ goal: String) -> Bool {
    return s == goal || s.count == goal.count && (s+s).contains(goal)
}

let ipStringRot1 = "abcde"
let ipStringRot2 = "cdeab"

let opStringRot = rotateString(ipStringRot1, ipStringRot2)
//print("op is-- ", opStringRot)// true

// Question: Check if String is Anagram
// TC: O(N)
// SC: O(N)
func isAnagram(_ s: String, _ t: String) -> Bool {
    var arr = [Int](repeating: 0, count: 26)
    for char in s {
        arr[Int(char.asciiValue!) % 26] += 1// Modulo is used to use values from 0 to 25 which is array optimised size.
    }
    for char in t {
        arr[Int(char.asciiValue!) % 26] -= 1

    }
    for v in arr where v != 0  {
        return false// If some value are non zero means different objects
    }
    return true
 // Or we can also use contains   return !arr.contains(where: { $0 != 0 })
}
// Approach #2 Using Dictionary or hashmap
// TC: O(N)
// SC: O(N)
func isAnagram2(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    
    var map = [Character: Int]()
    for char in s {
        map[char, default: 0] += 1// filling first String characters count into map
    }
    
    for char in t {
        map[char, default: 0] -= 1// removing second String characters count from map. Means all values in map should zero
    }
    for v in map.values where v != 0  {
        return false// If some value are non zero means different objects
    }
    return true
   // return map.values.filter { $0 > 0 }.count == 0
}

// Approach #3:  Using reduce function.
// TC: O(N).. because by default swift reduce function uses O(N) based on input
func isAnagram3(_ s: String, _ t: String) -> Bool {
    return getCharacterMap(s) == getCharacterMap(t)
}

func getCharacterMap(_ s: String) -> [Character: Int] {
    return s.reduce(into: [:], { $0[$1, default: 0] += 1 })
}

let ana1 = "abc"
let ana2 = "cab"
let isAna = isAnagram3(ana1, ana2)
//print("isAna--- ", isAna) // true

// Question: Check if string are ISOPHORMIC
// TC: O(N)
// SC: O(N)

func isIsomorphic(_ s: String, _ t: String) -> Bool {
    var rightDic = [Character:String.Index](), leftDic = rightDic
    for i in s.indices {
        guard rightDic[s[i]] == leftDic[t[i]] else { return false }
        rightDic[s[i]] = i
        leftDic[t[i]] = i
    }
    return true
}

let iso1 = "egg"
let iso2 = "add"
let isISO = isIsomorphic(iso1, iso2)
//print("isISO--- ", isISO) // true

// Question Sort Characters by frequency:

// TC: O(N)
// SC: O(N)
func frequencySort(_ s: String) -> String {
    var dict:[Character:String] = [:]
    for c in s {
        dict[c, default:""] += String(c)
    }
    //        var sortedDictionary = dict.sorted { (aDic, bDic) -> Bool in
    //            return aDic.value.count > bDic.value.count
    //        }
    // Here we can also use some sorting technique, like merge sort
    var sortedDictionary = dict.sorted {
        $0.1.count > $1.1.count
    }
    var ans = ""
    for (_, value) in sortedDictionary {
        ans += value
    }
    return ans
}
//Other Solution using high order functions.
/*
func frequencySort(_ s: String) -> String {
    let counts = s.reduce(into: [:]) {$0[$1, default: 0] += 1}
    let sortedCounts = counts.sorted(by: { $0.value > $1.value })
    return sortedCounts.reduce(into: "") {$0.append(
        String(repeating: $1.0, count: $1.1))
    }
}
func frequencySort(_ s: String) -> String {
    return Dictionary(s.map { ($0, 1)}, uniquingKeysWith: +)
        .sorted(by: { $0.value > $1.value })
        .reduce("") { $0 + String(repeating: $1.key, count: $1.value) }
}
 func frequencySort(_ s: String) -> String {
     var dic = [Character: String]()
     var ans = ""
     
     s.map{ dic[$0, default: ""] += String($0) }
     dic.sorted{ $0.1.count > $1.1.count }.map{ ans += $0.1 }
     
     return ans
 }
*/
 
let strObj = "tree"
let opSortedStr = frequencySort(strObj)
//print(" opSortedStr-- ", opSortedStr)// eert

// Question:  Maximum Nesting Depth of the Parentheses
// TC: O(N)
// SC: O(1)
func maxDepth(_ s: String) -> Int {
    var res = 0
    var cur = 0
    
    for c in s {
        if c == "(" {
            cur += 1
            res = max(res, cur)
        }
        if c == ")" {
            cur -= 1
        }
    }
    return res
}
let ipParanth = "(1+(5*8)+((9)/2))+100"
let opMaxDepth = maxDepth(ipParanth)
//print("max depth--", opMaxDepth)// 3

// Roman to interger..
// Optimum way
// TC: O(N)
// SC: O(1)
func romanToInt(_ s: String) -> Int {
    var ans = 0, num = 0
    
    for i in stride(from: s.count - 1, to: -1, by: -1) {
        switch String(s[s.index(s.startIndex, offsetBy: i)]) {
            case "I": num = 1
            case "V": num = 5
            case "X": num = 10
            case "L": num = 50
            case "C": num = 100
            case "D": num = 500
            case "M": num = 1000
            default: num = 1
        }
        if ans > 4 * num {
            ans -= num
        } else {
            ans += num
        }
    }
    return ans
}

// TC: O(N)
// SC: O(N)
func romanToInt2(_ s: String) -> Int {
      var prev = 0, out = 0
       let dict: [Character:Int] = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]

     for i in s {
         let val = dict[i] ?? 0
         let calculation = (val <= prev) ? prev : -prev
         out += calculation
         prev = val
     }
     out += prev
     return out
}

let strRoman = "IV"
let opRoamn = romanToInt(strRoman)
//print("roman-- ", opRoamn)// 4

// Question: A to i
/**
 Handle:--
 ..123  -> 123
 ..-123  -> -123
 ab123a  -> 0
 ..-+123  -> 0
 ..+-123  -> 0
 123abc-  -> 123

 -99999999999999999  -> -2147483648
 00999999999999999  -> 2147483647
 2147483648  -> 2147483647
 -2147483648 -> -2147483648
 */

// TC: O(N)
// SC: O(1)
func myAtoi(_ s: String) -> Int {
    var result = 0// Outpuut
    var sign = 1 // 1 means positive -1 means negative(further multiply)
    var isStarted = false // To skip invalid character.
    for char in s {
        if char == " " {
            if isStarted {
                break
            }
        } else if (char == "-" || char == "+") {
            if isStarted {
                break
            }
            isStarted = true
            if char == "-" {
                sign = -1
            }
        } else if char >= "0" && char <= "9" {
            isStarted = true
            if let val = char.wholeNumberValue {
                result = result*10+val
            }
            if result > Int32.max {
                return sign == 1 ? Int(Int32.max) : Int(Int32.min)
            }
        } else {
            break
        }
    }
    return result*sign
}

let atoiString = "  43   "//"        42       "// "   -42"//"4193 with words"
let atoiOutput = myAtoi(atoiString)
//print("output is--  ", atoiOutput)// 43


// Question: count with k diffrent charcters.
// TC: O(nXn)
// SC: O(1) Only 26 size array is used, which can be considered constant space.

func most_k_chars(_ s: String, _ k: Int) -> Int {
    if s.isEmpty { return 0 }
    var map:[Character:Int] = [:]
    var num = 0, left = 0
    
    for char in s.indices {
        map[s[char], default:0] += 1
        
        while map.count > k {
            let leftIndex = s[s.index(s.startIndex, offsetBy: left)]
            map[leftIndex, default:0] -= 1
            if map[leftIndex] == 0 {
                map[leftIndex] = nil
            }
            left+=1
        }
        
        if let i = s.firstIndex(of: s[char]) {
            let indexEl: Int = s.distance(from: s.startIndex, to: i)
            num += indexEl - left + 1
        }
    }
    return num
}

func exact_k_chars(_ s: String, _ k: Int) -> Int {
    return most_k_chars(s, k) - most_k_chars(s, k - 1)
}

var s1 = "abcdefghij"
var k1 = 5
//print("Total substrings with exactly ", k1 , " distinct characters : " ,exact_k_chars(s1, k1))// 6

// Question find longest palindrom.

func longestPalindrome(_ s: String) -> String {
    let n = s.count
    var res = ""
    var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

    
    for i in stride(from: s.count - 1, to: -1, by: -1) {
        for j in i..<n {
            let iIndexObj = s[s.index(s.startIndex, offsetBy: i)]
            let jIndexObj = s[s.index(s.startIndex, offsetBy: j)]

            dp[i][j] = iIndexObj == jIndexObj && (j - i < 3 || dp[i + 1][j - 1])
            
            if (dp[i][j] && (res == "" || j - i + 1 > res.count)) {
                let range = s.index(s.startIndex, offsetBy: i)...s.index(s.startIndex, offsetBy: j)
                res = String(s[range]) //s.substring(i, j + 1)
            }
        }
    }
    return res
}

let inputStrPalin = "babad"
let opPalin = longestPalindrome(inputStrPalin)
print("palin---", opPalin)


