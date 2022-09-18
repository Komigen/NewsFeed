import Foundation
import UIKit

//MARK: Model for parse JSON data

struct DataModel: Codable {
        var target: String?
        var rates: [String: Double]?
}

//MARK: Model for parse data Image

struct ImageDataModel: Codable {
        var image: UIImage?
}

//MARK: Model for init current rate

struct CurrentRate {
    
    let target: String?
    let rateKey: String?
    let rateValue: Double?

//    var image: UIImage?  {
//        switch target {
//
//        case "BTC": return ""
//        case "ETH": return ""
//        case "BCH": return ""
//        case "EOS": return ""
//        case "LTC": return ""
//        case "XMR": return ""
//        case "XRP": return ""
//
//        default:
//            return "default"
//    }
    
    init?(dataModel: DataModel, imageDataModel: ImageDataModel) {
        self.target = dataModel.target
        self.rateKey = dataModel.rates?.first?.key
        self.rateValue = dataModel.rates?.first?.value
        self.image = imageDataModel.image
    }
}
