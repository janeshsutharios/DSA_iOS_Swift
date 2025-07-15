#1 We can add multiple elements on min as - min(bCounts,aCounts,lCounts/2,oCounts/2,nCounts)
#2 Int to Char conversion - let char = Character(UnicodeScalar(i + Int(Character("a").asciiValue!))!)
#3 Char to Int conversion - let index = Int(char.asciiValue! - Character("a").asciiValue!)

// MARK: How to access string index
let name = "Janesh"
print("second char", name[name.index(name.startIndex, offsetBy: 1)])
print("third last char", name[name.index(name.endIndex, offsetBy: -3)])

// MARK: indices on loop
  for characterIndex in firstWord.indices {

// MARK: Time complexity of various Array, Dictionary & Set Operations. 
arr.contains(curr) is O(n)  //Every time you call arr.contains(...), Swift has to linearly search the array.
set.contains(curr) is O(1)  //Sets in Swift use hashing, so lookup is constant time.
arr.append(x)               // O(1)   // Appending at end is fast
arr.insert(x, at: i)        // O(n)   // Inserting in middle/front shifts elements
set.insert(x)               // O(1)   // Constant time insert
dict[key] = value           // O(1)   // Constant time insert/update

arr.count                   // O(1)   // Stored internally
set.count                   // O(1)   // Stored internally
dict.count                  // O(1)   // Stored internally
