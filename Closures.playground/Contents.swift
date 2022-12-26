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
