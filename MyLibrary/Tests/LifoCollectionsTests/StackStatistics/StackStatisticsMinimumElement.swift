import LifoCollections
import XCTest

final class StackStatisticsMinimumElement: XCTestCase {
    private struct Dummy: Comparable {
        static func < (lhs: StackStatisticsMinimumElement.Dummy, rhs: StackStatisticsMinimumElement.Dummy) -> Bool {
            lhs.value < rhs.value
        }

        let id: Int
        let value: Int
    }

    private var stack = StackStatistics<Int>()

    func testReturnsFirstElementAmongAllMinimumElementsAdded() {
        // Given
        let instanceA = Dummy(id: 1, value: 10)
        let instanceB = Dummy(id: 2, value: 10)

        var stack = StackStatistics<Dummy>()
        stack.push(instanceA)
        stack.push(instanceB)

        // When
        let currentMinimum = stack.minimumElement()

        // Then
        XCTAssertEqual(currentMinimum?.id, instanceA.id)
    }

    func testWithEmptyStackReturnsNil() {
        // Given an empty stack
        // When, Then
        XCTAssertNil(stack.minimumElement())
    }

    func testWithNotEmptyStackReturnsLesserElement() {
        // Given
        stack.push(3)
        stack.push(2)
        stack.push(1)
        let expectedMinimumAfterPop = 1

        // When, Then
        XCTAssertEqual(stack.minimumElement(), expectedMinimumAfterPop)
    }

    func testAfterPopReturnsCurrentMinimumElement() {
        // Given
        stack.push(2)
        stack.push(1)
        stack.push(0)
        let expectedReturnValue = 1

        // When
        stack.pop()

        // Then
        XCTAssertEqual(stack.minimumElement(), expectedReturnValue)
    }

    func testWithMultipleEqualMiminumValues() {
        // Given
        stack.push(2)
        stack.push(4)
        stack.push(1)
        stack.push(1)
        let expectedReturnValue = 1

        // When
        stack.pop()

        // Then
        XCTAssertEqual(stack.minimumElement(), expectedReturnValue)
    }
}
