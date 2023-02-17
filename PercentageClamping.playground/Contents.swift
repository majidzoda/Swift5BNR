import Cocoa

struct Car {
    @Percentge var fuelLevel: Double = 1.0
    @Percentge var wiperFluidLevel: Double = 0.5
    @Percentge(upperBound: 2.0) var stereoVolume: Double = 1.0
}

var myCar = Car()
myCar.fuelLevel = 1.1
print("Fuel:", myCar.fuelLevel)
myCar.stereoVolume = 2.5
print("Volume:", myCar.stereoVolume)
