import Foundation

class CreateStringUrl {
        
    fileprivate let apiKey = "4ace509310244680ae2b2a43a8341974"
    
    //MARK: Everything By Phrase
    func byPhrase(phrase: String) -> String {
        return "https://newsapi.org/v2/everything?q=\(phrase)&apiKey=\(apiKey)"
    }
    
    //MARK: Top headlines in country
    func byCountrysHeadlines(countryCodes: String) -> String {
        return "https://newsapi.org/v2/top-headlines?country=\(countryCodes)&apiKey=\(apiKey)"
    }
    
    //MARK: Top headlines by Phrase
//    func byTopHeadlines(phrase: String) -> String {
//        return "https://newsapi.org/v2/top-headlines?q=\(phrase)&apiKey=\(apiKey)"
//    }
    
}
