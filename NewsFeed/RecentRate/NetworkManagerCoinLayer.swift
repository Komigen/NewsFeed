import Foundation

private let apiKey    = "6668744690fd8c840e335ed7d0ca796f"
private let urlString = "http://api.coinlayer.com/api/live?access_key=\(apiKey)&symbols=BTC,ETH,BCH,EOS,LTC,XMR,XRP&target=USD"

private enum UrlDownloadImage: String {
    case BTC = "https://assets.coinlayer.com/icons/BTC.png"
    case ETH = "https://assets.coinlayer.com/icons/ETH.png"
    case BCH = "https://assets.coinlayer.com/icons/BCH.png"
    case EOS = "https://assets.coinlayer.com/icons/EOS.png"
    case LTC = "https://assets.coinlayer.com/icons/LTC.png"
    case XMR = "https://assets.coinlayer.com/icons/XMR.png"
    case XRP = "https://assets.coinlayer.com/icons/XRP.png"
}

class NetworkManagerCoinLayer {
    
    func fetchData() {
        
        guard let url = URL(string: urlString) else { print("ERROR: URL-address not valid."); return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, _, error) in
            
            if error != nil {
                print(error!)
            }
            
            if let safeData = data {
                if let currentWeather = self.parseJSON(withData: data) {
//                    print("SUCCESSED: parsing JsonData")
//                    print("ERROR: parsing JsonData. \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}


fileprivate func parseJSON(withData data: Data) -> CurrentWeather? {
    let decoder = JSONDecoder()
    do {
        let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
        guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else {
            return nil
        }
        return currentWeather
    } catch let error as NSError {
        print(error.localizedDescription)
    }
    return nil
}
