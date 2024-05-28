import XCTest

// MARK: - customMap() Tests

final class CustomMapTests: XCTestCase {
    func testWithMultiplicationAtTwoReturnsDoubledElements() {
        // Given
        let arrayOfIntegers = [1, 2, 3, 4, 5]
        let closure: (Int) -> Int = { $0 * 2 }
        let arrayWithExpectedElements = arrayOfIntegers.map(closure)

        // When
        let numbersMultipliedByTwo = arrayOfIntegers.customMap(closure)

        // Then
        XCTAssertEqual(numbersMultipliedByTwo, arrayWithExpectedElements)
    }

    func testWithUppercasedStringsInArrayReturnsLowercasedStrings() {
        // Given
        let uppercasedNames = ["Pete", "Kate", "Alex", "Takeshi"]
        let closure: (String) -> String = { $0.lowercased() }
        let arrayWithExpectedElements = uppercasedNames.map(closure)

        // When
        let lowercasedNames = uppercasedNames.customMap(closure)

        // Then
        XCTAssertEqual(lowercasedNames, arrayWithExpectedElements)
    }

    func testWithUppercasedStringsFromCustomStructureReturnsUpdatedLowercasedStrings() {
        // Given
        struct Dummy {
            let name: String
        }

        let arrayOfCustomStructs = [Dummy(name: "John"), Dummy(name: "Mane")]
        let closure: (Dummy) -> String = { $0.name.lowercased() }
        let expectedUpdatedNames = arrayOfCustomStructs.map(closure)

        // When
        let lowercasedPersonsNames = arrayOfCustomStructs.customMap(closure)

        // Then
        XCTAssertEqual(lowercasedPersonsNames, expectedUpdatedNames)
    }

    func testChainOfCalls() {
        // Given
        let arrayOfIntegers = [1, 2, 3, 4, 5]
        let firstClosure: (Int) -> Int = { $0 * 5 }
        let secondClosure: (Int) -> Int = { $0 + 1 }
        let expectedResult = arrayOfIntegers.map(firstClosure).map(secondClosure)

        // When
        let mappedNumbers = arrayOfIntegers.customMap(firstClosure).customMap(secondClosure)

        // Then
        XCTAssertEqual(mappedNumbers, expectedResult)
    }

    func testReceivedDataMatchesReturnedData() {
        // Given
        let initialArrayOfStrings = ["Pete", "Kate", "Alex", "Takeshi"]
        let closure: (String) -> String = { $0 }

        // When
        let mappedArrayOfStrings = initialArrayOfStrings.customMap(closure)

        // Then
        XCTAssertEqual(initialArrayOfStrings, mappedArrayOfStrings)
    }

    func testWithEmptyArrayReturnsEmptyArray() {
        // Given
        let emptyArray = [Double]()

        // When
        let mappedArray = emptyArray.customMap { $0 }

        // Then
        XCTAssertTrue(mappedArray.isEmpty)
    }

    func testTheFunctionIsGeneric() {
        _ = [Int]().customMap { $0 }
        _ = [Double]().customMap { $0 }
        _ = [String]().customMap { $0 }
    }

    func testRethrowsAnError() {
        // Given
        enum DummyError: Error {
            case error
        }
        let throwsAnError: (Int) throws -> Void = { _ in throw DummyError.error }

        do {
            // When
            try [1].customMap(throwsAnError)

            // Then
        } catch let error as DummyError {
            XCTAssertEqual(error, DummyError.error)
        } catch {
            XCTFail("error should be a DummyError type")
        }
    }
}

// MARK: - customReduce() Tests

final class CustomReduceTests: XCTestCase {
    func testReturnsTheSumOfAllElementsInTheArray() {
        // Given
        let arrayOfIntegers = [1, 2, 3, 4, 5]
        let closure: (Int, Int) -> Int = { firstNumber, secondNumber in
            firstNumber + secondNumber
        }
        let expectedResult = arrayOfIntegers.reduce(0, closure)

        // When
        let resultOfCustomReduce = arrayOfIntegers.customReduce(0, closure)

        // Then
        XCTAssertEqual(resultOfCustomReduce, expectedResult)
    }

    func testWithCustomStructure() {
        // Given
        struct Dummy {
            let name: String
            let wallet: Double
        }

        let persons = [Dummy(name: "Tom", wallet: 60.00), Dummy(name: "Bob", wallet: 9.00)]
        let closure: (Double, Dummy) -> Double = { $0 + $1.wallet }
        let expectedResult = persons.reduce(0.0, closure)

        // When
        let resultOfCustomReduce = persons.customReduce(0.0, closure)

        // Then
        XCTAssertEqual(resultOfCustomReduce, expectedResult)
    }

    func testWithEmptyArrayReturnsInitialResult() {
        // Given
        let initialResult = 0
        let emptyArray = [Int]()

        // When
        let resultOfCustomReduce = emptyArray.customReduce(initialResult, +)

        // Then
        XCTAssertEqual(initialResult, resultOfCustomReduce)
    }

