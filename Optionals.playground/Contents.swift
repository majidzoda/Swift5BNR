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
errorDescription = nilgi
let description = errorDescription ?? "No error."
