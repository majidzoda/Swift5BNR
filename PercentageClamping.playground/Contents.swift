import Cocoa

struct Car {
    @Percentge var fuelLevel: Double = 1.0
    @Percentge var wiperFluidLevel: Double = 0.5
}

var myCar = Car()
myCar.fuelLevel = 1.1
print("Fuel:", myCar.fuelLevel)
