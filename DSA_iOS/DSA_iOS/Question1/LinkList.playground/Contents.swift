import UIKit




public class Node<Value> {

  public var value: Value
  public var next: Node?

  public init(value: Value, next: Node? = nil) {
    self.value = value
    self.next = next
  }
}

extension Node: CustomStringConvertible {

  public var description: String {
    guard let next = next else {
      return "\(value)"
    }
    return "\(value) -> " + String(describing: next) + " "
  }
}

  let node1 = Node(value: 1)
  let node2 = Node(value: 2)
  let node3 = Node(value: 3)

  node1.next = node2
  node2.next = node3

print("Node output==== ",node1)

/**                                         */

public struct LinkedList<Value> {

  public var head: Node<Value>?
  public var tail: Node<Value>?

  public init() {}

  public var isEmpty: Bool {
    head == nil
  }
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
    // Adding Elements at start of the link List(That is Head)
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    //Adding elements to end or array..
    public mutating func append(_ value: Value) {

      // 1
      guard !isEmpty else {
        push(value)
        return
      }

      // 2
      tail!.next = Node(value: value)

      // 3
      tail = tail!.next
    }

    //Inserting node at specific location
    
    public func node(at index: Int) -> Node<Value>? {
      // 1
      var currentNode = head
      var currentIndex = 0

      // 2
      while currentNode != nil && currentIndex < index {
        currentNode = currentNode!.next
        currentIndex += 1
      }

      return currentNode
    }

    
    // 1
    @discardableResult
    public mutating func insert(_ value: Value,
                                after node: Node<Value>)
                                -> Node<Value> {
      // 2
      guard tail !== node else {
        append(value)
        return tail!
      }
      // 3
      node.next = Node(value: value, next: node.next)
      return node.next!
    }

    
}


  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)

  print("NewLinkList==== ", list)

