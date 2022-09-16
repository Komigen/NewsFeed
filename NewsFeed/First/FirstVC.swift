import UIKit

var currentPosts = [Article]()
var createUrlString = CreateUrlString()

class FirstVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManagerNewsApi().fetchData(urlString: createUrlString.fetchDataByCountrysHeadlines(country: .UnitedStates)) { [weak self] result in
            switch result {
            case .success: 
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure: break
            }
        }
        
        self.tableView.dataSource = self
        self.tableView.delegate = self

        

         
    }
}

extension FirstVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return currentPosts.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! FirstVCCell
        
//        cell.titleText.text = currentPosts[indexPath.item].title
//        cell.authorText.text = currentPosts[indexPath.item].author
//        cell.imagePost.downloadImage(url: currentPosts[indexPath.item].urlToImage!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: Download image
extension UIImageView {
    
    func downloadImage(stringUrl: String) {
        guard let url = URL(string: stringUrl), UIApplication.shared.canOpenURL(url) else { print("ERROR: image URL-address not valid."); return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let safeData = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: safeData)
                }
            }
        }.resume()
        print("SUCCESSED downloading Image")
    }
}
