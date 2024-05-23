import LifoCollections

let someElements = [1, 2, 3, 4, 5]
let stack = StackStatistics(someElements)

print("Elements in the stack: \(stack.count)")
if let minimumElement = stack.minimumElement() {
    print("Minimum element in the stack is: \(minimumElement)")
}
