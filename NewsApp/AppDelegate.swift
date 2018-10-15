import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        
        let newsTableVC = NewsTableViewController()
        newsTableVC.title = "News"
        let navigationVC = UINavigationController(rootViewController: newsTableVC)
        
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()

        return true
    }

}

