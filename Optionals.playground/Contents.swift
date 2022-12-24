import UIKit

//var errorCodeString: Optional<String>
//errorCodeString = Optional("404")

var errorCodeString: String?
errorCodeString = "404"

//if errorCodeString != nil {
//    let theError = errorCodeString!
//    print(theError)
//}

//if let theError = errorCodeString {
//    print(theError)
//}



//if let theError = errorCodeString {
//    if let errorCodeInt = Int(theError){
//        print("\(theError): \(errorCodeInt)")
//    }
//}



//if let theError = errorCodeString, let errorCodeInt = Int(theError){
//    print("\(theError): \(errorCodeInt)")
//}

if let theError = errorCodeString, let errorCodeInt = Int(theError), errorCodeInt == 404 {
    print("\(theError): \(errorCodeInt)")
}
