import UIKit

var statusCode: Int = 404
var errorString: String = "The request failed with the error: "

switch statusCode {
case 401:
    errorString += "Unauthorized"
case 400...417:
    errorString += "Client error, \(statusCode)."
case 500...505:
    errorString += "Server error, \(statusCode)."
default:
    errorString = "\(statusCode) is not a know error."
}
