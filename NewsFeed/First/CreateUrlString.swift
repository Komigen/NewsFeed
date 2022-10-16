import Foundation

extension NetworkManagerNewsApi {
    
    fileprivate var apiKey: String { return "4ace509310244680ae2b2a43a8341974" }
    
    //MARK: Everything By Phrase
    func createURL(phrase: String) -> String {
        return "https://newsapi.org/v2/everything?q=\(phrase)&apiKey=\(apiKey)"
    }
    
    //MARK: Top headlines in country
    func createURL(countryCodes: String) -> String {
        return "https://newsapi.org/v2/top-headlines?country=\(countryCodes)&apiKey=\(apiKey)"
    }
    
    //MARK: Top headlines by Phrase
//    func createURL(phrase: String) -> String {
//        return "https://newsapi.org/v2/top-headlines?q=\(phrase)&apiKey=\(apiKey)"
//    }
}
