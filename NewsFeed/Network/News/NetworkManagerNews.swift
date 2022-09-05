import Foundation



struct NetworkManager {
   
    fileprivate let apiKey = "4ace509310244680ae2b2a43a8341974"
    lazy var stringForUrl = fetchDataByCountrysHeadlines(country: .UnitedStates)

    //MARK: Everything By Phrase
    func fetchDataByPhrase(phrase: String) -> String {
        
        return "https://newsapi.org/v2/everything?q=\(phrase)&apiKey=\(apiKey)"
    }
    
    //MARK: Top headlines in country
    func fetchDataByCountrysHeadlines(country: CountrysCodes) -> String {
        
        return "https://newsapi.org/v2/top-headlines?country=\(country)&apiKey=\(apiKey)"
    }
    
    //MARK: Top headlines by Phrase
    func fetchDataByTopHeadlines(phrase: String) -> String {
        
        return "https://newsapi.org/v2/top-headlines?q=\(phrase)&apiKey=\(apiKey)"
        
    }
    
    //MARK: Categorys & Countrys
    func fetchDataByCategory(country: CountrysCodes, category: CategoryNews) -> String {
        
        return "https://newsapi.org/v2/top-headlines?country=\(country)&category=\(category)&apiKey=\(apiKey)"
    }
    
    func fetchData(urlString: String, completionHandler: @escaping (CurrentPost) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 10.0)
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            guard error != nil else { return }
            print(error!)
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            print(httpResponse)
            
            if let data = data {
                if let currentPost = parseJson(data: data) {
                    completionHandler(currentPost)
                }
            }
        }
        dataTask.resume()
    }
    
    
    func parseJson(data: Data) -> CurrentPost? {
        
        let decoder = JSONDecoder()
        do {
            let currentData = try decoder.decode(ModelNews.self, from: data)
            guard let currentPost = CurrentPost(modelNews: currentData) else { return nil }
            return currentPost
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}




//static func downloadImage(url: String, completion: @escaping (_ image: UIImage) -> ()) {
//    guard let url = URL(string: url) else { return }
//    let session = URLSession.shared
//    session.dataTask(with: url) { (data, response, error) in
//        if let data = data, let image = UIImage(data: data) {
//            DispatchQueue.main.async {
//                completion(image)
//            }
//        }
//    }.resume()
//}
