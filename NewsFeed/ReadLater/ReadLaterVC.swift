import UIKit
import RealmSwift

final class ReadLaterVC: UIViewController {
    
    //MARK: Realm
    
    private var realm = try! Realm()
    private var postsArray: Results<PostRealmModel> {
        get {
            return realm.objects(PostRealmModel.self)
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
        
        self.tableView.dataSource = self
        self.tableView.delegate   = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateThemeUi()
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.animateTableView()
    }
    
    //MARK: Update Ui
    
    private func updateThemeUi() {
        let savedAnswer = userDefaults.object(forKey: KeyForUserDefaults.isLightTheme) as? Bool
        if let safeAnswer = savedAnswer {
            if safeAnswer {
                tableView.backgroundColor = UIColor.whiteCustom
                self.view.backgroundColor = UIColor.pinkLightCustom
                self.navigationController?.navigationBar.barTintColor = UIColor.whiteCustom
                self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blackCustom]
            } else {
                tableView.backgroundColor = UIColor.blackCustom
                self.view.backgroundColor = UIColor.blackCustom
                self.navigationController?.navigationBar.barTintColor = UIColor.blackCustom
                self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.whiteCustom]
            }
        }
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
    
    //MARK: ReadLaterVC - WebView
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath == tableView.indexPathForSelectedRow else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let readVC = storyboard.instantiateViewController(identifier: "ReadVC") as? ReadVC else { return }
        readVC.stringUrl = postsArray[indexPath.item].url ?? ""
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(readVC, animated: true)
        }
    }
    
    //MARK: ReadVC - SettingsVC
    
    @IBAction func settingsBarButton(_ sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsVC") else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: Extension - TableView

extension ReadLaterVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postsArray.count
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
        cell.titleLabel.text = currentPost.title
        cell.shortContentLabel.text = currentPost.shortContent
        cell.imagePost.downloadImagePost(stringUrl: currentPost.urlToImage ?? "")
        
        //Update UI
        let savedAnswer = userDefaults.object(forKey: KeyForUserDefaults.isLightTheme) as? Bool
        if let safeAnswer = savedAnswer {
            if safeAnswer {
                cell.backgroundColor = UIColor.whiteCustom
            } else {
                cell.backgroundColor = UIColor.blackCustom
            }
        }
        cell.selectionStyle = .none
        
        let layer = cell.layer
        layer.borderWidth = 2.0
        layer.cornerRadius = 8.0
        layer.borderColor = UIColor.gray.withAlphaComponent(0.1).cgColor
        
        return cell
    }
    
    /* Height row */
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 530.0
    }
}

