import XCTest
import LifoCollections

final class StackIsStructureTests: XCTestCase {
    func testStackIsStructureReturnsTrue() {
        // Given
        let stack = Stack<Int>()
        let stackInstance = Mirror(reflecting: stack)

        // When, Then
        XCTAssertEqual(stackInstance.displayStyle, .struct)
    }
}
