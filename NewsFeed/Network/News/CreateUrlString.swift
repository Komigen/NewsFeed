import Foundation

struct CreateUrlString {
    
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
}
