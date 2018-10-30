import Foundation
import Alamofire
import SwiftyJSON

// global variable, it's outside the class
// private makes it visible and accessible within current file
// singleton - global constant that can be accessed throuth a class property
private let _API_SharedInstance = API()

class API {
    // computed class property
    // class property returns private global variable
    class var sharedInstance: API {
        return _API_SharedInstance
    }
    
    static let Fee_JSON_URL: URL = URL(string: "https://learnappmaking.com/feed/json")!
    
    
    func requestArticles() -> Void {
        Alamofire.request(API.Fee_JSON_URL).responseJSON { (response) in
            if let data = response.data {
                do {
                    let json = try JSON(data: data)
                    print("JSON: \(json)")
                    self.processArticles(json: json)
                }
                catch {
                    print("JSON error: \(error)")
                }
            } else {
                print(response.result.error ?? "Unknown error")
            }
        }
    }
    
    func processArticles(json: JSON) {
        print(json)
    }
}
