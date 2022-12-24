import UIKit

//var errorCodeString: Optional<String>
//errorCodeString = Optional("404")

var errorCodeString: String?
errorCodeString = "404"

if errorCodeString != nil {
    let theError = errorCodeString!
    print(theError)
}
