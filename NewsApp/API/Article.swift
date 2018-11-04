import Foundation
import RealmSwift

class Article: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var author: String = ""
    @objc dynamic var content: String = ""
    @objc dynamic var thumbnailURL: String = ""
    @objc dynamic var articleURL: String = ""
    @objc dynamic var excerpt: String = ""
    @objc dynamic var creationDate: Date = Date()
    
    // sets the primary key
    override static func primaryKey() -> String? {
       return "id"
    }
}
