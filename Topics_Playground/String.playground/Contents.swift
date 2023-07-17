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
print("opCommonStr-- ", opCommonStr)// "fl"

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
print("isISO--- ", isISO) // true
