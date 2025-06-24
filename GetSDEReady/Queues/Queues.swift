// https://getsdeready.com/courses/dsa/lesson/implement-stack-using-queues/
// https://leetcode.com/problems/implement-stack-using-queues/
class MyStack {
    private var queue: [Int] = []

    // Push element x onto stack.
    func push(_ x: Int) {
        queue.append(x)
        // Rotate: move all elements before x to the back
        for _ in 0..<queue.count - 1 {
            queue.append(queue.removeFirst())
        }
    }

    // Removes the element on top of the stack and returns it.
    func pop() -> Int {
        return queue.removeFirst()
    }

    // Get the top element.
    func top() -> Int {
        return queue.first!
    }

    // Returns whether the stack is empty.
    func empty() -> Bool {
        return queue.isEmpty
    }
}

// https://getsdeready.com/courses/dsa/lesson/first-unique-character-in-a-string/
// https://leetcode.com/problems/first-unique-character-in-a-string/
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var frequency: [Character: Int] = [:]

        // 1. Count frequency of each character
        for char in s {
            frequency[char, default: 0] += 1
        }

        // 2. Find first character with frequency 1
        for (index, char) in s.enumerated() {
            if frequency[char] == 1 {
                return index
            }
        }

        // 3. No unique character found
        return -1
    }
}
// https://getsdeready.com/courses/dsa/lesson/implement-queue-using-stacks/
// https://leetcode.com/problems/implement-queue-using-stacks/
// Note # It only works if it's executed in order as per given in the question.
class MyQueue {
    private var inStack: [Int] = []
    private var outStack: [Int] = []

    // Push element x to the back of queue
    func push(_ x: Int) {
        inStack.append(x)
    }

    // Removes the element from in front of queue and returns it
    func pop() -> Int {
        if outStack.isEmpty {
            transfer()
        }
        return outStack.removeLast()
    }

    // Get the front element
    func peek() -> Int {
        if outStack.isEmpty {
            transfer()
        }
        return outStack.last!
    }

    // Returns whether the queue is empty
    func empty() -> Bool {
        return inStack.isEmpty && outStack.isEmpty
    }

    // Transfer elements from inStack to outStack
    private func transfer() {
        while let value = inStack.popLast() {
            outStack.append(value)
        }
    }
}


/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
// https://getsdeready.com/courses/dsa/lesson/time-needed-to-buy-tickets/
// https://leetcode.com/problems/time-needed-to-buy-tickets/
class Solution {
    func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
        var time = 0                         // Total time counter
        let target = tickets[k]             // Number of tickets person at index k needs

        for i in 0..<tickets.count {
            if i <= k {
                // If the person is before or exactly at position k,
                // they get served in all `target` rounds (or less if they have fewer tickets)
                time += min(tickets[i], target)
            } else {
                // If the person is after k,
                // they only get served in the first `target - 1` rounds because
                // person k leaves the queue after their last ticket
                time += min(tickets[i], target - 1)
            }
        }

        return time                         // Return the total time taken until person k is done
    }
}
