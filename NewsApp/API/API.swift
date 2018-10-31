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
    
    static let Feed_JSON_URL: URL = URL(string: "https://learnappmaking.com/feed/json")!
    
    
    func requestArticles() -> Void {
        Alamofire.request(API.Feed_JSON_URL).responseJSON { (response) in
            if let data = response.data {
                do {
                    let json = try JSON(data: data)
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
        
        var articles = [Article]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        // SwiftyJSON
        for (_, item) in json {
            
            let article = Article()
            
            if let id: Int = item["id"].int {
                article.id = id
            }
            
            if let title: String = item["title"].string {
                article.title = title
            }
            
            if let author: String = item["author"].string {
                article.author = author
            }
            
            if let excerpt: String = item["excerpt"].string {
                article.excerpt = excerpt
            }
            
            if let content: String = item["content"].string {
                article.content = content
            }
            
            if let articleURL: String = item["permalink"].string {
                article.articleURL = articleURL
            }
            
            if let thumbnailURL: String = item["thumbnail"].string {
                article.thumbnailURL = thumbnailURL
            }
            
            if let dateString = item["date"].string,
            let creationDate = dateFormatter.date(from: dateString) {
                article.creationDate = creationDate
            }
            articles.append(article)
        }
        print(articles)
    }
}
