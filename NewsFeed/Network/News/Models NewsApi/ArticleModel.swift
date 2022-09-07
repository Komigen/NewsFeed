import Foundation

struct Article: Codable {
    var source: Source?
    var author: String?
    var title, articleDescription: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    var id: String? {
        source?.id
    }
    var name: String? {
        source?.name
    }

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}
