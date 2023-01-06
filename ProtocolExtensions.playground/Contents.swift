import Cocoa

protocol Exercise: CustomStringConvertible {
    var caloriesBurned: Double { get set }
    var minutes: Double { get set }
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
