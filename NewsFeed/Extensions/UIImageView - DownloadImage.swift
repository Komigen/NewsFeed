import UIKit

//MARK: Download image

extension UIImageView {
    
    func downloadImagePost(stringUrl: String) {
        
        // COMMENT: Ты уверен, что достаточно просто принтануть ошибку? Может стоит создать ошибку, вернуть ее на UI, и показать пользователю какой нибудь плейсхолдер? Или сообщение, что не удалось загрузить? Я как пользователь консоль то не увижу, и картинка не загрузится, и буду недоумевать, что произошло.
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
        print("SUCCESSED downloading ImagePost")
    }
    
    func downloadImageCoin(shortName: String) {
        guard let url = URL(string: "https://assets.coinlayer.com/icons/\(shortName).png"), UIApplication.shared.canOpenURL(url) else { print("ERROR: imageCoin URL-address not valid.")
            return }
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let safeError = error {
                print(safeError)
                // COMMENT: никак не обработал кейс с ошибкой сети
            }
            if let safeData = data, error == nil {
                DispatchQueue.main.async {
                    self.image = UIImage(data: safeData)
                }
            }
        }
        task.resume()
        //                print("SUCCESSED downloading ImageCoin")
    }
}
