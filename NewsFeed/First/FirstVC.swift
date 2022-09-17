import UIKit

class FirstVC: UIViewController {
    
//    var firstVc = FirstVC()
    
    @IBOutlet weak var tableView: UITableView!
    
    var articlesArray = [Article]()
    
//    var imagesArray = [CurrentImage]()
    var postsArray = [CurrentPost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
//        NetworkManagerNewsApi().fetchData(urlString: urlByCountrysHeadlines(country: .UnitedStates)) { [weak self] result in
//            switch result {
//            case .success(let articles):
//                self?.reloadPostsArray(articles: articles)
//            case .failure: break
//            }
//        }
    }
    
    @IBOutlet weak var searchBarForWord: UISearchBar!
}

//MARK: TableView delegate

extension FirstVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return postsArray.count
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! FirstVCCell
        
//        cell.titleText.text = postsArray[indexPath.item].title
//        cell.authorText.text = postsArray[indexPath.item].author
//        cell.imagePost.downloadImage(stringUrl: postsArray[indexPath.item].urlToImage!)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let readVc = segue.destination as? ReadVC {
//            guard let indexPath = tableView.indexPathForSelectedRow else { return }
//            readVc.textLabel.text = articlesArray[indexPath.item].content
//            readVc.titleLabel.text = articlesArray[indexPath.item].title
//            readVc.authorLabel.text = articlesArray[indexPath.item].author
//                        readVc.imageView.image =
//        }
//
//    }
    
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

extension FirstVC {
    
    func reloadPostsArray(articles: [Article]) {
        self.postsArray = articles.compactMap({ CurrentPost(sourceName: $0.source?.name,
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
}


