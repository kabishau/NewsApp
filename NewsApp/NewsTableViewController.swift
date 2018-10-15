import UIKit

class NewsTableViewController: UITableViewController {
    
    var titles:[String] = [
        "New York Lakers Score Again!",
        "Apple Presents New iWatch",
        "Deeplink.me Wants To Break Open App Discovery",
        "Silly Cat Attempts Jump And Hits Air",
        "New MacBook Air So Thin People Can't See It",
        "Higgs-Boson Finally Discovered In Scientists Coat"
    ]
    
    var authors:[String] = [
        "Bob",
        "Alice",
        "Reinder",
        "Aleksey",
        "Ford",
        "Zaphod"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cellIndetifier")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cellIndetifier")
        }
        cell!.textLabel?.text = titles[indexPath.row]
        cell!.detailTextLabel?.text = authors[indexPath.row]
        
        return cell!
    }
}
