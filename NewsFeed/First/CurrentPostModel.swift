import UIKit

//MARK: Init Post

final class CurrentPostModel {
    
    let sourceName:         String?
    let author:             String?
    let title:              String?
    let articleDescription: String?
    let url:                String?
    let urlToImage:         String?
    let publishedAt:        String?
    let content:            String?
    
    
   required init(sourceName:         String?,
                 author:             String?,
                 title:              String?,
                 articleDescription: String?,
                 url:                String?,
                 urlToImage:         String?,
                 publishedAt:        String?,
                 content:            String?
    ){
        self.sourceName         = sourceName
        self.author             = author
        self.title              = title
        self.articleDescription = articleDescription
        self.url                = url
        self.urlToImage         = urlToImage
        self.publishedAt        = publishedAt
        self.content            = content
    }
}

//MARK: Init Image

final class CurrentImage {
    
    let image: UIImage?
    
    required init(image: UIImage?) {
        self.image = image
    }
}
