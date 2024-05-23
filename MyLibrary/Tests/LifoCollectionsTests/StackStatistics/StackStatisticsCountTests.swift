import LifoCollections
import XCTest

final class StackStatisticsCountTests: XCTestCase {
    private var stack = StackStatistics<Int>()

    func testWithEmptyStackReturnsZero() {
        // Given an empty stack
        // When, Then
        XCTAssertEqual(stack.count, 0)
    }

    func testWithOneElementInStackReturnsOne() {
        // Given
        stack.push(1)
        let expectedStackSize = 1

        // When
        let stackSize = stack.count

        // Then
        XCTAssertEqual(stackSize, expectedStackSize)
    }
}
