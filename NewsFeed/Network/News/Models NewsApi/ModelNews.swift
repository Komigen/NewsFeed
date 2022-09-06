import Foundation

struct ModelNews: Codable {
    var status: String = ""
    var totalResults: Int = 10
    var articles: [Article]?
}


