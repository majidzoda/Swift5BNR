import Cocoa

struct StackIterator<T>: IteratorProtocol {
//    typealias Element = T
    
    var stack: Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}

struct Stack<Element>: Sequence {
    var items = [Element]()
    
    mutating func push(_ newElement: Element){
        items.append(newElement)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else { return nil }
        return items.removeLast()
    }
    
    func map<U>(_ txform: (Element) -> U) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(txform(item))
        }
        return Stack<U>(items: mappedItems)
    }
    
    func makeIterator() -> StackIterator<Element> {
        return StackIterator(stack: self)
    }
}
var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
var doubleStack = intStack.map { 2 * $0 }

//print(String(describing: intStack.pop()))
//print(String(describing: intStack.pop()))
//print(String(describing: intStack.pop()))
//
//print(String(describing: doubleStack.pop()))
//print(String(describing: doubleStack.pop()))

var stringStack = Stack<String>()
stringStack.push("this is a string")
stringStack.push("another string")

print(String(describing: stringStack.pop()))

func myMap<T,U>(_ items: [T], _ txform: (T) -> (U)) -> [U] {
    var result = [U]()
    
    for item in items {
        result.append(txform(item))
    }
    return result
}

let strings = ["one", "two", "three"]
let stringLength = myMap(strings, { $0.count})
print(stringLength)

func checkIfEqual<T: Equatable>(_ first: T, second: T) -> Bool {
    return first == second
}

//print(checkIfEqual(1, second: 1))
//print(checkIfEqual("a string", second: "a string"))
//print(checkIfEqual("a string", second: " a different string"))

func checkIfDescriptionMatch<T: CustomStringConvertible, U: CustomStringConvertible>(_ first: T, _ second: U) -> Bool {
    return first.description == second.description
}

//print(checkIfDescriptionMatch(Int(1),  UInt(1)))
//print(checkIfDescriptionMatch(1, 1.0))
//print(checkIfDescriptionMatch(Float(1.0), Double(1.0)))

var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)

var myStackIterator = StackIterator(stack: myStack)
while let value = myStackIterator.next() {
    print("got \(value)")
}

for value in myStack {
    print("for-in loop: got \(value)")
}
