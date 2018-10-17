import UIKit
import WebKit

class NewsDetailViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var authorLabel: UILabel?
    @IBOutlet weak var webView: WKWebView?
    @IBOutlet weak var webViewHeightConstraint: NSLayoutConstraint?
    
    var author: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel?.text = self.title
        authorLabel?.text = self.author
        
        webView?.navigationDelegate = self
        
        let url = URL(string: "https://learnappmaking.com/lipsum.html")
        let request = URLRequest(url: url!)
        webView?.load(request)
        
    }
}
