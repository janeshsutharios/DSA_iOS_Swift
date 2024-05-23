// Selection Sort..
// TC: O(n^2)
// SC: O(1)
func selectionSort(_ arr: inout [Int]) {
    
    for i in 0..<arr.count {
        var minIndex = i
        for j in i+1..<arr.count {
            if arr[j] < arr[minIndex] {
                minIndex = j
            }
        }
        arr.swapAt(i, minIndex)
    }
}
//
//var arrayToSort: [Int] = [9,2,11,24,1,5]
//selectionSort(&arrayToSort)
//print("Sorted Array--> ", arrayToSort)// [1, 2, 5, 9, 11, 24]

// Bubble Sort
// TC: O(n^2)
// SC: O(1)


      
func bubbleSort(_ arr: inout [Int]) {
    for i in 0..<arr.count-1 {
        for j in 0..<arr.count-i-1 {
            if arr[j] > arr[j+1] {
                arr.swapAt(j, j+1)
                print("swappp->", arr, i)
            }
        }
    }
}
//var arrayToSort: [Int] = [9,2,11,4,1]
//bubbleSort(&arrayToSort)
//print("Sorted Array--> ", arrayToSort)// [2, 4, 9, 11]
//

// Bubble sort using recursion with optimisation


func bubbleSort(_ arr: inout [Int], _ n: Int) {
    // Base Case: range == 1.
    if n == 1 {
        return
    }

    var didSwap = false
    for j in 0..<n-1 {
        if arr[j] > arr[j + 1] {
            let temp = arr[j + 1]
            arr[j + 1] = arr[j]
            arr[j] = temp
            didSwap = true
        }
    }

    // If no swapping happens.
    if !didSwap {
        return
    }

    // Range reduced after recursion:
    bubbleSort(&arr, n - 1)
}

// Example usage:
var array = [64, 34, 25, 12, 22, 11, 90]
bubbleSort(&array, array.count)
print(array) // Output: [11, 12, 22, 25, 34, 64, 90]


// Insertion Sort
// TC: O(n^2) worst . O(n). Best
// SC: O(1)
/**
 In Insertion sort we sort using two sets. One is Sorted set Another is unsorted one. Initially we sorted is index 0 element & rest is unsroted set. Now we move forward one by one with unsorted array & compare element & pick element from unsorted to sorted one At the right place.<While finding the right place we swap data using inner while loop..>
 
 */
func insertionSort(_ arr: inout [Int]) {
    
    for i in 1..<arr.count {
        var current = arr[i]
        var j = i - 1
        while j >= 0 && arr[j] > current {
            arr[j + 1] = arr[j]
            j -= 1
        }
        arr[j + 1] = current
       // print("arr-->", arr, j)
    }
}


var arrayToSort: [Int] = [5,4,10,1,6,2]
insertionSort(&arrayToSort)
//print("Sorted Array--> ", arrayToSort) // [1, 2, 4, 5, 6, 10]

// Insertion Sort with recursion.
func insertionSort(_ arr: inout [Int], _ i: Int, _ n: Int) {
    // Base Case: i == n.
    if i == n {
        return
    }

    var j = i
    while j > 0 && arr[j - 1] > arr[j] {
        let temp = arr[j - 1]
        arr[j - 1] = arr[j]
        arr[j] = temp
        j -= 1
    }

    insertionSort(&arr, i + 1, n)
}

// Example usage:
//var array = [64, 34, 25, 12, 22, 11, 90]
//insertionSort(&array, 0, array.count)
//print(array) // Output: [11, 12, 22, 25, 34, 64, 90]



// Merge Sort...
func mergeSort(_ arr: inout [Int], _ l: Int, _ r: Int) {
    //print("MS called with ", l,r)
    if (l < r) {
        let mid = (l + r) / 2;
        mergeSort(&arr, l, mid); // left half // Divide
        mergeSort(&arr, mid + 1, r); // right half // Divide
        mergeSortConquer(&arr, l, mid, r); // merging sorted halves// Conquer
    } else {
       // print("Discarded--> ", l,r)
    }
}

func mergeSortConquer(_ arr: inout [Int],  _ lowerBound: Int,  _ mid: Int,  _ upperBound: Int) {
    var i = lowerBound; // starting index of left half of array
    var j = mid + 1; // starting index of right half of array
    var k = lowerBound; // k is index used to transfer elements in temp array
    var tempArray: [Int] = Array.init(repeating: 0, count: arr.count) // temp array
   // print(lowerBound, upperBound, "entered here for sorting INDEX -->", i, j, upperBound, " -- Respective Values-->", arr[i], arr[j])
   // print("entered with", lowerBound ,mid, upperBound)
    // storing elements in the temp array in a sorted manner//
    
    while i <= mid && j <= upperBound {
        if (arr[i] < arr[j]) {
            tempArray[k] = arr[i];
            i+=1;
        } else {
            tempArray[k] = arr[j];
            j+=1;
        }
        k+=1;
    }
    // Note:- In below code we are transfering the element from any two subarray
    // if elements on the left half are still available to insert //
    
    if i > mid {
        while j <= upperBound {
            //print("Left entered in if loop...", arr[j])
            tempArray[k] = arr[j];
            k+=1;
            j+=1;
        }
    } else {
        // if elements on the right half are still available to insert  //
        while i <= mid {
            // print("Right entered in if loop...", arr[i])
            tempArray[k] = arr[i];
            k+=1;
            i+=1;
        }
    }
    // transfering all elements from temprary to arr //
    for k in lowerBound...upperBound {
        arr[k] = tempArray[k];
    }
   print("tempArray---------", tempArray)
}

//var arr = [8, 7, 6, 5]
//mergeSort(&arr, 0, arr.count - 1)
//print("merge Sort-->", arr)

//Approach #1 create pivot element & sort elements which are lesser than the pivot to right & bigger on left.
// Here we are taking pivot as last element...
func quickSort(_ arr: inout [Int], _ lowerBound: Int, _ upperBound: Int) {
    if lowerBound < upperBound {
        let pivot = partition(&arr, lowerBound, upperBound)
       // print("pivot is-->", pivot)
        quickSort(&arr, lowerBound, pivot-1)
        quickSort(&arr, pivot+1, upperBound)
    }
}

func partition(_ arr: inout [Int], _ lowerBound: Int, _ upperBound: Int) -> Int {
   // print("part-- lower, upper---->", lowerBound, upperBound)
    let pivot = arr[upperBound] // pivot
    var i = (lowerBound - 1) // Index of smaller element and indicates the right position of pivot found so far
    for j in lowerBound..<upperBound {
        // If current element is smaller than the pivot
        if arr[j] < pivot {
            i+=1 // increment index of smaller element
            arr.swapAt(i, j)
        }
    }
    i+=1
    arr.swapAt(i,upperBound)// Placing the  pivot at right position so xx(lesser elements) Pivot xx(larger elements)
    return i
}
var arr = [8, 7, 6, 5]
quickSort(&arr, 0, arr.count - 1)
print("Quick Sort-->", arr)

