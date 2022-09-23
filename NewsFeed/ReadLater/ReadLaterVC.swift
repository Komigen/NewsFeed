import UIKit

class ReadLaterVC: UIViewController {

    var savedPosts = [CurrentPostModel?]()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var readLaterLabel: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateThemeUi()
        self.tableView.dataSource = self
        self.tableView.delegate   = self
    }
    
    //MARK: Update Ui - light\dark theme
    
    func updateThemeUi() {
        switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int ?? 0 {
            
        case 0:
            tableView.backgroundColor = whiteColor
            self.view.backgroundColor = whiteColor
            readLaterLabel.titleView?.tintColor = UIColor.black
            tableView.reloadData()
            animateTableView(self.tableView)
            print("Presented light display mode on RateVc")
        case 1:
            tableView.backgroundColor = blackColor
            self.view.backgroundColor = self.tableView.backgroundColor
            readLaterLabel.titleView?.tintColor = UIColor.white
            tableView.reloadData()
            animateTableView(self.tableView)
            print("Presented dark display mode on RateVc")
        default:
            tableView.backgroundColor = whiteColor
            self.view.backgroundColor = whiteColor
            readLaterLabel.titleView?.tintColor = UIColor.black
            tableView.reloadData()
            animateTableView(self.tableView)
            print("Presented light display mode on RateVc")
        }
    }
    
    //MARK: Actions Row

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            savedPosts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .none)
            tableView.endUpdates()
        }
    }
    
    //MARK: ReadVC - WebView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let readVc = segue.destination as? ReadVC {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            readVc.stringUrl = savedPosts[indexPath.item]?.url ?? ""
        }
    }
}

//MARK: DataSource, Delegate

extension ReadLaterVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReadLaterCell", for: indexPath) as! ReadLaterCell
        let currentPost = savedPosts[indexPath.item]
        
        cell.sourceLabel.text = {
            if let sourceName = savedPosts[indexPath.item]?.sourceName {
                return "\(sourceName)"
            } else {
                return "Source unknown"
            }
        }()
        cell.dateLabel.text         = currentPost?.publishedAt
        cell.titleLabel.text        = currentPost?.title
        cell.shortContentLabel.text = currentPost?.content
        cell.imagePost.downloadImagePost(stringUrl: currentPost?.urlToImage ?? "")

        //UI
        switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int ?? 0 {
        case 0:
            cell.backgroundColor = whiteColor
        case 1:
            cell.backgroundColor = blackColor
        default:
            cell.backgroundColor = whiteColor
        }
        cell.selectionStyle = .none
        
        return cell
    }
}
