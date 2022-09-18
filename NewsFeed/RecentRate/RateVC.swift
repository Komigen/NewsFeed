import UIKit

var dataArray = [CurrentRate]()
var networkManagerCoinLayer = NetworkManagerCoinLayer()


class RateVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTableView(tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManagerCoinLayer.fetchData()
        networkManagerCoinLayer.onCompletion = {  [weak self] currentRate in
            guard let self = self else { return }
            dataArray = currentRate
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

        
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
}


extension RateVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RateCell", for: indexPath) as! RateViewCell
        cell.nameRate.text = dataArray[indexPath.item].rateKey
        cell.shortNameRate.text = dataArray[indexPath.item].rateKey
        cell.valueRate.text = dataArray[indexPath.item].rateValue

        
        return cell
    }
   
    private enum UrlDownloadImage: String {
        case BTC = "https://assets.coinlayer.com/icons/BTC.png"
        case ETH = "https://assets.coinlayer.com/icons/ETH.png"
        case BCH = "https://assets.coinlayer.com/icons/BCH.png"
        case EOS = "https://assets.coinlayer.com/icons/EOS.png"
        case LTC = "https://assets.coinlayer.com/icons/LTC.png"
        case XMR = "https://assets.coinlayer.com/icons/XMR.png"
        case XRP = "https://assets.coinlayer.com/icons/XRP.png"
    }
    
    
    //    var image: UIImage?  {
    //        switch target {
    //
    //        case "BTC": return ""
    //        case "ETH": return ""
    //        case "BCH": return ""
    //        case "EOS": return ""
    //        case "LTC": return ""
    //        case "XMR": return ""
    //        case "XRP": return ""
    //
    //        default:
    //            return "default"
    //    }
    
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


