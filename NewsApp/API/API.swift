import Foundation
import Alamofire
import SwiftyJSON

// global variable, it's outside the class
// private makes it visible and accessible within current file
private let _API_SharedInstance = API()

class API {
    // computed class property
    // class property returns private global variable
    class var sharedInstance: API {
        return _API_SharedInstance
    }
}
