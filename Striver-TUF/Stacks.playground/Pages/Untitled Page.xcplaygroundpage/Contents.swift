import UIKit

public struct Stack<Element> {
    
    private var storage: [Element] = []
    
    public init() { }
}

extension Stack: CustomDebugStringConvertible {
    
    public var debugDescription: String {
    """
    ----top----
    \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
    -----------
    """
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    public func peek() -> Element? {
        storage.last
    }
    
    public var isEmpty: Bool {
        peek() == nil
    }
    
}


var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)

print("top element-->", stack.peek())

print("stack is -->",stack)

if let poppedElement = stack.pop() {
    assert(4 == poppedElement)
    print("Popped: \(poppedElement)")
}


