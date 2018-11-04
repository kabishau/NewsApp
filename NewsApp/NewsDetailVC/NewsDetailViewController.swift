import UIKit
import Alamofire
import WebKit

class NewsDetailViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var webViewHeightConstraint: NSLayoutConstraint?
    
    var article: Article?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = nil
        
        guard let article = article else { return }
        self.title = article.title
        titleLabel?.text = article.title
        authorLabel?.text = article.author
        
        if let imageUrl = URL(string: article.thumbnailURL) {
            Alamofire.request(imageUrl).responseData { response in
                if let data = response.result.value {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
        
        webView.navigationDelegate = self
        // disable scrolling on the web view, so it won’t conflict with the scroll view
        webView.scrollView.isScrollEnabled = false
        webView.loadHTMLString("""
            <html>
                <head>
                    <style>
                        body { font-family: -apple-system, Helvetica; sans-serif;}
                    </style>
                    <meta name="viewpoint" content="width=device-width initial-scale=1>
                </head>
                <body>
                    \(article.content)
                </body>
            </html>
            """, baseURL: nil)
        
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
