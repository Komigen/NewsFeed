import UIKit

//MARK: Animated tableView

extension UITableView {
    
    public func animateTableView() {
        self.reloadData()
        
        let cells = self.visibleCells
        let tableViewHeight = self.bounds.height
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
    
    public func downloadImagePost(stringUrl: String) {
        
        guard let url = URL(string: stringUrl), UIApplication.shared.canOpenURL(url) else { print("ERROR: image URL-address not valid."); return }
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let safeData = data, error == nil {
                DispatchQueue.main.async {
                    self.image = UIImage(data: safeData)
                }
            }
        }
        task.resume()
        print("SUCCESSED downloading ImagePost")
    }
    
    public func downloadImageCoin(shortName: String) {
        guard let url = URL(string: "https://assets.coinlayer.com/icons/\(shortName).png"), UIApplication.shared.canOpenURL(url) else { print("ERROR: imageCoin URL-address not valid."); return }
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let safeData = data, error == nil {
                DispatchQueue.main.async {
                    self.image = UIImage(data: safeData)
                }
            }
        }
        task.resume()
//        print("SUCCESSED downloading ImageCoin")
    }
}

//MARK: Date Formatter

extension String {
    
    public mutating func getFormattedDate(stringDate: String?) {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MM-dd-yyyy HH:mm"
        
        let date: Date? = dateFormatterGet.date(from: "2018-02-01T19:10:04+00:00")
        
        self = dateFormatterPrint.string(from: date!)
    }
}

//MARK: Settings SearchBar

extension UISearchBar {
    
    public func createSettings() {
        self.layer.cornerRadius = 16.0
        self.clipsToBounds      = true
        self.barTintColor       = systemGray6Color
        self.layer.cornerRadius = 16.0
        self.clipsToBounds      = true
    }
}
