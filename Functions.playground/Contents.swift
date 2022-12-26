import Cocoa

func printGreetings() {
    print("Hello, playground.")
}
printGreetings()

func printPersonalGreeting(name: String) {
    print("Hello, \(name). Welcome to your playground.")
}
printPersonalGreeting(name: "step")

func divisionDescriptionFor (numerator: Double, denominator: Double) {
    print("\(numerator) divided by \(denominator) is \(numerator / denominator)")
}
divisionDescriptionFor(numerator: 9.0, denominator: 3.0)
