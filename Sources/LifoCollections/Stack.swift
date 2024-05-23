/// A data structure that follows the Last-In-First-Out (LIFO) principle,
/// where the last element added is the first to be deleted.
public struct Stack<Element> {
    private var elements: [Element]

    /// Creates a new instance of the stack with initial elements.
    /// - Parameter elements: Elements to store in the stack.
    /// The initial elements to be added to the stack
    /// in the order they appear in the array.
    /// The first element in the array will be
    /// the last one to be removed from the stack.
    public init(_ elements: [Element] = []) {
        self.elements = elements
    }

    /// The number of elements in the stack.
    public var count: Int {
        elements.count
    }

    /// A Boolean value indicating whether the stack is empty.
    public var isEmpty: Bool {
        elements.isEmpty
    }

    /**
     Adds a new element to the stack.

     - Complexity: O(1) on average, over many calls to `append(_:)` on the same array.
     In the worst case scenario, the complexity will be O(`n`), 
     where `n` is the number of elements in the stack.
     - Parameter element: The element to be added to the stack
     */
    public mutating func push(_ element: Element) {
        elements.append(element)
    }

    /**
     Removes the top element (the most recently added element) 
     from the stack and returns its value.

     - Complexity: O(1).
     - Returns: The value of the deleted element. If the stack was empty, returns `nil`.
     */
    @discardableResult
    public mutating func pop() -> Element? {
        elements.popLast()
    }

    /**
     Returns the top element (the most recent added element) 
     from the stack without removing the element.

     - Complexity: O(1).
     - Returns: The value of the top element in the stack. If the stack was empty, returns `nil`.
     */
    public func top() -> Element? {
        elements.last
    }
}
