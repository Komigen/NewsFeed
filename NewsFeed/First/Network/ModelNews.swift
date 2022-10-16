import Foundation

//MARK: Model NewsApi

struct ModelNews: Codable {
    var articles: [Article]?
}

struct Article: Codable {
    var author:             String?
    var title:              String?
    var articleDescription: String?
    var url:                String?
    var urlToImage:         String?
    var publishedAt:        String?
    var content:            String?
    
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
