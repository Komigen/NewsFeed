import UIKit

var networkManager = NetworkManagerNewsApi()
var currentPosts = [Article]()
var createUrlString = CreateUrlString()

class FirstVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.fetchData(urlString: createUrlString.fetchDataByCountrysHeadlines(country: .UnitedStates))
        self.tableView.dataSource = self
        self.tableView.delegate = self

        

         
    }
   
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "FirstVCToReadVC" {
//            let readVc = segue.destination as! ReadVC
//            let cell = sender as! FirstVCCell
//            cell.imagePost.image = cell.dogImageView.image
//        }
//    }
    
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
}

//MARK: Download image
extension UIImageView {
    
    func downloadImage(url: String) {
        guard let url = URL(string: url) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let safeData = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: safeData)
                }
            }
        }.resume()
        print("Successed downloading Image")
    }
}
