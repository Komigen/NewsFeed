import Foundation
import UIKit

final class NetworkManagerNewsApi {
    
    func fetchData(viewController: UIViewController, urlString: String, completion: @escaping (Result<[Article], Error>) -> Void) {
        
        guard let url = URL(string: urlString) else { print("ERROR: posts URL-address not valid.")
            return }
        
        let request = URLRequest(url: url)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) { (data, _, error) -> Void in
            
            if let safeError = error {
                print(safeError.localizedDescription)
                DispatchQueue.main.async {
                    viewController.present(createAlertController().createErrorAlert(), animated: true)
                }
            }
            
            if let safeData = data {
                
                do {
                    let result = try JSONDecoder().decode(ModelNews.self, from: safeData)
                    completion(.success(result.articles ?? []))
                    print("SUCCESSED: parsing JsonData. Fetch - \(String(describing: result.articles?.count)) articles")
                } catch {
                    completion(.failure(error))
                    print("ERROR: parsing JsonData. \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}
