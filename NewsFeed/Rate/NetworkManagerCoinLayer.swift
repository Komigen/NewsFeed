import UIKit

final class NetworkManagerCoinLayer {
    
    
    
    private var arrayRate = [String: Double]()
    
    func fetchDataRates(completion: @escaping([String: Double]) -> Void) {
        
        guard let url = URL(string: createURL()) else { print("ERROR: URL-address not valid.")
            return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, _, error) in
            
            if let safeError = error {
                print(safeError)
            }
            
            if let safeData = data {
                self.parseJSON(withData: safeData)
                completion(self.arrayRate)
            }
        }
        task.resume()
    }
    
    private func parseJSON(withData data: Data) {
        do {
            let currentData = try JSONDecoder().decode(RatesModel.self, from: data)
            self.arrayRate = currentData.rates
        } catch {
            print("ERROR: parse JSON CoinLayer")
        }
    }
}

//MARK: Create URL

extension NetworkManagerCoinLayer {
    private var apiKey1: String { return "6668744690fd8c840e335ed7d0ca796f" }
    private var apiKey2: String { return "bb5e94afb7945f8762b53977431c32ea" }
    
    func createURL() -> String {
        return "http://api.coinlayer.com/api/live?access_key=\(apiKey2)&target=USD"
    }
}
