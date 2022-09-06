import Foundation
import UIKit


struct NetworkManager {
    
    var onCompletion: ((CurrentPost, UIImage) -> Void)?
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
    
    
    
    func fetchData(urlString: String) {

        guard let url = URL(string: urlString) else { return }
        
        let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
           
            if error != nil {
//                print(error!)
            }
            
            if response is HTTPURLResponse {
//            print(response!)
            }
            
            if let data = data {
                let currentPost = parseJson(data: data)
                if let urlToImage = currentPost?.urlToImage {
                        downloadImage(url: urlToImage) { image in
                            self.onCompletion?(currentPost!, image)
                            print("ERROR - download image")
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    
    
    func downloadImage(url: String, completion: @escaping (_ image: UIImage) -> ()) {
        guard let url = URL(string: url) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }.resume()
    }
    
    
    
   fileprivate func parseJson(data: Data) -> CurrentPost? {
        
        do {
            let currentData = try JSONDecoder().decode(ModelNews.self, from: data)

            guard let currentPost = CurrentPost(modelNews: currentData) else { return nil }
           
            print("Sucessed parsing JsonData")
            return currentPost
        } catch _ as NSError {
            debugPrint("ERROR - parse JsonData")
        }
        return nil
    }
}




//    func getImage(from string: String) -> UIImage? {
//        guard let url = URL(string: string)
//            else {
//                print("Unable to create URL")
//                return nil
//        }
//
//        var image: UIImage? = nil
//        do {
//
//            let data = try Data(contentsOf: url, options: [])
//
//            image = UIImage(data: data)
//        }
//        catch {
//            print(error.localizedDescription)
//        }
//
//        return image
//    }








