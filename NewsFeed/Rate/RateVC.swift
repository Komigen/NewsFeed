import UIKit

private var networkManagerCoinLayer = NetworkManagerCoinLayer()

class RateVC: UIViewController {
    
    @IBOutlet weak var tableView:            UITableView!
    @IBOutlet weak var searchBar:            UISearchBar!
    @IBOutlet weak var currencyRatesLabel:   UILabel!
    @IBOutlet weak var settingsButtonOutlet: UIBarButtonItem!
    
    private var dataArray    = [String: Double]()
    private var filteredData = [String: Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateThemeUi()
        networkManagerCoinLayer.fetchDataRates { [weak self] currentRate in
            guard let self    = self else { return }
            self.dataArray    = currentRate
            self.filteredData = self.dataArray
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.dataSource = self
        tableView.delegate   = self
        searchBar.delegate   = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateThemeUi()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.animateTableView()
    }
    
    //MARK: Ui 0 - light theme, 1 - dark
    
    private func updateThemeUi() {
        switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Bool ?? true {
        case true:
            tableView.backgroundColor    = UIColor.whiteCustom
            self.view.backgroundColor    = UIColor.whiteCustom
            currencyRatesLabel.textColor = UIColor.blackCustom
            self.navigationController?.navigationBar.barTintColor = UIColor.whiteCustom
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blackCustom]
            
        case false:
            tableView.backgroundColor    = UIColor.blackCustom
            self.view.backgroundColor    = UIColor.blackCustom
            currencyRatesLabel.textColor = UIColor.whiteCustom
            navigationController?.navigationBar.barTintColor = UIColor.blackCustom
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.whiteCustom]
        }
        searchBar.createSettings()
        DispatchQueue.main.async {
            self.tableView.reloadData()
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
        
        //UI true - light theme, false - dark
        switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Bool ?? true {
        case true:
            cell.backgroundColor = UIColor.whiteCustom
        case false:
            cell.backgroundColor = UIColor.blackCustom
        }
        cell.selectionStyle = .none
        return cell
    }
}


//MARK: UISearchBarDelegate

extension RateVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            filteredData = dataArray
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } else {
            
            filteredData = [:]
            for word in dataArray.keys {
                
                if word.uppercased().contains(searchText.uppercased()) {
                    filteredData = dataArray.filter({ $0.key.contains(word) })
                }
            }
            self.tableView.animateTableView()
        }
    }
}
