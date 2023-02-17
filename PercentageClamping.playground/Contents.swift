import Cocoa

struct Car {
    @Percentge var fuelLevel: Double = 1.0
    @Percentge var wiperFluidLevel: Float = 0.5
    @Percentge(upperBound: 2.0) var stereoVolume: Double = 1.0
}

extension Car: CustomStringConvertible {
    var description: String {
        return "fuelLevel: \(fuelLevel), wrapped by \(_fuelLevel)"
    }
}

var myCar = Car()
print(myCar)
myCar.fuelLevel = 1.1
print("Fuel:", myCar.fuelLevel)
myCar.stereoVolume = 2.5
print("Volume:", myCar.stereoVolume)
print("Prijected volume:", myCar.$stereoVolume)
