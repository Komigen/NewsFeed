import UIKit

var dataArray = [CurrentRate]()
var networkManagerCoinLayer = NetworkManagerCoinLayer()

class RecentRateVC: UIViewController {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTableView(tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManagerCoinLayer.fetchData()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
}


extension RecentRateVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentRateCell", for: indexPath) as! RecentRateViewCell
        cell.rusNamesOfQuotes.text = "tembete"
        //        cell.imageCountry = da
        //        cell.imageCountry.layer.cornerRadius = 10.0
//        cell.rusNamesOfQuotes.text = dataArray[indexPath.row]
        //        cell.engNamesOfQuotes =
        //        cell.course =
        //        cell.diffCourse =
        
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


