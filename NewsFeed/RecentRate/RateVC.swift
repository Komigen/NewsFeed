import UIKit

var dataArray = [String: Double]()
var networkManagerCoinLayer = NetworkManagerCoinLayer()


class RateVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTableView(tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManagerCoinLayer.fetchData { [weak self] currentRate in
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
        let keys = Array(dataArray.keys)
        let values = Array(dataArray.values)
        
        cell.shortNameRate.text = keys[indexPath.row]
        cell.valueRate.text = String(values[indexPath.row])
//        cell.nameRate.text =
        
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
