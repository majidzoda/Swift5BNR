import Foundation

var myTown = Town()
var yourTown = myTown // Now there are two towns!
myTown.changePopulation(by: 500)
print("myTown has \(myTown.population) population and yourTown has \(yourTown.population) population")

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDescription()

var frederickTheZombie = fredTheZombie // Still only one zombie!
frederickTheZombie.name = "Frederick"
print("Fred's name is \(fredTheZombie.name)")

/*
Chapter15: Struct and Clases - Bronze Challenge p. 330
Create a copy of your MonsterTown project, as you will continue to
work on it in the next chapter and do not want your challenge
solutions to get in the way.
 
There is currently a bug in the program. If a Zombie terrorizes a
Town with a population less than 10, then the town's population
will become negative. This result does not make sense. Fix this bug
by changing the changePopulation(by:) method on Town to never have
a negative population. That is, make sure that a town’s population
is set to 0 if the amount to decrement is greater than the current
population.
*/
print("\nBronze Challenge")
fredTheZombie.town?.printDescription()
fredTheZombie.town?.population = 5
fredTheZombie.town?.printDescription()
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDescription()

/*
Chapter15: Struct and Clases - Silver Challenge p 331
Vampires are monsters that sometimes turn people into other vampires.
 
Create another subclass of the Monster type. Call this one Vampire. Give it a thralls property to hold an empty array of other Vampire instances.
 
In your new class, override the terrorizeTown() method to do everything that the superclass's implementation does plus capture one of the townspeople and make them
into a vampire thrall. Do this by adding an instance of Vampire to its thralls array and decrementing the town's population by one.
 
Ensure that a thrall is only made (and the town's population changed) if the terrorized town had at least one person in it.
 
Exercise this Vampire type in main.swift by creating one and making it terrorize a town several times. Each time, print the changes to the vampire's thralls and the
town's population to make sure it works.
*/

print("\nSilver Challenge")
var ariTheVampire = Vampire()
ariTheVampire.town = myTown
print("ariTheVampire thralls size: \(ariTheVampire.thralls.count)")
ariTheVampire.town?.printDescription()
ariTheVampire.terrorizeTown()
ariTheVampire.town?.printDescription()
print("ariTheVampire thralls size: \(ariTheVampire.thralls.count)")

