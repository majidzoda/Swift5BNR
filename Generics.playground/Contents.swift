import Cocoa

struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(_ newElement: Element){
        items.append(newElement)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else { return nil }
        return items.removeLast()
    }
}
var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)

print(String(describing: intStack.pop()))
print(String(describing: intStack.pop()))
print(String(describing: intStack.pop()))

var stringStack = Stack<String>()
stringStack.push("this is a string")
stringStack.push("another string")

print(String(describing: stringStack.pop()))
