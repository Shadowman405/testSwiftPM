import LifoCollections
import XCTest

final class StackStatisticsTopTests: XCTestCase {
    private var stack = StackStatistics<Int>()

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
        let expectedCount = stack.count

        // When
        _ = stack.top()

        // Then
        XCTAssertEqual(stack.count, expectedCount)
    }
}
