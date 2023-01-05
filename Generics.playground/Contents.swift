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
    
    mutating func pushAll<S: Sequence>(_ sequence: S) where S.Element == Element {
        for item in sequence {
            self.push(item)
        }
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

myStack.pushAll([1, 2, 3])
for value in myStack {
    print("after pushing items: got \(value)")
}

var myOtherStack = Stack<Int>()
myOtherStack.pushAll([1, 2, 3])
myStack.pushAll(myOtherStack)
for value in myStack {
    print("after pushing items onto stack, got \(value)")
}

protocol Food {
    var menuListings: String { get }
}

struct Bread: Food {
    var kind = "sourdough"
    var menuListings: String {
        "\(kind) bread"
    }
}

func eat<T: Food>(_ food: T) {
    print("I sure love \(food.menuListings).")
}
eat(Bread())

struct Restauruant {
    struct  SliceFood<Ingredient: Food>: Food {
        var food: Ingredient
        var menuListings: String {
            "a slice of \(food.menuListings)"
        }
    }
    
    struct CookedFood<Ingredients: Food>: Food {
        var food: Ingredients
        var menuListings: String{
            "\(food.menuListings), cooked to perfection"
        }
    }
    
    func makeSliceBread() -> some Food {
        return SliceFood(food: Bread())
    }
    
    func makeToast() -> some Food {
        var slicedBread = SliceFood(food: Bread())
        return CookedFood(food: slicedBread)
    }
}

let restaurnat = Restauruant()
let toast = restaurnat.makeToast()
eat(toast)
