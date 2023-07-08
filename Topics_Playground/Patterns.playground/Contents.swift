import UIKit


// Change to qw1
// Change to print.
/*
 // Question 1: print a square based on input integer.
***
***
***
------------
 */
func printSquare(_ n: Int) {
    for _ in 1...n {
        for _ in 1...n {
            print("*", terminator: "")
        }
        print("\n")
    }
}
//printSquare(3)

/*
 // Question 2: print a ladder star pattern.
*
**
***
****
------------
 */
func printLadderStar(_ n: Int) {
    for i in 0..<n {
        print("*", terminator: "")
        for _ in 0..<i {
            print("*", terminator: "")
        }
        print("\n")
    }
}
//printLadderStar(4)


/*
 // Question 3: print a ladder numbers pattern.
 1
 1 2
 1 2 3
 1 2 3 4
 1 2 3 4 5
------------
 */

func printLadderNumber(_ n: Int) {
    for i in 1...n {
        for j in 1...i {
            print(j, terminator: "")
        }
        print("\n")
    }
}
//printLadderNumber(4)

/*
 // Question 4: print a ladder numbers pattern 2.
 1
 2 2
 3 3 3
 4 4 4 4
 5 5 5 5 5
------------
 */

func printLadderSameNumber(_ n: Int) {
    for i in 1...n {
        for _ in 1...i {
            print(i, terminator: "")
        }
        print("\n")
    }
}
//printLadderSameNumber(5)


/*
 // Question 5: print a reverse Ladder start pattern
 * * * * *
 * * * *
 * * *
 * *
 *
------------
 */

func printReverseLadderStar(_ n: Int) {
    for i in 1...n {
        for _ in i...n {
            print("*", terminator: "")
        }
        print("\n")
    }
}
//printReverseLadderStar(5)

/*
 // Question 6: print a reverse Ladder Numbers pattern
 1 2 3 4 5
 1 2 3 4
 1 2 3
 1 2
 1
------------
 */

func printReverseLadderNumers(_ n: Int) {
    for i in 1...n {
        for j in i...n {
            print(j, terminator: "")
        }
        print("\n")
    }
}
//printReverseLadderNumers(5)

/*
 // Question 6(b): print a reverse Ladder same Numbers pattern
 11111
 2222
 333
 44
 5
------------
 */

func printReverseLadderSameNumers(_ n: Int) {
    for i in 1...n {
        for _ in i...n {
            print(i, terminator: "")
        }
        print("\n")
    }
}
//printReverseLadderSameNumers(5)

/*
 // Question 7: print a cone shape pattern
     *
    ***
   *****
 */

func printConeStar(_ n: Int) {
    for i in 0..<n {
        for _ in i..<n-1 {
            print(" ", terminator: "")
        }
        print("*", terminator: "")
        for _ in 0..<i {
            print("**", terminator: "")
        }
        print("\n")
    }
}

//printConeStar(5)

/*
 // Question 8: print reverse cone
 *********
  *******
   *****
    ***
     *
 ---------------
 */

func printReverseConeStar(_ n: Int) {
    
    for i in stride(from: n, to: 0, by: -1) {

        for _ in 1..<(n - i) + 1 {
            print(" ", terminator: "")
        }

        for _ in 1..<(2 * i - 1) + 1{
            print("*", terminator: "")
        }
        print("\n")
    }
                
}
//printReverseConeStar(5)

/*
// Question 9 : print diamond
    *
   ***
  *****
  *****
   ***
    *
---------------
*/

func printDiamond(_ n: Int) {
   
    for i in 0..<n {
        for _ in i..<n-1 {
            print(" ", terminator: "")
        }
        print("*", terminator: "")
        for _ in 0..<i {
            print("**", terminator: "")
        }
        print("", terminator: "\n")
    }
    
    for i in stride(from: n-1, to: 0, by: -1) {
        for _ in 1..<(n - i) + 1 {
            print(" ", terminator: "")
        }
        for _ in 1..<(2 * i - 1) + 1{
            print("*", terminator: "")
        }
        print("", terminator: "\n")
    }
}
 printDiamond(3)

