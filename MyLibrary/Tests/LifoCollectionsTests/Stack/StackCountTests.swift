import XCTest
import LifoCollections

final class StackCountTests: XCTestCase {
    private var stack = Stack<Int>()

    func testWithEmptyStackReturnsZero() {
        // Given an empty stack
        // When, Then
        XCTAssertEqual(stack.count, 0)
    }

    func testWithOneElementInStackReturnsOne() {
        // Given
        stack.push(1)

        // When
        let expectedCountOfElements = stack.count

        // Then
        XCTAssertEqual(stack.count, expectedCountOfElements)
    }
}
