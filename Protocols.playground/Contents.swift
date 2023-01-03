import Cocoa

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numbersOfColumns: Int { get }
    
    func label(forColumn column: Int) -> String
    
    func itemFor(row: Int, column: Int) -> String
}

func printTable(_ dataSource: TabularDataSource & CustomStringConvertible) {
    print("Table: \(dataSource)")
    // Create a header row containing column headers
    var headerRow = "|"
    
    // Also keep track of the width of each column
    var columnWidths = [Int]()
    
    for i in 0..<dataSource.numbersOfColumns {
        let columnLabel = dataSource.label(forColumn: i)
        let columnHeader = " \(columnLabel) |"
        headerRow += columnHeader
        columnWidths.append(columnLabel.count)
    }
    print(headerRow)
    
    for i in 0..<dataSource.numberOfRows {
        // Start the output string
        var out = "|"

        // Append each item in this rown to the string
        for j in 0..<dataSource.numbersOfColumns {
            let item = dataSource.itemFor(row: i, column: j)
            let paddingNeeded = columnWidths[j] - item.count < 0 ? columnWidths[j] + item.count : columnWidths[j] - item.count
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            out += " \(padding)\(item) |"
        }
        
        // Done - print it !
        print(out)
    }
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource, CustomStringConvertible {
    let name: String
    var people = [Person]()
    
    var description: String {
        return "Department \(name)"
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func add(_ person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numbersOfColumns: Int {
        return 3
    }
    
    func label(forColumn column: Int) -> String {
        switch column{
        case 0: return "Employee Name"
        case 1: return "Age"
        case 2: return "Years of Experience"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let person  = people[row]
        switch column{
        case 0: return person.name
        case 1: return String(person.age)
        case 2: return String(person.yearsOfExperience)
        default: fatalError("Invalid column!")
        }
    }
    
    
}

var department = Department(name: "Engineering")
department.add(Person(name: "Eva", age: 1000, yearsOfExperience: 6))
department.add(Person(name: "Saleh", age: 40, yearsOfExperience: 18))
department.add(Person(name: "Amit", age: 50, yearsOfExperience: 20))

printTable(department)

let operationsDataSource: TabularDataSource = Department(name: "Operations")
let engineeringDataSource = department as TabularDataSource

let mikey = Person(name: "Mikey", age: 37, yearsOfExperience: 10)
mikey is TabularDataSource

/*
Chapter19: Protocols - Bronze Challenge p. 458
The printTable(_:) function has a bug: It crashes if any of the data items are longer than the label of their column. Try changing Eva’s age to
1,000 to see this happen. Fix the bug. Your solution will likely result in incorrect table formatting; that is fine for now. You will fix the
formatting in the gold challenge, below.
*/

// Solution: line 35
