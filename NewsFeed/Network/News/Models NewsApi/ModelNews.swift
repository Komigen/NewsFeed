import Foundation

struct ModelNews: Codable {
    var status: String = ""
    var totalResults: Int
    var articles: [Article]?
}



