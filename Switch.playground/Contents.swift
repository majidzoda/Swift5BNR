import UIKit

var statusCode: Int = 404
var errorString: String = "The request failed with the error: "

switch statusCode {
case 401:
    errorString += "Unauthorized"
case 400...417:
    errorString += "Client error, 4xx."
case 500...505:
    errorString += "Server error, 5xx."
default:
    errorString += "Unknown status. Please review the request and try again."
}
