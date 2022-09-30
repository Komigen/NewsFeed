import Foundation
import RealmSwift

// MARK: - Модель для сохранения данных в Realm

class PostRealmModel: Object {
    
    @objc dynamic var url:          String?
    @objc dynamic var title:        String?
    @objc dynamic var urlToImage:   String?
    @objc dynamic var date:         String?
    @objc dynamic var source:       String?
    @objc dynamic var shortContent: String?
}


