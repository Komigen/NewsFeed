import UIKit

//MARK: Download image

extension UIImageView {
    
    func downloadImagePost(stringUrl: String) {
        
        guard let url = URL(string: stringUrl), UIApplication.shared.canOpenURL(url) else { print("ERROR: image URL-address not valid.")
            return }
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let safeData = data, error == nil {
                DispatchQueue.main.async {
                    self.image = UIImage(data: safeData)
                }
            }
        }
        task.resume()
    }
    
    func downloadImageCoin(shortName: String) {
        guard let url = URL(string: "https://assets.coinlayer.com/icons/\(shortName).png"), UIApplication.shared.canOpenURL(url) else { print("ERROR: imageCoin URL-address not valid.")
            return }
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let safeError = error {
                print(safeError)
            }
            if let safeData = data, error == nil {
                DispatchQueue.main.async {
                    self.image = UIImage(data: safeData)
                }
            }
        }
        task.resume()
    }
}
