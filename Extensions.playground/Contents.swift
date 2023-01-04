import Cocoa

extension Double {
    var squared: Double { return self * self }
}

let sideLength: Double = 12.5
let area = sideLength.squared

struct Car {
    let make: String
    let model: String
    let year: Int
    var fuelLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must be between 0 and 1.")
        }
    }
}

let firstCar = Car(make: "Benz", model: "Patent Motorwagon", year: 1886, fuelLevel: 0.5)

extension Car: CustomStringConvertible {
    var description: String {
        return "\(year) \(make) \(model), fuel level: \(fuelLevel)"
    }
}

extension Car {
    init(make: String, model: String, year: Int) {
        self.init(make: make, model: model, year: year, fuelLevel: 1.0)
    }
}

var currentCar = Car(make: "Honda", model: "Civic", year: 2008)
firstCar.fuelLevel
currentCar.fuelLevel
