import UIKit

var networkManagerCoinLayer = NetworkManagerCoinLayer()

class RateVC: UIViewController {
    
    @IBOutlet weak var tableView:            UITableView!
    @IBOutlet weak var searchBar:            UISearchBar!
    @IBOutlet weak var currencyRatesLabel:   UILabel!
    @IBOutlet weak var settingsButtonOutlet: UIBarButtonItem!
    
    var dataArray    = [String: Double]()
    var filteredData = [String: Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUi()

        networkManagerCoinLayer.fetchDataRates { [weak self] currentRate in
            guard let self    = self else { return }
            self.dataArray    = currentRate
            self.filteredData = self.dataArray
            DispatchQueue.main.async {
                self.tableView.reloadData()
                animateTableView(self.tableView)
            }
        }
                
        tableView.dataSource = self
        tableView.delegate   = self
        searchBar.delegate   = self
    }
    
    //MARK: Ui settings before display

    func prepareUi() {
        switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int ?? 0 {
        case 0:
            tableView.backgroundColor    = whiteColor
            self.view.backgroundColor    = whiteColor
            searchBar.barTintColor       = systemGray6Color
            searchBar.layer.cornerRadius = 16.0
            searchBar.clipsToBounds      = true
            currencyRatesLabel.textColor = blackColor
            print("Presented light display mode on RateVc")
        case 1:
            tableView.backgroundColor    = blackColor
            self.view.backgroundColor    = blackColor
            searchBar.barTintColor       = systemGray6Color
            searchBar.layer.cornerRadius = 16.0
            searchBar.clipsToBounds      = true
            currencyRatesLabel.textColor = whiteColor
            print("Presented dark display mode on RateVc")
        default: break
        }
    }
}

//MARK: TableView delegate

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
}

//MARK: Download image

extension UIImageView {
    
    func downloadImageCoin(shortName: String) {
        guard let url = URL(string: "https://assets.coinlayer.com/icons/\(shortName).png"), UIApplication.shared.canOpenURL(url) else { print("ERROR: imageCoin URL-address not valid."); return }
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let safeData = data, error == nil {
                DispatchQueue.main.async {
                    self.image = UIImage(data: safeData)
                }
            }
        }
        task.resume()
        print("SUCCESSED downloading ImageCoin")
    }
}

//MARK: UISearchBarDelegate

extension RateVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            filteredData = dataArray
        } else {
            
            filteredData = [:]
            for word in dataArray.keys {
                
                if word.uppercased().contains(searchText.uppercased()) {
                    filteredData = dataArray.filter({ $0.key.contains(word) })
                }
            }
            self.tableView.reloadData()
            animateTableView(tableView)
        }
    }
}
