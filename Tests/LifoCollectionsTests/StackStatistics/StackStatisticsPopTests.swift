import LifoCollections
import XCTest

final class StackStatisticsPopTests: XCTestCase {
    private var stack = StackStatistics<Int>()

    func testWithEmptyStackReturnsNil() {
        // Given an empty stack
        // When, Then
        XCTAssertNil(stack.pop())
    }

    func testRemovesElementFromStack() {
        // Given
        let expectedStackStatisticsCount = stack.count
        stack.push(1)

        // When
        stack.pop()

        // Then
        XCTAssertEqual(stack.count, expectedStackStatisticsCount)
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
        let stackSizeBeforePop = stack.count
        let expectedStackSizeAfterPop = stackSizeBeforePop - 1

        // When
        stack.pop()

        // Then
        XCTAssertEqual(stack.count, expectedStackSizeAfterPop)
    }
}
