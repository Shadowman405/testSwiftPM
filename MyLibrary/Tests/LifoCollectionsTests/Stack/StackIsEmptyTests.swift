import XCTest
import LifoCollections

final class StackIsEmptyTests: XCTestCase {
    private var stack = Stack<Int>()

    func testEmptyStackReturnsTrue() {
        // Given an empty stack
        // When, Then
        XCTAssertTrue(stack.isEmpty)
    }

    func testWithOneElementInStackReturnsFalse() {
        // Given
        stack.push(50)

        // When, Then
        XCTAssertFalse(stack.isEmpty)
    }
}
