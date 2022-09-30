import UIKit
import RealmSwift

class ReadLaterVC: UIViewController {
    
    //MARK: Realm
    var realm = try! Realm()
    var postsArray: Results<PostRealmModel> {
        get {
            return realm.objects(PostRealmModel.self)
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var readLaterLabel: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
        
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
            readLaterLabel.titleView?.tintColor = blackColor
            print("Presented light display mode on RateVc")
        case 1:
            tableView.backgroundColor = blackColor
            self.view.backgroundColor = blackColor
            readLaterLabel.titleView?.tintColor = whiteColor
            print("Presented dark display mode on RateVc")
        default:
            tableView.backgroundColor = whiteColor
            self.view.backgroundColor = whiteColor
            readLaterLabel.titleView?.tintColor = blackColor
            print("Presented light display mode on RateVc")
        }
        tableView.reloadData()
        animateTableView(self.tableView)
    }
    
    
    //MARK: Delete action row
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let currentPost = postsArray[indexPath.row]
            
            try! self.realm.write {
                self.realm.delete(currentPost)
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    //MARK: ReadVC - WebView
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let readVc = segue.destination as? ReadVC {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            readVc.stringUrl = postsArray[indexPath.item].url ?? ""
        }
    }
}

//MARK: DataSource, Delegate

extension ReadLaterVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 539.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !postsArray.isEmpty {
            return postsArray.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReadLaterCell", for: indexPath) as! ReadLaterCell
        let currentPost = postsArray[indexPath.row]
        
        cell.sourceLabel.text = {
            if let sourceName = postsArray[indexPath.row].source {
                return "\(sourceName)"
            } else {
                return "Source unknown"
            }
        }()
        cell.dateLabel.text?.getFormattedDate(stringDate: currentPost.date)
        cell.titleLabel.text        = currentPost.title
        cell.shortContentLabel.text = currentPost.shortContent
        cell.imagePost.downloadImagePost(stringUrl: currentPost.urlToImage ?? "")
        
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