/*
// Question 10 : print Triangle
 *
 **
 ***
 ****
 ***
 **
 *
---------------
*/

func printTriangle(_ n: Int) {
    for i in 0..<n {
        print("*", terminator: "")
        for _ in 0..<i {
            print("*", terminator: "")
        }
        print("\n")
    }
    for i in 1...n-1 {
        for _ in i...n-1 {
            print("*", terminator: "")
        }
        print("\n")
    }
}

//printTriangle(4)


/*
// Question 11 : Binary digits Right Angle triangle.
1
01
101
0101
10101
---------------
*/

func printBinaryTriangle(_ n: Int) {
    for i in 0..<n {
        print(i%2 == 0 ? 1 : 0, terminator: "")
        for j in 0..<i {
            print((i+j)%2 == 0 ? 0 : 1, terminator: "")
        }
        print("", terminator: "\n")// Helps for printing new line
    }
}

//printBinaryTriangle(5)


/*
// Question 12 : Print M Star pattern..
 
 1                 1
 1 2             2 1
 1 2 3         3 2 1
 1 2 3 4     4 3 2 1
 1 2 3 4 5 5 4 3 2 1
---------------
*/

func printMPattern(_ n: Int) {
    for i in 1...n {
        for j in 1...i {
            print(j, terminator: "")
        }
        for _ in stride(from: n, to: i, by: -1) {
             print("  ", terminator: "")
         }
        for l in stride(from: i, to: 0, by: -1) {
            print(l, terminator: "")
        }

        print("", terminator: "\n")// Helps for printing new line
    }
}

//printMPattern(4)


/*
// Question 13 : Triangle with increment numbers
 
 1
 2 3
 4 5 6
 7 8 9 10
 11 12 13 14 15
---------------
*/

func printTriangleWithIncrementNumbers(_ n: Int) {
    var count = 1
    for i in 1...n {
        for j in 1...i {
            print(count, terminator: " ")
            count+=1
        }
        print("", terminator: "\n")// Helps for printing new line
    }
}

//printTriangleWithIncrementNumbers(5)


/*
// Question 14 : Inclined Triangle with ABCD
 
 A
 AB
 ABC
 ABCD
 ABCDE
---------------
*/

func printInclinedTriangleABCD(_ n: Int) {
    for i in 1...n {
        var ascii = 65
        for _ in 1...i {
            print(String(UnicodeScalar(ascii)!), terminator: " ")
            ascii+=1
        }
        print("", terminator: "\n")// Helps for printing new line
    }
}

//printInclinedTriangleABCD(5)

/*
// Question 15 : Inverted Triangle with ABCD
 ABCDE
 ABCD
 ABC
 AB
 A
---------------
*/

func printInvertedTriangleABCD(_ n: Int) {
    for i in 1...n {
        var ascii = 65
        for _ in i...n {
            print(String(UnicodeScalar(ascii)!), terminator: " ")
            ascii+=1
        }
        print("", terminator: "\n")// Helps for printing new line
    }
}

//printInvertedTriangleABCD(5)


/*
// Question 16 : Inclined Triangle with ABCD Repetative
 
 A
 BB
 CCC
 DDDD
 EEEEE
---------------
*/

func printInclinedTriangleABCDRepetative(_ n: Int) {
    var ascii = 65
    for i in 1...n {
        for _ in 1...i {
            print(String(UnicodeScalar(ascii)!), terminator: "")
        }
        ascii+=1
        print("", terminator: "\n")// Helps for printing new line
    }
}

//printInclinedTriangleABCDRepetative(5)

/*
// Question 17 : Inclined Triangle with ABCD Repetative
    A
   ABA
  ABCBA
 ABCDCBA
---------------
*/

