import UIKit
import RealmSwift

class FirstVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.layer.cornerRadius = 16.0
            searchBar.clipsToBounds = true
        }
    }
    @IBOutlet weak var newsFeedLabel: UINavigationItem!
    
    var createStringUrl = CreateStringUrl()
    var imagesArray     = [UIImage?]()
    var postsArray      = [CurrentPostModel]()
    
    //MARK: Realm
    
    var realm = try! Realm()
    var savedPosts = [PostRealmModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateThemeUi()
        self.tableView.dataSource = self
        self.tableView.delegate   = self
        self.searchBar.delegate   = self
        animateTableView(self.tableView)
        
        
        NetworkManagerNewsApi().fetchData(urlString: createStringUrl.byCountrysHeadlines(countryCodes: CountrysCodes.France.rawValue)) { [weak self] result in
            switch result {
            case .success(let articles):
                self?.reloadPostsArray(articles: articles)
            case .failure: break
            }
        }
    }
    
    //MARK: ReadVC - WebView
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let readVc = segue.destination as? ReadVC {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            readVc.stringUrl = postsArray[indexPath.item].url ?? ""
        }
    }
    
    //MARK: Update Ui - light\dark theme
    
    func updateThemeUi() {
        switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int ?? 0 {
            
        case 0:
            tableView.backgroundColor = whiteColor
            self.view.backgroundColor = whiteColor
            newsFeedLabel.titleView?.tintColor = UIColor.black
            tableView.reloadData()
            animateTableView(self.tableView)
            print("Presented light display mode on RateVc")
        case 1:
            tableView.backgroundColor = blackColor
            self.view.backgroundColor = self.tableView.backgroundColor
            newsFeedLabel.titleView?.tintColor = UIColor.white
            tableView.reloadData()
            animateTableView(self.tableView)
            print("Presented dark display mode on RateVc")
        default:
            tableView.backgroundColor = whiteColor
            self.view.backgroundColor = whiteColor
            newsFeedLabel.titleView?.tintColor = UIColor.black
            tableView.reloadData()
            animateTableView(self.tableView)
            print("Presented light display mode on RateVc")
        }
    }
}

//MARK: TableView delegate

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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    //MARK: Actions Row
    
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
        
        readLaterAction.backgroundColor = .black
        readLaterAction.image = UIImage(systemName: "star")
        let configuration = UISwipeActionsConfiguration(actions: [readLaterAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
}


//MARK: Reload postsArray & reload TableView

extension FirstVC {
    
    func reloadPostsArray(articles: [Article]) {
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


//MARK: Animated tableView

public func animateTableView(_ tableView: UITableView) {
    tableView.reloadData()
    
    let cells = tableView.visibleCells
    let tableViewHeight = tableView.bounds.height
    var delay = 0.0
    
    for cell in cells {
        cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        
        UIView.animate(withDuration: 1.5,
                       delay: delay * 0.05,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: .curveEaseOut,
                       animations: {
            cell.transform = CGAffineTransform.identity
        })
        delay += 0.7
    }
}

//MARK: UISearchBarDelegate

extension FirstVC: UISearchBarDelegate {
    
}
