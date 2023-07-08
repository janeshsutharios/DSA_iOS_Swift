import UIKit

var greeting = "Hello, playground"

class Node<T> {

    let value: T?

    var next: Node<T>?



    init(value: T, next: Node<T>?) {

        self.value = value

        self.next = next

    }

}



class LinkedList<T> {

    var head: Node<T>? = nil



    func insertAtIndex(value: T, position: Int) {

        var k = 1, current = head, newNode: Node<T>?

        newNode = Node(value: value, next: nil)


// invalid entry attempting to insert on nil list with n+1index
        if head == nil && position > 1 {
            return print("Position is not determined")
        }


        // insert into empty list
        if head == nil && position == 1 {
            head = newNode
        }

        if position == 1 {
            newNode?.next = current
            head = newNode

        } else {
            // position = 3
           // 1 < 2
            while current != nil && k < position - 1 {
                k += 1
                current = current?.next
            }

            newNode?.next = current?.next

            current?.next = newNode

        }

    }





    func displayItems() {

        var current = head

        if head == nil {

            return print("List is empty")

        }

        while current != nil {

            print("Link List--->  \(String(describing: current?.value))")

            current = current?.next

        }

    }



    func reveserLL(head: Node<T>?) -> Node<T>? {

        var current = head, next: Node<T>?, temp: Node<T>?



        if head == nil  {

            print("List is empty")

            return nil

        }



        if head?.next == nil {

            return head

        }



        while current != nil {

            next = current?.next

            current?.next = temp

            temp = current

            current = next

        }



        return temp

    }



    func reverseList(_ head: Node<T>?) -> Node<T>? {



        guard let head = head else { return nil}



        if head.next == nil{

            return head

        }



        let newHead = reverseList(head.next)

        head.next?.next = head

        head.next = nil

        return newHead

    }

}
let linkList = LinkedList<Int>()
linkList.insertAtIndex(value: 10, position: 1)
linkList.insertAtIndex(value: 20, position: 2)
linkList.insertAtIndex(value: 30, position: 3)
linkList.displayItems()

