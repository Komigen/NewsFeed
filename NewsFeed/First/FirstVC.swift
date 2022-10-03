import UIKit
import RealmSwift

class FirstVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var createStringUrl = CreateStringUrl()
    private var imagesArray     = [UIImage?]()
    private var postsArray      = [CurrentPostModel]()
    
    //MARK: Realm
    
    private var realm = try! Realm()
    private var savedPosts = [PostRealmModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateThemeUi()
        
        NetworkManagerNewsApi().fetchData(urlString: createStringUrl.byCountrysHeadlines(countryCodes: CountrysCodes.UnitedStates.rawValue)) { [weak self] result in
            switch result {
            case .success(let articles):
                self?.reloadPostsArray(articles: articles)
            case .failure: break
            }
        }
        
        self.tableView.dataSource = self
        self.tableView.delegate   = self
        self.searchBar.delegate   = self
        
        //MARK: Update after change settings
        notificationCenter.addObserver(self, selector: #selector(updateUiAfterChangeSettings), name: .savedSettings, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.animateTableView()
    }
    
    //MARK: ReadVC - WebView
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let readVc = segue.destination as? ReadVC {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            readVc.stringUrl = postsArray[indexPath.item].url ?? ""
        }
    }
    
    //MARK: Update UI after change settings
    @objc private func updateUiAfterChangeSettings() {
        self.updateThemeUi()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        self.tableView.animateTableView()
    }
    
    //MARK: Update Ui 0 - light theme, 1 - dark
    
    @objc private func updateThemeUi() {
        
        switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int ?? 0 {
            
        case 0:
            tableView.backgroundColor = UIColor.whiteCustom
            view.backgroundColor      = UIColor.pinkLightCustom
            navigationController?.navigationBar.barTintColor = UIColor.whiteCustom
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blackCustom]
            tabBarController?.tabBar.barTintColor = UIColor.whiteCustom
            
        case 1:
            tableView.backgroundColor = UIColor.blackCustom
            view.backgroundColor      = UIColor.blackCustom
            navigationController?.navigationBar.barTintColor = UIColor.blackCustom
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.whiteCustom]
            tabBarController?.tabBar.barTintColor = UIColor.blackCustom
            
        default:
            break
        }
        searchBar.createSettings()
    }
}

//MARK: TableView

extension FirstVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! FirstVCCell
        
        cell.titleText.text = postsArray[indexPath.item].title
        cell.authorText.text = {
            if let author = postsArray[indexPath.item].author {
                return "Opinion by \(author)"
            } else {
                return "Author unknown"
            }
        }()
        cell.imagePost.downloadImagePost(stringUrl: postsArray[indexPath.item].urlToImage ?? "")
        
        //UI 0 - light theme, 1 - dark
        switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int ?? 0 {
        case 0:
            cell.backgroundColor = UIColor.whiteCustom
        case 1:
            cell.backgroundColor = UIColor.blackCustom
        default:
            break
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let readLaterAction = UIContextualAction(
            style: .normal,
            title: nil) { [weak self] (action, view, completion) in
                
                if let currentArticle = self?.postsArray[indexPath.item] {
                    
                    let savedPost = PostRealmModel()
                    savedPost.date         = currentArticle.publishedAt ?? ""
                    savedPost.title        = currentArticle.title ?? ""
                    savedPost.shortContent = currentArticle.content ?? ""
                    savedPost.urlToImage   = currentArticle.urlToImage ?? ""
                    savedPost.source       = currentArticle.sourceName ?? ""
                    savedPost.url          = currentArticle.url ?? ""
                    
                    try! self?.realm.write{
                        self?.realm.add(savedPost)
                    }
                    completion(true)
                }
            }
        
        readLaterAction.backgroundColor = UIColor.blackCustom
        readLaterAction.image = UIImage(systemName: "bookmark")
        let configuration = UISwipeActionsConfiguration(actions: [readLaterAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
}

//MARK: Reload postsArray & reload TableView

extension FirstVC {
    
    private func reloadPostsArray(articles: [Article]) {
        self.postsArray = articles.compactMap({ CurrentPostModel(sourceName: $0.source?.name,
                                                                 author: $0.author,
                                                                 title: $0.title,
                                                                 articleDescription: $0.articleDescription,
                                                                 url: $0.url,
                                                                 urlToImage: $0.urlToImage,
                                                                 publishedAt: $0.publishedAt,
                                                                 content: $0.content)
        })
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK: SearchBar

extension FirstVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if searchBar.text != "" {
            NetworkManagerNewsApi().fetchData(urlString: createStringUrl.byPhrase(phrase: searchBar.text!)) { [weak self] result in
                switch result {
                case .success(let articles):
                    self?.reloadPostsArray(articles: articles)
                case .failure: break
                }
            }
            searchBar.searchTextField.resignFirstResponder()
        }
    }
}

