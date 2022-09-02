import Foundation

struct NetworkManagerCoinLayer {
    
    fileprivate let apiKey = "6668744690fd8c840e335ed7d0ca796f"
    
    func fetchData() {
        
        let urlString = "https://api.coinlayer.com/api/live?access_key=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) { data, response, error in
            
            guard error != nil else { return }
            print(error!)
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            print(httpResponse)
            
            if let data = data {
                parseJson(data: data)
            }
        }
        dataTask.resume()
    }
    
    
    fileprivate func parseJson(data: Data) {
        
        let decoder = JSONDecoder()
        
        do {
            let currentData = try decoder.decode(ModelCoinLayer.self, from: data)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
