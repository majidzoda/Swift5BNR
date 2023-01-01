import Foundation

class Zombie: Monster {
    override class var spookyNoise: String {
        return "Brains..."
    }
    var walksWithLamp: Bool
    private(set) var isFallingApart: Bool
    
//Chapter17: initializers - Silver Challenge p. 395
    init?(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String) {
        walksWithLamp = limp
        isFallingApart = fallingApart
        super.init(town: town, monsterName: monsterName)
    }
//Chapter17: initializers - Silver Challenge p. 395
    convenience init?(limp: Bool, fallingApart: Bool) {
        self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "Fred")
        if walksWithLamp {
            print("This zombie has a bad knee")
        }
    }

//Chapter17: initializers - Silver Challenge p. 395
    required convenience init?(town: Town?, monsterName: String) {
//    Chapter17: initializers - Silver Challenge p. 394
        self.init(limp: false, fallingApart: false, town: town, monsterName: monsterName)
    }
    
    deinit {
        print("Zombie \(name) is no longer with us.")
    }
    
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