    func testChainOfCalls() {
        // Given
        let arrayOfDoubles = [[7.0, 3.0, 10.0], [25.0, 5.0]]
        let firstClosure: ([Double], [Double]) -> [Double] = { resultArray, doublesArray in
            resultArray + [doublesArray.reduce(0, +)]
        }
        let secondClosure: (Double, Double) -> Double = { resultDouble, double in
            resultDouble * double
        }
        let expectedResult = arrayOfDoubles
            .reduce([Double](), firstClosure)
            .reduce(2.0, secondClosure)

        // When
        let customReduceResult = arrayOfDoubles
            .customReduce([Double](), firstClosure)
            .customReduce(2.0, secondClosure)

        // Then
        XCTAssertEqual(customReduceResult, expectedResult)
    }

    func testTheFunctionIsGeneric() {
        _ = [Double]().customReduce(0) { _, _ in 0 }
        _ = [Int]().customReduce(0) { _, _ in 0 }
        _ = [String]().customReduce(0) { _, _ in 0 }
    }

    func testRethrowsAnError() {
        // Given
        enum DummyError: Error {
            case error
        }
        let array = [1]
        let throwsAnError: (Int, Int) throws -> Int = { _, _ in throw DummyError.error }

        do {
            // When
            try array.customReduce(0, throwsAnError)

            // Then
        } catch let error as DummyError {
            XCTAssertEqual(error, DummyError.error)
        } catch {
            XCTFail("error should be a DummyError type")
        }
    }
}

// MARK: - customReduce(into:) Tests

final class CustomReduceIntoTests: XCTestCase {
    func testReturnsTheSumOfAllElementsInTheArray() {
        // Given
        let arrayOfIntegers = [1, 2, 3, 4, 5]
        let closure: (inout Int, Int) -> Void = { firstInt, secondInt in
            firstInt += secondInt
        }
        let expectedResult = arrayOfIntegers.reduce(into: 0, closure)

        // When
        let resultOfCustomReduceInto = arrayOfIntegers.customReduce(into: 0, closure)

        // Then
        XCTAssertEqual(resultOfCustomReduceInto, expectedResult)
    }

    func testWithEmptyArrayReturnsInitialResult() {
        // Given
        let initialResult = 1
        let emptyArray = [Int]()

        // When
        let resultOfCustomReduceInto = emptyArray.customReduce(into: initialResult) { $0 += $1 }

        // Then
        XCTAssertEqual(resultOfCustomReduceInto, initialResult)
    }

    func testWithCustomStructure() {
        // Given
        struct Dummy {
            let name: String
            let wallet: Double
        }

        let persons = [Dummy(name: "Tom", wallet: 60.00), Dummy(name: "Bob", wallet: 9.00)]
        let closure: (inout Double, Dummy) -> Void = { $0 += $1.wallet }
        let expectedResult = persons.reduce(into: 0.0, closure)

        // When
        let resultOfCustomReduceInto = persons.customReduce(into: 0.0, closure)

        // Then
        XCTAssertEqual(resultOfCustomReduceInto, expectedResult)
    }

    func testChainOfCalls() {
        // Given
        let arrayOfDoubles = [[7.0, 3.0], [10.0, 25.0, 5.0]]
        let firstClosure: (inout [Double], [Double]) -> Void = { firstInt, secondInt in
            firstInt += secondInt
        }
        let secondClosure: (inout Double, Double) -> Void = { firstDouble, secondDouble in
            firstDouble *= secondDouble
        }
        let expectedResult = arrayOfDoubles
            .reduce(into: [Double](), firstClosure)
            .reduce(into: 2, secondClosure)

        // When
        let resultOfCustomReduceInto = arrayOfDoubles
            .customReduce(into: [Double](), firstClosure)
            .customReduce(into: 2, secondClosure)

        // Then
        XCTAssertEqual(resultOfCustomReduceInto, expectedResult)
    }

    func testTheFunctionIsGeneric() {
        _ = [Double]().customReduce(into: []) { _, _ in }
        _ = [Int]().customReduce(into: []) { _, _ in }
        _ = [String]().customReduce(into: []) { _, _ in }
    }

    func testRethrowsAnError() {
        // Given
        enum DummyError: Error {
            case error
        }
        let throwsAnError: (inout Int, Int) throws -> Void = { _, _ in throw DummyError.error }
        let array = [1]

        do {
            // When
            try array.customReduce(into: 0, throwsAnError)

            // Then
        } catch let error as DummyError {
            XCTAssertEqual(error, DummyError.error)
        } catch {
            XCTFail("error should be a DummyError type")
        }
    }
}

// MARK: - Running test suites

CustomMapTests.defaultTestSuite.run()
CustomReduceTests.defaultTestSuite.run()
CustomReduceIntoTests.defaultTestSuite.run()
