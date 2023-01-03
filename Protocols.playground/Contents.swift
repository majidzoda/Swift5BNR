import Cocoa

func printTable(_ data: [[String]], withColumnLabels columnLabels: [String]) {
    // Create a header row containing column headers
    var headerRow = "|"
    
    // Also keep track of the width of each column
    var columnWidths = [Int]()
    
    for columnLabel in columnLabels {
        let columnHeader = " \(columnLabel) |"
        headerRow += columnHeader
        columnWidths.append(columnLabel.count)
    }
    print(headerRow)
    
    for row in data {
        // Start the output string
        var out = "|"

        // Append each item in this rown to the string
        for (j, item) in row.enumerated() {
            let paddingNeeded = columnWidths[j] - item.count
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            out += " \(padding)\(item) |"
        }
        
        // Done - print it !
        print(out)
    }
}

//let data = [
//    ["Eva", "30", "6"],
//    ["Saleh", "40", "18"],
//    ["Amit", "50", "20"],
//]
//
//printTable(data, withColumnLabels: ["Employee Name", "Age", "Years of Experience"])

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department {
    let name: String
    var people = [Person]()
    
    init(name: String) {
        self.name = name
    }
    
    mutating func add(_ person: Person) {
        people.append(person)
    }
}

var department = Department(name: "Engineering")
department.add(Person(name: "Eva", age: 30, yearsOfExperience: 6))
department.add(Person(name: "Saleh", age: 40, yearsOfExperience: 18))
department.add(Person(name: "Amit", age: 50, yearsOfExperience: 20))
