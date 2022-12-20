import UIKit

var statusCode: Int = 13
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
