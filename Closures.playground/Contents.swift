import Cocoa

let volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]

//func isAcending (_ i: Int, _ j: Int) -> Bool {
//    return i < j
//}
//let volunteersSorted = volunteerCounts.sorted(by: isAcending(_:_:))

//let volunteersSorted = volunteerCounts.sorted(by: {
//    (i: Int, j: Int) -> Bool in
//    return i < j
//})

//let volunteersSorted = volunteerCounts.sorted(by: { i, j in i < j})
//let volunteersSorted = volunteerCounts.sorted(by: { $0 < $1 })
let volunteersSorted = volunteerCounts.sorted { $0 < $1 }
print(volunteersSorted)

func format (numbers: [Double], using formatter: (Double) -> String = { "\($0)" }) -> [String] {
    var result = [String]()
    for number in numbers {
        let transformed = formatter(number)
        result.append(transformed)
    }
    return result
}

var numberOfTransformations = 0

let rounder: (Double) -> String = {
    (num: Double) -> String in
    numberOfTransformations += 1
    return "\(Int(num.rounded()))"
}

let volunteerAverages = [10.75, 4.2, 1.5, 12.12, 16.815]
let roundedAverageAsStrings = format(numbers: volunteerAverages, using: rounder)
let exactAveragesAsStrings = format(numbers: volunteerAverages)
print(numberOfTransformations)

let roundedAverages = volunteerAverages.map {
    (avg: Double) -> Int in
    return Int(avg.rounded())
}
roundedAverages

let passingAverage = roundedAverages.filter {
    (avg: Int) -> Bool in
    return avg >= 10
}
passingAverage

let estimatedParticipation = passingAverage.reduce(5) {
    (estimationSoFar: Int, currentOrgAverage: Int) -> Int in
    return estimationSoFar + currentOrgAverage
}
estimatedParticipation

/*
Chapter13: Bronze Challenge p. 268
In this chapter, you sorted a collection by returning a new instance of Array with its integers sorted from
smallest to largest. You can also sort collections in place – meaning modifying the existing collection, rather
than returning a new one. Change the way you sort volunteerCounts to sort the array in place from smallest to
largest.
*/

var volunteerCountsBronzeChallenge = [1, 3, 40, 32, 2, 53, 77, 13]
volunteerCountsBronzeChallenge.sort { $0 < $1}
volunteerCountsBronzeChallenge

/*
Chapter13: Silver Challenge p. 269
You used sorted(by:) to sort a collection from smallest to largest. But if you just want to sort a collection
in an ascending fashion, there is a simpler method to use. Use the documentation to find this method. Apply the
method to your solution to the bronze challenge.
*/
var volunteerCountsSilverChallenge = [1, 3, 40, 32, 2, 53, 77, 13]
volunteerCountsSilverChallenge.sort()

/*
Chapter13: Gold Challenge p. 270
Use what you have learned about closure syntax in this chapter to perform all the calculations on the
volunteerAverages array (the map(_:), filter(_:), and reduce(_:_:) calls) in as little code as possible. Your
entire solution should fit in one (long) line.
 
Consider the balance of brevity and readability in your solution, and experiment with including and excluding
different compiler-inferrable parts of the closure syntax to find a balance that you feel comfortable with.

Hint: You can chain method calls using dot syntax, so long as the return value of each method is of a type that
has the next method available on it. For example:

let sortedRoundedAverages = startingArray.map(…).sorted(by:…)
 
sorted(by:) must be called on an Array. This works because map(_:) returns an Array, and sorted(by:) is being
called on map(_:)’s return value.
*/

let volunteerAveragesGoldChallenge = [10.75, 4.2, 1.5, 12.12, 16.815]
let roundedAveragesGoldChallenge = volunteerAveragesGoldChallenge.map { Int($0.rounded())}.filter { $0 >= 10}.reduce(5) {$0 + $1}
roundedAveragesGoldChallenge


