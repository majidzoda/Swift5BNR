import UIKit

var statusCode: Int = 418
var errorString: String = "The request failed with the error: "

switch statusCode {
case 401:
    errorString += "Unauthorized"
case 400...417:
    errorString += "Client error, \(statusCode)."
case 500...505:
    errorString += "Server error, \(statusCode)."
case let code where code < 100 || code >= 600:
    errorString = "\(code) is an illegal status code."
default:
    errorString = "Unexpected error encountered."
}

let error = (code: statusCode, msg: errorString)
error.code
error.msg

let firstErrorCode = 404
let secondErrorCode = 418
let errorCodes = (firstErrorCode, secondErrorCode)

switch errorCodes {
case (404, 404):
    print("Both error codes were 404.")
case (404, _):
    print("Only the 1st code is 404, and we don't care about the 2nd code.")
case (_, 404):
    print("Only the 2nd code is 404, and we don't care about the 1st code.")
default:
    print("Neither code is 404.")
}

let age = 25
//switch age {
//case 18...35:
//    print("Cool demographic")
//default:
//    break
//}

//if case 18...35 = age {
//    print("Cool demographic")
//}

if case 18...35 = age, age >= 25 {
    print("Cool dempographic and can rent a car")
}

/*
Chapter5-Switch-BronzeChallenge p. 108
Review the switch statement below. What will be logged to the console? After you have decided, enter the code
in a playground to see whether you were right.

let point = (x: 1, y: 4)

switch point {
case let q1 where (point.x > 0) && (point.y > 0):
    print("\(q1) is in quadrant 1")

case let q2 where (point.x < 0) && point.y > 0:
    print("\(q2) is in quadrant 2")

case let q3 where (point.x < 0) && point.y < 0:
    print("\(q3) is in quadrant 3")

case let q4 where (point.x > 0) && point.y < 0:
    print("\(q4) is in quadrant 4")

case (_, 0):
    print("\(point) sits on the x-axis")

case (0, _):
    print("\(point) sits on the y-axis")

default:
    print("Case not covered.")
}
 
Answer: print("\(q1) is in quadrant 1")
*/

let point = (x: 1, y: 4)

switch point {
case let q1 where (point.x > 0) && (point.y > 0):
    print("\(q1) is in quadrant 1")

case let q2 where (point.x < 0) && point.y > 0:
    print("\(q2) is in quadrant 2")

case let q3 where (point.x < 0) && point.y < 0:
    print("\(q3) is in quadrant 3")

case let q4 where (point.x > 0) && point.y < 0:
    print("\(q4) is in quadrant 4")

case (_, 0):
    print("\(point) sits on the x-axis")

case (0, _):
    print("\(point) sits on the y-axis")

default:
    print("Case not covered.")
}


/*
Chapter5-Switch-Silver Challenge p.109
You can add more conditions to the if-case by supplying a comma-separated list. For example, you could check
whether the person is: a) in the cool demographic, b) old enough to rent a car in the United States, and c)
not in their thirties. Add another condition to Listing 5.13 to check whether age meets all three criteria.
*/

if case 18...35 = age, age >= 25, age < 30 {
    print("Cool dempographic and can rent a car and they are not in their 30s.")
}
