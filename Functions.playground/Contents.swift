import Cocoa

func printGreetings() {
    print("Hello, playground.")
}
printGreetings()

func printPersonalGreeting(to name: String) {
    print("Hello, \(name). Welcome to your playground.")
}
printPersonalGreeting(to: "step")

func divisionDescriptionFor (numerator: Double, denominator: Double, withPunctuation punctioation: String = ".") -> String {
    return "\(numerator) divided by \(denominator) is \(numerator / denominator)\(punctioation)"
}
divisionDescriptionFor(numerator: 9.0, denominator: 3.0)
divisionDescriptionFor(numerator: 9.0, denominator: 3.0, withPunctuation: "!")

var error = "The request failed:"
func appendErrorCode (_ code: Int, toErrorString errorString: inout String) {
    if code == 400 {
        errorString += " bad request."
    }
}
appendErrorCode(400, toErrorString: &error)
print(error)

print(divisionDescriptionFor(numerator: 9.0, denominator: 3.0))
print(divisionDescriptionFor(numerator: 9.0, denominator: 30, withPunctuation: "!"))

func areaOfTriangleWith(base: Double, height: Double) -> Double {
    let rectangle = base * height
    func divide() -> Double {
        return rectangle/2
    }
    return divide()
}
print(areaOfTriangleWith(base: 3.0, height: 5.0))

func sortedEvenOddNumbers(_ numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return (evens, odds)
}

let aBunchOfNumbers = [10,1,4,3,57,43,84,27,156,111]
let theSortedNumbers = sortedEvenOddNumbers(aBunchOfNumbers)
print("The even numbers are: \(theSortedNumbers.evens) the odd numbers are: \(theSortedNumbers.odds)")

func grabMiddleName (fromFullName name: (String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(fromFullName: ("Alice", "nil", "Ward"))
if let theName = middleName {
    print(theName)
}

func greetByMiddleName (fromFullName name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle else {
        print("Hey there!")
        return
    }
    print("Hey \(middleName)")
}
greetByMiddleName(fromFullName: ("Alice", "Richards", "Ward"))

let evenOddFunction: ([Int]) -> ([Int], [Int]) = sortedEvenOddNumbers(_:)
evenOddFunction([1,2,3])

/*
Chapter12: Functions - Bronze Challenge p. 239
Like if/else conditions, guard statements support the use of multiple clauses to perform additional checks. Using additional
clauses with a guard statement gives you further control over the statement’s condition. Refactor the
greetByMiddleName(fromFullName:) function to have an additional clause in its guard statement. This clause should check
whether the middle name is longer than 10 characters. If it is, then greet the person with their first name, their middle
initial (the first letter of the middle name followed by a period), and their last name instead. For example, if the name is
Alois Rumpelstiltskin Chaz, the function should print Hey, Alois R. Chaz.
*/

func greetByMiddleNameBronzeChallenge (fromFullName name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle, middleName.count > 10 else {
        print("Hey there!")
        return
    }
    print("Hey \(name.first) \(middleName[middleName.startIndex]). \(name.last)")
}
greetByMiddleNameBronzeChallenge(fromFullName: ("Alois", "Rumpelstiltskin", "Chaz"))


/*
Chapter 12: Silver Challenge p. 240
Write a function called siftBeans(fromGroceryList:) that takes a grocery list (as an array of strings) and “sifts out” the
beans from the other groceries. The function should take one argument that has a parameter name called list, and it should
return a named tuple of the type (beans: [String], otherGroceries: [String]). Here is an example of how you should be able to
call your function and what the result should be:
 
let result = siftBeans(fromGroceryList: ["green beans",
                                             "milk",
                                             "black beans",
                                             "pinto beans",
                                             "apples"])

result.beans == ["green beans", "black beans", "pinto beans"] // true
result.otherGroceries == ["milk", "apples"] // true
 
Hint: You may need to use a function on the String type called hasSuffix(_:).
*/

func siftBeans (fromGroceryList list:[String]) -> (beans: [String], otherGroceries: [String]) {
    var beans = [String](), otherItems = [String]()
    for item in list {
        if item.hasSuffix("beans") {
            beans.append(item)
        } else { otherItems.append(item) }
    }
    return (beans, otherItems)
}
let result = siftBeans(fromGroceryList: ["green beans",
                                         "milk",
                                         "black beans",
                                         "pinto beans",
                                         "apples"])
result.beans == ["green beans", "black beans", "pinto beans"]
result.otherGroceries == ["milk", "apples"]
