extension Array {
    /// Returns the result of combining the elements of the array using the
    /// given closure.
    ///
    /// Use the `customReduce(_:_:)` method to produce a single value from the elements
    /// of an entire array. For example, you can use this method on an array
    /// of numbers to find their sum or product.
    ///
    /// The `nextPartialResult` closure is called sequentially with an
    /// accumulating value initialized to `initialResult` and each element of
    /// the array. This example shows how to find the sum of an array of
    /// numbers.
    ///
    ///     let numbers = [1, 2, 3, 4]
    ///     let numberSum = numbers.customReduce(0, { x, y in
    ///         x + y
    ///     })
    ///     // numberSum == 10
    ///
    /// When `numbers.customReduce(_:_:)` is called, the following steps occur:
    ///
    /// 1. The `nextPartialResult` closure is called with `initialResult`---`0`
    ///    in this case---and the first element of `numbers`, returning the sum:
    ///    `1`.
    /// 2. The closure is called again repeatedly with the previous call's return
    ///    value and each element of the array.
    /// 3. When the array is exhausted, the last value returned from the
    ///    closure is returned to the caller.
    ///
    /// If the array has no elements, `nextPartialResult` is never executed
    /// and `initialResult` is the result of the call to `customReduce(_:_:)`.
    ///
    /// - Parameters:
    ///   - initialResult: The value to use as the initial accumulating value.
    ///     `initialResult` is passed to `nextPartialResult` the first time the
    ///     closure is executed.
    ///   - nextPartialResult: A closure that combines an accumulating value and
    ///     an element of the array into a new accumulating value, to be used
    ///     in the next call of the `nextPartialResult` closure or returned to
    ///     the caller.
    /// - Returns: The final accumulated value. If the array has no elements,
    ///   the result is `initialResult`.
    ///
    /// - Complexity: O(`n`), where `n` is the length of the array.
    public func customReduce<Result>(
        _ initialResult: Result,
        _ nextPartialResult: (Result, Element) throws -> Result
    ) rethrows -> Result {
        var result = initialResult

        for element in self {
            result = try nextPartialResult(result, element)
        }

        return result
    }

    /// Returns the result of combining the elements of the array using the
    /// given closure.
    ///
    /// Use the `customReduce(into:_:)` method to produce a single value from the
    /// elements of an entire array. For example, you can use this method on an
    /// array of integers to filter adjacent equal entries or count frequencies.
    ///
    /// This method is preferred over `customReduce(_:_:)` for efficiency when the
    /// result is a copy-on-write type, for example an Array or a Dictionary.
    ///
    /// The `updateAccumulatingResult` closure is called sequentially with a
    /// mutable accumulating value initialized to `initialResult` and each element
    /// of the array. This example shows how to build a dictionary of letter
    /// frequencies of a string.
    ///
    ///     let letters = "abracadabra"
    ///     let letterCount = letters.customReduce(into: [:]) { counts, letter in
    ///         counts[letter, default: 0] += 1
    ///     }
    ///     // letterCount == ["a": 5, "b": 2, "r": 2, "c": 1, "d": 1]
    ///
    /// When `letters.customReduce(into:_:)` is called, the following steps occur:
    ///
    /// 1. The `updateAccumulatingResult` closure is called with the initial
    ///    accumulating value---`[:]` in this case---and the first character of
    ///    `letters`, modifying the accumulating value by setting `1` for the key
    ///    `"a"`.
    /// 2. The closure is called again repeatedly with the updated accumulating
    ///    value and each element of the array.
    /// 3. When the array is exhausted, the accumulating value is returned to
    ///    the caller.
    ///
    /// If the array has no elements, `updateAccumulatingResult` is never
    /// executed and `initialResult` is the result of the call to
    /// `customReduce(into:_:)`.
    ///
    /// - Parameters:
    ///   - initialResult: The value to use as the initial accumulating value.
    ///   - updateAccumulatingResult: A closure that updates the accumulating
    ///     value with an element of the array.
    /// - Returns: The final accumulated value. If the array has no elements,
    ///   the result is `initialResult`.
    ///
    /// - Complexity: O(`n`), where `n` is the length of the array.
    public func customReduce<Result>(
        into initialResult: Result,
        _ updateAccumulatingResult: (inout Result, Element) throws -> Void
    )
        rethrows -> Result
    {
        var result = initialResult

        for element in self {
            try updateAccumulatingResult(&result, element)
        }

        return result
    }
}
