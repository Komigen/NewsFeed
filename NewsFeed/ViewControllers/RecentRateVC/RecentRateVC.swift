import UIKit

var dataArray = [ModelCoinLayer]()
var networkManagerCoinLayer = NetworkManagerCoinLayer()

class RecentRateVC: UIViewController {


    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var cryptoButton: UIButton!
    @IBOutlet weak var quotesButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let singleRadius = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        networkManagerCoinLayer.fetchData()
        
        tableView.dataSource = self
        tableView.delegate = self
        starButton.layer.cornerRadius = singleRadius

    }
    

    
    
    @IBAction func starButton(_ sender: UIButton) {
        
    }
    
    @IBAction func quotesButton(_ sender: UIButton) {
        
    }
    
    @IBAction func cryptoButton(_ sender: UIButton) {
        
    }
}


extension RecentRateVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentRateCell", for: indexPath) as! RecentRateViewCell
//        cell.imageCountry = da
//        cell.imageCountry.layer.cornerRadius = singleRadius
//        cell.rusNamesOfQuotes =
//        cell.engNamesOfQuotes =
//        cell.course =
//        cell.diffCourse =
        
     return cell
    }
}
