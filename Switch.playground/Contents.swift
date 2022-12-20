import UIKit

var statusCode: Int = 404
var errorString: String = "The request failed"

switch statusCode {
case 401, 403, 404:
    errorString += "There was something wrong with the request."
    fallthrough
default:
    errorString += "Please review request and try again."
}
