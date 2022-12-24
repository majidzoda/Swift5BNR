import UIKit

//var errorCodeString: Optional<String>
//errorCodeString = Optional("404")

var errorCodeString: String?
errorCodeString = "404"
var errorDescription: String?

//if errorCodeString != nil {
//    let theError = errorCodeString!
//    print(theError)
//}

//if let theError = errorCodeString {
//    print(theError)
//}g



//if let theError = errorCodeString {
//    if let errorCodeInt = Int(theError){
//        print("\(theError): \(errorCodeInt)")
//    }
//}



//if let theError = errorCodeString, let errorCodeInt = Int(theError){
//    print("\(theError): \(errorCodeInt)")
//}

if let theError = errorCodeString, let errorCodeInt = Int(theError), errorCodeInt == 404 {
    errorDescription = "\(errorCodeInt + 200): resource not found."
}

var upCaseErrorDescription = errorDescription?.uppercased()
upCaseErrorDescription?.append(" PLEASE TRY AGAIN.")
upCaseErrorDescription

//let description: String
//if let errorDescription = errorDescription {
//    description = errorDescription
//} else {
//    description = "No error."
//}
errorDescription = nil
let description = errorDescription ?? "No error."

/*
Chapter9: Optionals - Bronze Challenge p. 185
Optionals are best used for things that can literally be nil. That is, they are useful in representing the complete
absence of something. But nonexistence is not the same as zero. For example, if you are writing code to model a bank
account and the user has no balance in a given account, the value 0 is more appropriate than nil. The user does not lack
an account – what they are missing is money! Take a look at the examples below and select which type would model them
best.
 - A person’s age: Int or Int?
 - A person’s middle name: String or String?
 - A person’s kids’ names: [String] or [String]?
or [String?]
*/

var personsAge: Int
var middleName: String?
var kidsName: [String]?


/*
Chapter9: Optionals - Silver Challenge p. 186
Earlier in the chapter we told you that accessing an optional’s value when it is nil will result in a runtime error. Make
this mistake by force-unwrapping an optional when it is nil. Next, examine the error and understand what the error is
telling you.
*/

var optionalNil: String?
// print(optionalNil!)
// __lldb_expr_265/Optionals.playground:76: Fatal error: Unexpectedly found nil while unwrapping an Optional value

/*
Chapter9: Optionals Gold Challenge p. 187
Open your playground from Chapter 8, Arrays.playground. Consult the documentation to find a method on Array that will
locate the index of "Go on an Arctic expedition" in your bucketList. This method will return an Index?. Unwrap that value
and use it to compute the index that is two positions later in the array. Last, use this new index to find the String at
that position within your bucketList. Look at the documentation for the String and Array types. What other properties and
methods work with optionals? Why?
*/

var chapter8ArrayBucketList = ["Climb Mt. Everest",
                               "Read War and Peace",
                               "Go on a arctic expedition",
                               "Scuba dive in the Great Blue Hole",
                               "Find a triple rainbow"
]

var arcticExpeditionIndex = chapter8ArrayBucketList.firstIndex(of: "Go on a arctic expedition")

if let index = arcticExpeditionIndex {
    print(chapter8ArrayBucketList[index+2])
}

