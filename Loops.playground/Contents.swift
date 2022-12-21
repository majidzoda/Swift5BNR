import UIKit

var myFirstInt: Int = 0

for _ in 1...5 {
    myFirstInt += 1
    print(myFirstInt)
}

for i in 1...100 where i % 3 == 0 {
    print(i)
}

var i = 1
while i < 6 {
    myFirstInt += 1
    print(myFirstInt)
    i += 1
}

var shields = 5
var blastersOverheating = false
var blasterFireCount = 0
var spaceDemonsDestroyed = 0
while shields > 0 {
    
    if spaceDemonsDestroyed == 500 {
        print("You beat the game!")
        break
    }
    
    if blastersOverheating {
        print("Blasters overheated! Cooldown initiated.")
        sleep(5)
        print("Blasters ready to fire")
        sleep(1)
        blastersOverheating = false
        blasterFireCount = 0
    }
    
    if blasterFireCount > 100 {
        blastersOverheating = true
        continue
    }
    
    // Fire blasters!
    print("Fire blasters!")
    blasterFireCount += 1
    spaceDemonsDestroyed += 1
}
/*
Chapter6-Switch-SilverChallenge p. 125
Fizz Buzz is a game used to teach division. Create a version of the game that works like this:
For every value in a given range, print out “FIZZ” if the current number is evenly divisible by
3. If the number is evenly divisible by 5, print out “BUZZ.” If the number is evenly divisible
by both 3 and 5, then print out “FIZZ BUZZ.” If the number is not evenly divisible by 3 or 5,
then simply print out the number. For example, over the range of 1 through 10, playing Fizz Buzz
should yield this: “1, 2, FIZZ, 4, BUZZ, FIZZ, 7, 8, FIZZ, BUZZ.” Computers love to play Fizz
Buzz. The game is perfect for loops and conditionals. Loop over the range from 0 through 100 and
print “FIZZ,” “BUZZ,” “FIZZ BUZZ,” or the number appropriately for each number in the range. For
bonus points, solve Fizz Buzz with both an if/else conditional and a switch statement. When using
the switch statement, make sure to match against a tuple in its various cases.
*/

// with if/else
for i in 1...15 {
    if i % 5 == 0 && i % 3 == 0 {
        print("FIZZ BUZZ")
    } else if i % 5 == 0 {
        print("BUZZ")
    } else if i % 3 == 0 {
        print("FIZZ")
    } else {
        print(i)
    }
}

// with switch
for i in 1...15 {
    switch (i % 5, i % 3) {
    case (0, 0):
        print("FIZZ BUZZ")
    case (0, _):
        print("BUZZ")
    case (_, 0):
        print("FIZZ")
    default:
        print(i)
    }
}
