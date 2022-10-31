import UIKit

final class NetworkManagerCoinLayer {
        
    private var arrayRate = [String: Double]()
    
    func fetchDataRates(viewController: UIViewController, completion: @escaping([String: Double]) -> Void) {
        
        guard let url = URL(string: createURL()) else { print("ERROR: URL-address not valid.")
            return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, _, error) in
            
            if let safeError = error {
                print(safeError.localizedDescription)
                DispatchQueue.main.async {
                    viewController.present(createAlertController().createErrorAlert(), animated: true)
                }
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
        } catch let error {
            print("ERROR: parse JSON CoinLayer. \(error.localizedDescription). Необходимо заменить ключ на следующий")
        }
    }
}

//MARK: Create URL

extension NetworkManagerCoinLayer {
    private var apiKey1: String { return "6668744690fd8c840e335ed7d0ca796f" }
    private var apiKey2: String { return "bb5e94afb7945f8762b53977431c32ea" }
    private var apiKey3: String { return "4ee82450cd9923f7f05beab02782ef7c" }

    func createURL() -> String {
        return "http://api.coinlayer.com/api/live?access_key=\(apiKey3)&target=USD"
    }
}
