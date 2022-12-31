import Foundation

class Zombie: Monster {
    override class var spookyNoise: String {
        return "Brains..."
    }
    var walksWithLamp = true
//    internal private(set) var isFallingApart = false
    private(set) var isFallingApart = false
    
    func regenerate() {
        walksWithLamp = false
    }
    
    override func terrorizeTown() {
        if !isFallingApart {
            town?.changePopulation(by: -10)
        }
        super.terrorizeTown()
        regenerate()
    }
}
