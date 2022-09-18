import Foundation
import UIKit

//MARK: Model for parse JSON data

struct DataModel: Codable {
    var success: Bool?
    var terms, privacy: String?
    var timestamp: Int?
    var target: String?
    var rates: [String: Double]?
    
    enum CodingKeys: String, CodingKey {
        case success, terms, privacy, timestamp, rates
        case target = "nameRate"
    }
}


//MARK: Model for init current rate

struct CurrentRate {
    
    let nameRate: String?
    let rateKey: String?
    let rateValue: String?
    
    init?(dataModel: DataModel) {
        self.nameRate = dataModel.target
        self.rateKey = dataModel.rates?.first?.key
        self.rateValue = "\(String(describing: dataModel.rates?.first?.value)))"
    }
}
