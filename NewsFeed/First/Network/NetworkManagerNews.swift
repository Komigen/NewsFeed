import Foundation

final class NetworkManagerNewsApi {
        
    func fetchData(urlString: String, completionHandler: @escaping (Result<[Article], Error>) -> Void) {
        
        guard let url = URL(string: urlString) else { print("ERROR: posts URL-address not valid."); return }
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10.0)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) { (data, _, error) -> Void in
            
            if error != nil {
                print(error!)
            }
            
            if let safeData = data {
               
                do {
                    let result = try JSONDecoder().decode(ModelNews.self, from: safeData)
                    completionHandler(.success(result.articles ?? []))
                    print("SUCCESSED: parsing JsonData. Fetch - \(String(describing: result.articles?.count)) articles")
                } catch {
                    completionHandler(.failure(error))
                    print("ERROR: parsing JsonData. \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}


//MARK: Model NewsApi

struct ModelNews: Codable {
    var articles: [Article]?
}


struct Article: Codable {
    var author: String?
    var title: String?
    var articleDescription: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    var source: Source?

    var name: String? {
        source?.name
    }
    
    enum CodingKeys: String, CodingKey {
        case source, author, title, url, urlToImage, publishedAt, content
        case articleDescription = "description"
    }
}


struct Source: Codable {
    var name: String?
}

