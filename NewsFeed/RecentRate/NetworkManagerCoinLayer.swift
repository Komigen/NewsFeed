import Foundation

private let apiKey    = "6668744690fd8c840e335ed7d0ca796f"
private let urlString = "https://api.coinlayer.com/api/live?access_key=\(apiKey)&symbols=BTC,ETH,BCH,EOS,LTC,XMR,XRP&target=USD"


class NetworkManagerCoinLayer {
    
    var onCompletion: (([CurrentRate]) -> Void)?
    
    func fetchData() {
        
        guard let url = URL(string: urlString) else { print("ERROR: URL-address not valid."); return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, _, error) in
            
            if error != nil {
                print(error!)
            }
            
            if let safeData = data {
                if let currentRate = self.parseJSON(withData: safeData) {
                    self.onCompletion?(currentRate)
                    print("SUCCESSED: parsing JsonData")
                }
            } else {
                print("ERROR: parsing JsonData")
            }
        }
        task.resume()
    }
    
    
    
    fileprivate func parseJSON(withData data: Data) -> [CurrentRate]? {
        do {
            let currentData = try JSONDecoder().decode([DataModel].self, from: data)
            var currentRates: [CurrentRate]?
            try currentData.forEach({ rate in
                currentRates?.append(CurrentRate(dataModel: rate)!)
            })
                return currentRates
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
