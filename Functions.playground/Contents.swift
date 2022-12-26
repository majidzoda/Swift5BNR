import Cocoa

func printGreetings() {
    print("Hello, playground.")
}
printGreetings()

func printPersonalGreeting(to name: String) {
    print("Hello, \(name). Welcome to your playground.")
}
printPersonalGreeting(to: "step")

func divisionDescriptionFor (numerator: Double, denominator: Double, withPunctuation punctioation: String = ".") {
    print("\(numerator) divided by \(denominator) is \(numerator / denominator)\(punctioation)")
}
divisionDescriptionFor(numerator: 9.0, denominator: 3.0)
divisionDescriptionFor(numerator: 9.0, denominator: 3.0, withPunctuation: "!")

