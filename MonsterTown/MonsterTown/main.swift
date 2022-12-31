import Foundation

var myTown = Town()
let myTownSize = myTown.townSize
print(myTownSize)
myTown.changePopulation(by: 1_000_000)
print("Size: \(myTown.townSize); population: \(myTown.population)")

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDescription()

print("Victim pool: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
print("Victim pool: \(fredTheZombie.victimPool)")
print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away!")
}

/*
Chapter16: Properties Bronze Challenge p. 359
Your town’s mayor is busy. Every birth and relocation does not require the
mayor’s attention. After all, the town is in crisis! Only log changes to the
town’s population if the new population is less than the old value.
 
Solution in: Town.swift line 9
*/

/*
Chapter16: Properties Silver Challenge p. 360
Make a new type called Mayor. It should be a struct. The Town type should have a property called mayor that holds an instance of the Mayor type.
 
Have your town inform the mayor every time the property for population changes. If the town’s population decreases, have the instance of the Mayor log this statement
to the console:
    I'm deeply saddened to hear about this latest tragedy. I promise that my office is looking into the nature of this rash of violence.
 
If the population increases, then the mayor should do nothing. (Hint: You should define a new instance method on the Mayor type to complete this challenge.)
*/
fredTheZombie.town?.mayor = Mayor()
fredTheZombie.terrorizeTown()
