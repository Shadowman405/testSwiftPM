import XCTest
import LifoCollections

final class StackPopTests: XCTestCase {
    private var stack = Stack<Int>()

    func testWithEmptyStackReturnsNil() {
        // Given an empty stack
        // When, Then
        XCTAssertNil(stack.pop())
    }

    func testRemovesElementFromStack() {
        // Given
        let expectedStackCount = stack.count
        stack.push(1)

        // When
        stack.pop()

        // Then
        XCTAssertEqual(stack.count, expectedStackCount)
    }

    func testReturnsValueOfRemovedElement() {
        // Given
        let expectedReturnElement = 320
        stack.push(expectedReturnElement)

        // When
        let removedElement = stack.pop()

        // Then
        XCTAssertEqual(removedElement, expectedReturnElement)
    }

    func testRemovesAddedElementsInReversedOrder() {
        // Given
        let pushedElements = [1, 2, 3]
        let reversedPushedElements: [Int] = pushedElements.reversed()
        for element in pushedElements {
            stack.push(element)
        }

        // When
        var poppedElements = [Int]()
        while let removedElement = stack.pop() {
            poppedElements.append(removedElement)
        }

        // Then
        XCTAssertEqual(poppedElements, reversedPushedElements)
    }

    func testRemovesOnlyOneElementFromStack() {
        // Given
        stack.push(320)
        stack.push(-63)

        // When
        stack.pop()

        // Then
        let elementsInStack = stack.count
        XCTAssertEqual(elementsInStack, 1)
    }
}
