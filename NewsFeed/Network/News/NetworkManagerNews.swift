import Foundation

struct NetworkManagerNews {
    
    func fetchData(urlString: String) {
        
        let headers = [
            "X-RapidAPI-Key": "41c634c3e3mshc3d197ebeec7048p14f411jsn02bf6ad63569",
            "X-RapidAPI-Host": "google-news.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://google-news.p.rapidapi.com/v1/search?q=Elon%20Musk&country=US&lang=en")!
                                          as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest){ (data, response, error) -> Void in
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
            let currentData = try decoder.decode(ModelNews.self, from: data)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}

