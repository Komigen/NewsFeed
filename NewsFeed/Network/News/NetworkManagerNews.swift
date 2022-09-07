import Foundation
import UIKit

struct NetworkManagerNewsApi {
    
    var firstVC = FirstVC()
    
    func fetchData(urlString: String) {
        
        guard let url = URL(string: urlString) else { return }
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10.0)
        
        let session = URLSession.shared
        session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            
            if error != nil, response != nil {
                 print(error!)
                 print(response!)
            }
            
            if let safeData = data {
                currentPosts = parseJson(safeData: safeData)!
            }
        }.resume()
    }
    
    //MARK: Parse JSON
    fileprivate func parseJson(safeData: Data) -> [Article]? {
        do {
            let currentData = try JSONDecoder().decode(ModelNews.self, from: safeData)
            currentPosts = currentData.articles!
            if !currentPosts.isEmpty {
                DispatchQueue.main.async {
                    firstVC.tableView.reloadData()
                }
            }
            print("Successed parsing JsonData")
            return currentPosts
        } catch _ as NSError {
            debugPrint("ERROR - parse JsonData")
        }
        return nil
    }
}
    










//
//
//fileprivate func downloadImage(url: String, completion: @escaping (_ image: UIImage) -> ()) {
//     guard let url = URL(string: url) else { return }
//     let session = URLSession.shared
//     session.dataTask(with: url) { (data, response, error) in
//         if let data = data, let image = UIImage(data: data) {
//             DispatchQueue.main.async {
//                 completion(image)
//             }
//         }
//     }.resume()
// }
