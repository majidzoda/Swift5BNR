import Cocoa

struct Point {
    let x: Int
    let y: Int
    let label: String? = nil
    

}

extension Point: Comparable, Hashable {
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
    }
    
    static func < (lhs: Point, rhs: Point) -> Bool {
        return (lhs.x < rhs.x) && (lhs.y < rhs.y)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

let a  = Point(x: 3, y: 4)
let b  = Point(x: 3, y: 4)
let abEqual = (a == b)
let abNotEqua = (a != b)

let c = Point(x: 2, y: 6)
let d = Point(x: 3, y: 7)
let cdEqual = (c == d)
let cLessThanD = (c < d)

let cLessThanEqualD = ( c <= d)
let cGreaterThanD = (c > d)
let cGreaterThanEqualD = (c >= d)

let pointRange = c..<d
pointRange.contains(a)
pointRange.contains(Point(x: -1, y: -1))

let points: Set = [a, b, c]
points.intersection([b, c, d])

let pointName: [Point : String] = [
    Point(x: 0, y: 0) : "origin",
    a : "a"
]

class Person: Hashable {
    let name: String!
    let age: Int!
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.name == rhs.name && lhs.age == rhs.age
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(age)
    }
}

var people = [Person]()
let p1 = Person(name: "OG", age: 25)
let p2 = Person(name: "Smith", age: 30)

people.append(p1)
people.append(p2)

let indexP1 = people.firstIndex(of: p1)

