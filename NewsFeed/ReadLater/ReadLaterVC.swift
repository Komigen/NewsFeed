import UIKit
import RealmSwift

class ReadLaterVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.animateTableView()
    }
    
    //MARK: Update Ui - 0 - light theme, 1 - dark
    
    private func updateThemeUi() {
        switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Bool ?? true {
            
        case true:
            tableView.backgroundColor = UIColor.whiteCustom
            self.view.backgroundColor = UIColor.pinkLightCustom
            self.navigationController?.navigationBar.barTintColor = UIColor.whiteCustom
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blackCustom]
        case false:
            tableView.backgroundColor = UIColor.blackCustom
            self.view.backgroundColor = UIColor.blackCustom
            self.navigationController?.navigationBar.barTintColor = UIColor.blackCustom
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.whiteCustom]
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
    
    //MARK: ReadVC - WebView
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let readVc = segue.destination as? ReadVC {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            readVc.stringUrl = postsArray[indexPath.item].url ?? ""
        }
    }
    
    //MARK: TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
        cell.titleLabel.text = currentPost.title
        cell.shortContentLabel.text = currentPost.shortContent
        cell.imagePost.downloadImagePost(stringUrl: currentPost.urlToImage ?? "")
        
        //UI true - light theme, false - dark
        switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Bool ?? true {
        case true:
            cell.backgroundColor = UIColor.whiteCustom
        case false:
            cell.backgroundColor = UIColor.blackCustom
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
