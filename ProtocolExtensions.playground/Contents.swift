import Cocoa
import Foundation

protocol Exercise: CustomStringConvertible {
    var caloriesBurned: Double { get set }
    var minutes: Double { get set }
    var title: String { get }
}

extension Exercise {
    var description: String {
        return "Exercise(\(Self.self), burned \(caloriesBurned) calories in \(minutes) minutes)"
    }
}


struct EllipticalWorkout: Exercise {
    var caloriesBurned: Double
    var minutes: Double
}

let ellipticalWorkout = EllipticalWorkout(caloriesBurned: 335, minutes: 30)

struct RunningWorkout: Exercise {
    let title = "Gotta go fast!"
    var caloriesBurned: Double
    var minutes: Double
    var meters: Double
    
    var description: String {
        return "RunningWorkout(\(caloriesBurned) calories and \(meters)m in \(minutes) minutes)"
    }
}

let runningWorkout = RunningWorkout(caloriesBurned: 350, minutes: 25, meters: 5000)

extension Exercise {
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
}

print(ellipticalWorkout.caloriesBurnedPerMinute)
print(runningWorkout.caloriesBurnedPerMinute)

print(ellipticalWorkout)
print(runningWorkout)

extension Exercise {
    func adding(calories: Double) -> Self {
        var dupe = self
        dupe.caloriesBurned += calories
        print("Creating a new \(Self.self) with \(dupe.caloriesBurned) cal burned")
        return dupe
    }
}

let ellipticalCopy = ellipticalWorkout.adding(calories: 50)
let runningCopy = runningWorkout.adding(calories: 100)

extension Sequence where Element == Exercise {
    func totalCaloriesBurned() -> Double {
        var total: Double = 0
        for exercise in self {
            total += exercise.caloriesBurned
        }
        return total
    }
}

let mondayWorkout: [Exercise] = [ellipticalWorkout, runningWorkout]
print(mondayWorkout.totalCaloriesBurned())

extension Exercise {
    var title: String {
        return "\(Self.self) - \(minutes) minutes"
    }
}

let tenKRun: RunningWorkout = RunningWorkout(caloriesBurned: 750, minutes: 60, meters: 10000)
let workout: Exercise = tenKRun

print(tenKRun.title)
print(workout.title)

/*
Chapter22: Protocol Extensions - Bronze Challenge p. 521
Add a method called count(where:) to all collections to count the number of elements that pass a provided test.

You should be able to call it like this:
    let workouts: [Exercise] = [ellipticalWorkout, runningWorkout, tenKRun]
    let hardWorkoutCount = workouts.count(where: { $0.caloriesBurned >= 500})   // 1

Look at the documentation for the Sequence and Collection protocols. Why is Collection the better protocol to add this extension to?
*/

extension Collection where Element == Exercise {
    func count(wh: ((Exercise) -> Bool)) -> Int {
        var count = 0
        for exercise in self {
            if wh(exercise) {
                count += 1
            }
        }
        return count
    }
}
let workouts: [Exercise] = [ellipticalWorkout, runningWorkout, tenKRun]
let hardWorkoutCount = workouts.count(wh: {$0.caloriesBurned >= 500 })  // 1
print(hardWorkoutCount)

/*
Chapter22: Protocol Extension - Silver Challenge p. 522
Sometimes you have a sequence of integers and want to add them up. You can do that by calling reduce(_:_:), but that is ugly and
counterintuitive. (Feel free to take time to review the reduce(_:_:) method in Chapter 13 on closures.)
 
To make summing sequences of number more convenient, add a computed property called sum to all sequences of numbers. You should be able to use
it like this:
    [4, 8, 15, 16, 23, 42].sum       // 108
    [80.5, 9.6].sum                  // 90.1
 
To solve this challenge, you will need to be able to answer a deeper question: What is a number? Look at the documentation for the Int and
Double types. What protocols do they conform to? What protocols do those protocols inherit from? Do Int and Double have any protocols in common
that would be a good place to add your extension?
*/

extension Collection where Element: Numeric {
    var sum: Element {
        var total: Element = 0
        for element in self {
            total += element
        }
        return total
    }
}

[4, 8, 15, 16, 23, 42].sum
[80.5, 9.6].sum 
