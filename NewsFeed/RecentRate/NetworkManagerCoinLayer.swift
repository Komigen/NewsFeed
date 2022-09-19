import UIKit

private let apiKey    = "6668744690fd8c840e335ed7d0ca796f"
fileprivate let urlString = "http://api.coinlayer.com/api/live?access_key=\(apiKey)&target=USD"


class NetworkManagerCoinLayer {
    
    var arrayRate = [String: Double]()
    
    func fetchDataRates(completion: @escaping([String: Double]) -> Void) {
        
        guard let url = URL(string: urlString) else { print("ERROR: URL-address not valid."); return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                
                
                if error != nil {
                    print(error!)
                }
                
                if let safeData = data {
                    self.parseJSON(withData: safeData)
                    completion(self.arrayRate)
                }
            }
        }
        task.resume()
    }
    
    
    
    fileprivate func parseJSON(withData data: Data){
        do {
            let currentData = try JSONDecoder().decode(RatesModel.self, from: data)
            self.arrayRate = currentData.rates
        } catch {
            print("ERROR: parse JSON CoinLayer")
        }
    }
}
