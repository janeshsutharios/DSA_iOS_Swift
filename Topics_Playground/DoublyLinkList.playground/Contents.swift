import Darwin

public class LinkListNode<T> {
    
    var value: T
    var previousNode:LinkListNode?
     var nextNode:LinkListNode?
    
    public init(value : T) {
        self.value = value
    }
}

public class DoublyLinkList<T> {
    
    public typealias DLNode = LinkListNode<T>
    private var head: DLNode?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var firstNode:DLNode? {
        return head
    }
    
    public var endNode: DLNode? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.nextNode {
            node = next
        }
        return node
    }
    
    
    public func appendToLast(value:T) {
        let newNode = DLNode(value: value)
        if let lastNode = endNode {
            newNode.previousNode = lastNode
            lastNode.nextNode = newNode
        } else {
            head = newNode
        }
    }
    public var totalNodes:Int {
        guard var node = head else { return 0 }
        var count = 1
        while let unwrapNextNode = node.nextNode {
            count += 1
            node = unwrapNextNode
        }
        return count
    }
    
    public func node(atIndex index: Int) -> DLNode {
      if index == 0 {
        return head!
      } else {
        var node = head!.nextNode
        for _ in 1..<index {
          node = node?.nextNode
          if node == nil { //(*1)
            break
          }
        }
        return node!
      }
    }
    
}

let dllist = DoublyLinkList<Int>()

dllist.appendToLast(value: 1)
dllist.appendToLast(value: 2)
dllist.appendToLast(value: 3)
dllist.appendToLast(value: 4)
dllist.appendToLast(value: 5)

dllist.firstNode?.value
dllist.endNode?.value
print("Total Nodes--->", dllist.totalNodes)
print("Node At index", dllist.node(atIndex: 0).value)
print("Node At index", dllist.node(atIndex: 1).value)
print("Node At index", dllist.node(atIndex: 2).value)
print("Node At index", dllist.node(atIndex: 3).value)
print("Node At index", dllist.node(atIndex: 4).value)
