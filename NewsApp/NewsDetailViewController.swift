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
    
    // don't need to call in directly; it's called right after web view finishes loading
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        webView.evaluateJavaScript("document.readyState") { (result, error) in
            
            if result == nil || error != nil {
                return
            }
            
            webView.evaluateJavaScript("document.body.offsetHeight", completionHandler: { (result, error) in
                if let height = result as? CGFloat {
                    self.webViewHeightConstraint?.constant = height
                }
            })
        }
    }
}
