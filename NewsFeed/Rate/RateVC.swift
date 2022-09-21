import UIKit

var dataArrayCrypto = Crypto()
var networkManagerCoinLayer = NetworkManagerCoinLayer()

class RateVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var dataArray    = [String: Double]()
    var filteredData = [String: Double]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTableView(tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        networkManagerCoinLayer.fetchDataRates { [weak self] currentRate in
            guard let self = self else { return }
            self.dataArray = currentRate
            self.filteredData = self.dataArray
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
                
        tableView.dataSource = self
        tableView.delegate   = self
        searchBar.delegate   = self
    }
}


extension RateVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RateCell", for: indexPath) as! RateViewCell
        
        let values = Array(filteredData.values)
        let keys   = Array(filteredData.keys)
        
        cell.shortNameRate.text = String(keys[indexPath.row])
        cell.valueRate.text     = String(values[indexPath.row])
        
        if cell.shortNameRate.text != nil {
            cell.imageIcon.downloadImageCoin(shortName: cell.shortNameRate.text!)
        }
        return cell
    }
    
    
    //MARK: Animated tableView
    
    private func animateTableView(_ tableView: UITableView) {
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
}


//MARK: Search Results

extension RateVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            filteredData = dataArray
        } else {
            
            filteredData = [:]
            for word in dataArray.keys {
                
                if word.uppercased().contains(searchText.uppercased()) {
                    filteredData = dataArray.filter({ $0.key.contains(word) })
                    print(filteredData)
                } else {
                    filteredData = dataArray
                }
            }
            self.tableView.reloadData()
            animateTableView(tableView)
        }
    }
}

//MARK: Download image

extension UIImageView {
    
    func downloadImageCoin(shortName: String) {
        guard let url = URL(string: "https://assets.coinlayer.com/icons/\(shortName).png"), UIApplication.shared.canOpenURL(url) else { print("ERROR: image URL-address not valid."); return }
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
