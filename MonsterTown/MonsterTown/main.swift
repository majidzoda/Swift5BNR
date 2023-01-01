import Foundation

var myTown = Town(population: 0, stoplights: 6)
myTown?.printDescription()
let myTownSize = myTown?.townSize
print(String(describing: myTownSize))
myTown?.changePopulation(by: 1_000_000)
print("Size: \(String(describing: myTown?.townSize)); population: \(String(describing: myTown?.population))")

var fredTheZombie: Zombie? = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")
fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printDescription()

var convinienceZombie = Zombie(limp: true, fallingApart: false)

print("Victim pool: \(String(describing: fredTheZombie?.victimPool))")
fredTheZombie?.victimPool = 500
print("Victim pool: \(String(describing: fredTheZombie?.victimPool))")
print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away!")
}
fredTheZombie = nil

/*
Chapter17: initializers - Silver Challenge p. 394
Currently, the required initializer on the Monster class
is implemented as a designated initializer on the Zombie subclass. Make
this initializer a convenience initializer on the Zombie class instead.
This change will involve delegating across the Zombie class to its
designated initializer.
 
Solution: Zombie.swift line 25
*/

/*
Chapter17: initializers - Silver Challenge p. 395
The Monster class can be initialized with any String instance for the monsterName
parameter, even an empty String. Doing so would lead to an instance of Monster with
no name. Even though Frankenstein’s monster had no name, you want all of yours to
be individually identified. Fix this problem in the Monster class by ensuring that
monsterName cannot be empty.
 
Your solution will involve giving Monster a failable initializer. Note that this
change will have an impact on initialization in the Zombie subclass. Make the
necessary adjustments in this class as well.
 
Solution: Monster.swift lines 20 -23
          Zombie.swift lines: 11, 17, 25g
*/
