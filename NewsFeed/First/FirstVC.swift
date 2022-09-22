import UIKit

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
    
    var articlesArray = [Article]()
    
    var imagesArray = [CurrentImage]()
    var postsArray  = [CurrentPostModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate   = self
        self.searchBar.delegate   = self
        
        
        
        NetworkManagerNewsApi().fetchData(urlString: createStringUrl.byCountrysHeadlines(countryCodes: CountrysCodes.France.rawValue)) { [weak self] result in
            switch result {
            case .success(let articles):
                self?.reloadPostsArray(articles: articles)
            case .failure: break
            }
        }
        
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
            animateTableView(self.tableView)
            print("Presented dark display mode on RateVc")
        default:
            tableView.backgroundColor = whiteColor
            self.view.backgroundColor = whiteColor
            newsFeedLabel.titleView?.tintColor = UIColor.black
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
        
        cell.imagePost.downloadImage(stringUrl: postsArray[indexPath.item].urlToImage ?? "")
        switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int ?? 0 {
        case 0:
            cell.backgroundColor = whiteColor
        case 1:
            cell.backgroundColor = blackColor
        default:
            cell.backgroundColor = whiteColor
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    //MARK: Actions Row
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("You tapped cell number - \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let readLaterAction = UIContextualAction(
            style: .normal,
            title: nil) { [weak self] (action, view, completion) in
                
                lazy var readLaterVc = ReadLaterVC()
                if let currentPost = self?.postsArray[indexPath.item] {
                    readLaterVc.savedPosts.append(currentPost)
                    completion(true)
                }
            }
        readLaterAction.backgroundColor = .black
        readLaterAction.image = UIImage(systemName: "star")
        let configuration = UISwipeActionsConfiguration(actions: [readLaterAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let readLaterVc = segue.destination as? ReadLaterCell {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            readLaterVc.titleLabel.text = postsArray[indexPath.item].title ?? ""
        }
    }
}


//MARK: Download image

extension UIImageView {
    
    func downloadImage(stringUrl: String) {
        guard let url = URL(string: stringUrl), UIApplication.shared.canOpenURL(url) else { print("ERROR: image URL-address not valid."); return }
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let safeData = data, error == nil {
                DispatchQueue.main.async {
                    self.image = UIImage(data: safeData)
                }
            }
        }
        task.resume()
        print("SUCCESSED downloading Image")
    }
}


//MARK: Reload postsArray & reload TableView

extension FirstVC: UISearchBarDelegate {
    
    
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
        reloadTableView()
    }
    
    
    //MARK: Reload TableView
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    //MARK: Search Results
    
    
    //    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //
    //        if searchText == "" {
    //            filteredData = dataArray
    //        } else {
    //
    //            filteredData = [:]
    //            for word in dataArray.keys {
    //
    //                if word.uppercased().contains(searchText.uppercased()) {
    //                    filteredData = dataArray.filter({ $0.key.contains(word) })
    //                    print(filteredData)
    //                } else {
    //                    filteredData = dataArray
    //                }
    //            }
    //            self.tableView.reloadData()
    //            animateTableView(tableView)
    //        }
    //    }
}




