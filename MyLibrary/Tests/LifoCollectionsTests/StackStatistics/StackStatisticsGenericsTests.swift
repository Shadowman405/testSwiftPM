import LifoCollections
import XCTest

final class StackStatisticsGenericsTests: XCTestCase {
    func testStackCanBeCreatedWithDifferentGenericsTypes() {
        _ = StackStatistics<Int>()
        _ = StackStatistics<Double>()
        _ = StackStatistics<Float>()
    }
}
