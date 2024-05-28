extension Array {
    /// Returns an array containing the results of mapping the given closure
    /// over the array's elements.
    ///
    /// In this example, `customMap` is used first to convert the names in the array
    /// to lowercase strings and then to count their characters.
    ///
    ///     let names = ["Pete", "Bob", "Alex", "Takeshi"]
    ///     let lowercaseNames = names.customMap { $0.lowercased() }
    ///     // 'lowercaseNames' == ["pete", "bob", "alex", "takeshi"]
    ///     let letterCounts = names.customMap { $0.count }
    ///     // 'letterCounts' == [4, 3, 4, 7]
    ///
    /// - Parameter transform: A mapping closure. `transform` accepts an
    ///   element of this array as its parameter and returns a transformed
    ///   value of the same or of a different type.
    /// - Returns: An array containing the transformed elements of this
    ///   array.
    /// - Complexity: O(`n`), where `n` is the length of the array.
    public func customMap<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
        var result: [T] = []

        for element in self {
            try result.append(transform(element))
        }
        return result
    }
}
