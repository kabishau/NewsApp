import UIKit
import RealmSwift

class NewsTableViewController: UITableViewController {
    
    var articles: Results<Article> {
        get {
            let realm = try! Realm()
            return realm.objects(Article.self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        NotificationCenter.default.addObserver(self, selector: #selector(onArticlesRecieved(notification:)), name: API.articlesReceivedNotification, object: nil)
        
        API.sharedInstance.requestArticles()
        
        // google analytics
        let build = GAIDictionaryBuilder.createScreenView().set("News Overview", forKey: kGAIScreenName).build() as NSDictionary
        GAI.sharedInstance().defaultTracker.send(build as [NSObject: AnyObject])

    }
    
    @objc func onArticlesRecieved(notification: Notification) {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cellIndetifier")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cellIndetifier")
        }
        let article = articles[indexPath.row]
        cell!.textLabel?.text = article.title
        cell!.detailTextLabel?.text = article.excerpt
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = NewsDetailViewController(nibName: "NewsDetailViewController", bundle: nil)
        
        detailVC.article = articles[indexPath.row]
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
