import UIKit

var networkManager = NetworkManager()

var dataArrayNews = [ModelNews]()

var postsArray = [CurrentPost]()
var imagesArray = [UIImage]()

class FirstVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.fetchData(urlString: "https://newsapi.org/v2/everything?q=putin&apiKey=4ace509310244680ae2b2a43a8341974")
        networkManager.onCompletion = { currentPost, image in
            postsArray.append(currentPost)
            imagesArray.append(image)
        }
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
        
        
        
        
        
        /*
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
    }
}

extension FirstVC: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! FirstVCCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
}

