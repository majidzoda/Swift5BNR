import Foundation

var myTown = Town(population: 10_000, stoplights: 6)
myTown.printDescription()
let myTownSize = myTown.townSize
print(myTownSize)
myTown.changePopulation(by: 1_000_000)
print("Size: \(myTown.townSize); population: \(myTown.population)")

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
