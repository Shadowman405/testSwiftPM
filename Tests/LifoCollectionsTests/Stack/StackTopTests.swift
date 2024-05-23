import XCTest
import LifoCollections

final class StackTopTests: XCTestCase {
    private var stack = Stack<Int>()

    func testWithEmptyStackReturnsNil() {
        // Given an empty stack
        // When, Then
        XCTAssertNil(stack.top())
    }

    func testWithSeveralElementsInStackReturnsLastAddedElement() {
        // Given
        stack.push(3)
        stack.push(-6)
        stack.push(99)

        // When, Then
        XCTAssertEqual(stack.top(), 99)
    }

    func testDoesNotRemoveElementInStack() {
        // Given
        stack.push(320)
        stack.push(-63)

        // When
        _ = stack.top()

        // Then
        let elementsInStack = stack.count
        XCTAssertEqual(elementsInStack, 2)
    }
}
