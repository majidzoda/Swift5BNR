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

let rounder: (Double) -> String = {
    (num: Double) -> String in
    return "\(Int(num.rounded()))"
}
let volunteerAverages = [10.75, 4.2, 1.5, 12.12, 16.815]
let roundedAverageAsStrings = format(numbers: volunteerAverages, using: rounder)
let exactAveragesAsStrings = format(numbers: volunteerAverages)
