import Foundation


fileprivate let apiKey = "4ace509310244680ae2b2a43a8341974"

//MARK: Everything By Phrase
func urlByPhrase(phrase: String) -> String {
    return "https://newsapi.org/v2/everything?q=\(phrase)&apiKey=\(apiKey)"
}

//MARK: Top headlines in country
func urlByCountrysHeadlines(country: CountrysCodes) -> String {
    return "https://newsapi.org/v2/top-headlines?country=\(country)&apiKey=\(apiKey)"
}

//MARK: Top headlines by Phrase
func urlByTopHeadlines(phrase: String) -> String {
    return "https://newsapi.org/v2/top-headlines?q=\(phrase)&apiKey=\(apiKey)"
}

//MARK: Categorys & Countrys
func urlByCategoryAndPhrase(country: CountrysCodes, category: CategoryNews) -> String {
    return "https://newsapi.org/v2/top-headlines?country=\(country)&category=\(category)&apiKey=\(apiKey)"
}

