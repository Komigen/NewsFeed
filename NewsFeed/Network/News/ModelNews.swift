import Foundation


struct ModelNews: Codable {
    let status:       String
    let totalResults: Int
    let articles:     [Article]
}

struct Article: Codable {
    let source:                    Source?
    let author:                    String?
    let title, articleDescription: String?
    let url:                       String?
    let urlToImage:                String?
    let publishedAt:               Date?
    let content:                   String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

struct Source: Codable {
    let id:   String?
    let name: String?
}


