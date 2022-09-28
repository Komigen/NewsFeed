import Foundation
import RealmSwift


// MARK: - Модель для сохранения данных в Realm

class PostRealmModel: Object {
    
    @objc dynamic var sourceName:         String?
    @objc dynamic var author:             String?
    @objc dynamic var title:              String?
    @objc dynamic var articleDescription: String?
    @objc dynamic var url:                String?
    @objc dynamic var urlToImage:         String?
    @objc dynamic var publishedAt:        String?
    @objc dynamic var content:            String?
}