func printTriangleABCDRepetative(_ n: Int) {
    var ascii = 65
    for i in 1...n {
        for j in 1...n+i-1 {
            if(j<n-i+1){
                print(" ", terminator: "")
            }
            else if(j>=n-i+1&&j<n){
                print(String(UnicodeScalar(ascii)!), terminator: "")
                ascii+=1
            }
            else if(j==n){
                print(String(UnicodeScalar(ascii)!), terminator: "")
            }
            else if(j>n&&j<=n+i-1){
                ascii-=1
                print(String(UnicodeScalar(ascii)!), terminator: "")
            }
        }
      //  ascii+=1
        print("", terminator: "\n")// Helps for printing new line
    }
}

//printTriangleABCDRepetative(4)


/*
// Question 18 : print reverse ABCD on triangle
 E
 E D
 E D C
 E D C B
 E D C B A
---------------
*/

func printReverseABCD(_ n: Int) {
    var ascii = 65
    for i in 0..<n {
        for j in 0..<i+1 {
            print(String(UnicodeScalar(ascii+n-1-j)!), terminator: " ")
        }
        print("", terminator: "\n")// Helps for printing new line
    }
}

//printReverseABCD(5)


/*
// Question 22 : print Square with decreasing values
 4 4 4 4 4 4 4
 4 3 3 3 3 3 4
 4 3 2 2 2 3 4
 4 3 2 1 2 3 4
 4 3 2 2 2 3 4
 4 3 3 3 3 3 4
 4 4 4 4 4 4 4
---------------
*/

func printSquaresWithNumbers(_ n: Int) {
    for i in 1..<2*n {
        for j in 1..<2*n {
            // cout << max(abs(n-i) + 1,abs(n-j) + 1) << " ";
            print(max(abs(n-i) + 1,abs(n-j) + 1), terminator: " ")
        }
        print("", terminator: "\n")// Helps for printing new line
    }
}

//printSquaresWithNumbers(4)

//
/*
// Question 21 : print Square with Hole
 ****
 *  *
 *  *
 ****
---------------
*/

func printSquaresWithHole(_ n: Int) {
    for i in 1...n {
        for j in 1...n {
            if (i==1 || i==n || j==1 || j==n) {
                print("*", terminator: "")
            } else {
                print(" ", terminator: "")
            }
        }
        print("", terminator: "\n")// Helps for printing new line
    }
}

//printSquaresWithHole(4)



/*
// Question 20 : print ButterFly
 *      *
 **    **
 ***  ***
 ********
 ***  ***
 **    **
 *      *
---------------
*/

func printButterFly(_ n: Int) {
    for i in 1...2*n {
        for j in 1...2*n {
            if(i<=n){
                if((j<=i)||(j>2*n-i)){
                    print("*", terminator: "")
                }else{
                    print(" ", terminator: "")
                }
            }
            else if(i>n){
                if((j <= 2*n - i) || j > i ){
                    print("*", terminator: "")
                } else{
                    print(" ", terminator: "")
                }
            }
        }
        print("", terminator: "\n")// Helps for printing new line
    }
}

//printButterFly(4)


/*
// Question 18 : print Alphabate custom Pattern
 E
 ED
 EDC
 EDCB
 EDCBA
---------------
*/

func printABCDCustomPattern(_ n: Int) {
    for i in 0..<n {
        for j in 0...i {
            let ch = 65 + n - 1 - j;
            print(String(UnicodeScalar(ch)!), terminator: "")
        }
        print("", terminator: "\n")// Helps for printing new line
    }
}
//printABCDCustomPattern(5)






/*
// Question 19 : print Triangle With Hole
 *******
 *** ***
 **   **
 *     *
 **   **
 *** ***
 *******
---------------
*/

func printTriangleHole(_ n: Int) {
    var a = n
    var b = n
    for _ in 1..<n {
        for j in 1..<2*n {
            if(j>a && j<b){
                print(" ", terminator: "")
            } else {
                print("*", terminator: "")
            }
        }
        print("", terminator: "\n")
        a=a-1;
        b=b+1;
    }
    a=1;
    b=2*n;
    b-=1
    for _ in 0..<n {
        for j in 1..<2*n {
            if(j>a && j<b){
                print(" ", terminator: "")
            } else {
                print("*", terminator: "")
            }
        }
        print("", terminator: "\n")
        a=a+1;
        b=b-1;
    }
}
//printTriangleHole(4)


